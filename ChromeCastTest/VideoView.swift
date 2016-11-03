//
//  VideoView.swift
//  NatGeoPrototype01
//
//  Created by Richard Adem on 5/16/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

/* 
 
 Might need this later to extract single frame of video:
 http://stackoverflow.com/questions/4294996
 
 */

import UIKit
import AVFoundation

public protocol VideoViewDataSource : class {
    func videoViewUrlString(_ videoView: VideoView) -> String?
}

public protocol VideoViewDelegate : class {
    func videoView(_ videoView:VideoView, timeDidChange time:CMTime)
    func videoViewVideoDidEnd(_ videoView:VideoView)
}

open class VideoView : UIView {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var timeObserverToken: AnyObject?
    
    let timeObserverInterval = 0.01
    
    var loop = true
    
    // Why doesn't this appear in interface builder
    weak open var dataSource:VideoViewDataSource?
    weak open var delegate:VideoViewDelegate?
    
    open var volume:Float = 1.0 {
        didSet {
            player?.volume = volume
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if let playerLayer = playerLayer {
            playerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height);
        }
    }
    
    // MARK: Notifications
    
    func playerItemDidReachEnd(_ notification: Notification) {
        delegate?.videoViewVideoDidEnd(self)
        if let playerItem = notification.object , loop == true {
            (playerItem as AnyObject).seek(to: kCMTimeZero)
        }
    }
    
    func willEnterForeground(_ notification: Notification) {
        if player != nil && player!.rate == 0 {
            player!.play()
        }
    }
    
    // MARK: Public controls
    
    func play() {
        if let urlString = dataSource?.videoViewUrlString(self) {
            
            let url:URL = {
                if urlString.contains("http") {
                    if let u =  URL(string: urlString) {
                        return u
                    }
                } else {
                    
                    let pathExtention = URL(fileURLWithPath: urlString).pathExtension
                    let pathPrefix = NSURL(fileURLWithPath: urlString).deletingPathExtension?.lastPathComponent
                    
                    if let u = Bundle.main.url(forResource: pathPrefix, withExtension: pathExtention) {
                        return u
                    }
                }
                
                return URL(string: "#")!
            }()
            
            
            
            if player == nil || playerLayer == nil {
            
                
                player = AVPlayer(url: url)
                if let player = player {
                    player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
                    
                    // This is for air play
                    player.allowsExternalPlayback = true
                    player.usesExternalPlaybackWhileExternalScreenIsActive = true
                    
                    playerLayer = AVPlayerLayer(player: player)
                    if let playerLayer = playerLayer {
                        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                    }
                    
                    

                    timeObserverToken = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: timeObserverInterval, preferredTimescale: Int32(NSEC_PER_SEC))
                        , queue: DispatchQueue.main
                        , using: { [weak self]  (time) in
                            self?.delegate?.videoView(self!, timeDidChange: time)
                    }) as AnyObject?
                    
                    
                }
            } else {
//                let asset = AVAsset(URL: url)
                
                
                let playItem = AVPlayerItem(url: url)
                
                player?.replaceCurrentItem(with: playItem)
            }
            
            
            
            if let player = player, let playerLayer = playerLayer {
                
                NotificationCenter.default.addObserver(self
                    , selector: #selector(playerItemDidReachEnd(_:))
                    , name: NSNotification.Name.AVPlayerItemDidPlayToEndTime
                    , object: player.currentItem)
                NotificationCenter.default.addObserver(self
                    , selector: #selector(willEnterForeground(_:))
                    , name: NSNotification.Name("kApplicationWillEnterForeground")//NSNotification.Name(rawValue: GlobalNotification.ApplicationWillEnterForeground.rawValue)
                    , object: nil)
                
                player.play()
                
                let muteVideos = false
                if muteVideos {
                    player.volume = 0
                }
                layer.insertSublayer(playerLayer, at: 0)
            }
        }
    }
    
    func pause() {
        
        if let player = player {
            player.pause()
        }
        NotificationCenter.default.removeObserver(self)
    }
    
    var isPlaying:Bool {
        if let player = player , player.rate != 0 {
            return true
        }
        
        return false
    }
    
    var videoSize:CGSize {
        
//        let asset = AVAsset(URL: url)
//        let videoTrack = asset.tracksWithMediaType(AVMediaTypeVideo)[0]
//        let size = videoTrack.naturalSize
//        let txf = videoTrack.preferredTransform
//        
//        let realVidSize = CGSizeApplyAffineTransform(size, txf)
        if let player = player, let currentItem = player.currentItem {
//            return currentItem.presentationSize
            
            let asset = currentItem.asset
            let videoTrack = asset.tracks(withMediaType: AVMediaTypeVideo)[0]
            let size = videoTrack.naturalSize
            let txf = videoTrack.preferredTransform
            
            let realVidSize = size.applying(txf)
            
            return realVidSize
        }
        return CGSize.zero
    }
    
    
    // MARK: Memory management
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

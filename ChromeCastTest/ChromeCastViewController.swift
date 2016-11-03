//
//  ChromeCastViewController.swift
//  ChromeCastTest
//
//  Created by Richard Adem on 11/2/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit
import GoogleCast

enum PlaybackMode {
    case none
    case local
    case remote
}

class ChromeCastViewController: UIViewController {
    
    // MARK: - View
    
    var contentView:ChromeCastView {
        get {
            return self.view as! ChromeCastView
        }
    }
    
    // MARK: - 
    
    let _sessionManager = GCKCastContext.sharedInstance().sessionManager
    var _castSession:GCKCastSession? = nil
    let _castMediaController = GCKUIMediaController()
    var _playbackMode:PlaybackMode = .none
    
    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = ChromeCastView()
        
        _sessionManager.add(self)
        //tabBarItem = UITabBarItem(title: "ChromeCast", image: UIImage(named: "NotConnected"), selectedImage: UIImage(named: "Connected"))
        // Relationships between view controller and view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    // MARK: - Memory manager
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK - Media controls
extension ChromeCastViewController {
    
    func continueAfterPlayButtonClicked() -> Bool {
        print("continueAfterPlayButtonClicked")
        let hasConnectedCastSession = GCKCastContext.sharedInstance().sessionManager.hasConnectedSession()
        if hasConnectedCastSession {
            playSelectedItemRemotely()
            return false
        }
        return true
    }
    
    func buildMediaInformation() -> GCKMediaInformation {
        let metadata = GCKMediaMetadata(metadataType: .movie)
        metadata.setString("video title", forKey: kGCKMetadataKeyTitle)
        metadata.setString("video subtitle", forKey: kGCKMetadataKeySubtitle)
        metadata.setString("video studio", forKey: kGCKMetadataKeyStudio)
        
        metadata.addImage(GCKImage(url: URL(string: "https://placekitten.com/480/720")!, width: 480, height: 720))
        metadata.addImage(GCKImage(url: URL(string: "http://www.fillmurray.com/480/720")!, width: 480, height: 720))
        
        //"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        let mediaInfo = GCKMediaInformation(contentID: "https://commondatastorage.googleapis.com/gtv-videos-bucket/CastVideos/mp4/GoogleIO-2014-CastingToTheFuture.mp4"
            , streamType: .buffered
            , contentType: "video/mp4"
            , metadata: metadata
            , streamDuration: 5000
            , mediaTracks: nil
            , textTrackStyle: nil
            , customData: nil)
        
        
        return mediaInfo
    }
    
    func playSelectedItemRemotely() {
        if let castSession = GCKCastContext.sharedInstance().sessionManager.currentCastSession {
            castSession.remoteMediaClient?.loadMedia(buildMediaInformation(), autoplay: true)
        }
        
    }
    
    func switchToLocalPlayback() {
        print("switchToLocalPlayback")
        
        guard _playbackMode != .local else {
            return
        }
        
        //var playPosition = TimeInterval(0)
        //var paused = false
        var ended = false
        
        if _playbackMode == .remote {
            //playPosition = _castMediaController.lastKnownStreamPosition
            //paused = _castMediaController.lastKnownPlayerState == .paused
            ended = _castMediaController.lastKnownPlayerState == .idle
            
            print("last player state: \(_castMediaController.lastKnownPlayerState), ended: \(ended)")
        }
        
        // populateMediaInfo()...
        
        _castSession?.remoteMediaClient?.remove(self as! GCKRemoteMediaClientListener)
        _castSession = nil
        
        _playbackMode = .local
    }
    
    func switchToRemotePlayback() {
        print("switchToRemotePlayback; ")
        
        guard _playbackMode != .remote else {
            return
        }
        
        _castSession = _sessionManager.currentCastSession
        
        // If we were playing locally, load the local media on the remote player
        if _playbackMode == .local {
            let playPosition = TimeInterval(0)
            let paused = false
            let builder = GCKMediaQueueItemBuilder()
            
            builder.mediaInformation = buildMediaInformation()
            builder.autoplay = !paused
            builder.preloadTime = TimeInterval(30)
            
            let item = builder.build()
            
            _castSession?.remoteMediaClient?.queueLoad([item]
                , start: 0
                , playPosition: playPosition
                , repeatMode: .all
                , customData: nil)
            
        }
        _playbackMode = .remote
    }
 
}

extension ChromeCastViewController: GCKSessionManagerListener {
    
    func sessionManager(_ sessionManager: GCKSessionManager, didStart session: GCKSession) {
        print("ChromeCastViewController: sessionManager didStartSession \(session)")
        switchToRemotePlayback()
    }
    func sessionManager(_ sessionManager: GCKSessionManager, didResumeSession session: GCKSession) {
        print("ChromeCastViewController: sessionManager didResumeSession \(session)")
        switchToRemotePlayback()
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didEnd session: GCKSession, withError error: Error?) {
        print("session ended with error: \(error)")
        print("The Casting session has ended. \(error?.localizedDescription)")
        switchToLocalPlayback()
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didFailToStart session: GCKSession, withError error: Error) {
        print("Failed to start a session: \(error)")
    }
    
}

//extension ChromeCastViewController: LocalPlayerViewDelegate {
    
    
    
//}










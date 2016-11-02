//
//  MediaViewController.swift
//  ChromeCastTest
//
//  Created by Richard Adem on 11/2/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit
import GoogleCast

class MediaViewController: UIViewController {
    
    // MARK: - View
    
    var contentView:MediaView {
        get {
            return self.view as! MediaView
        }
    }
    
    // MARK: - 
    
    let _sessionManager = GCKCastContext.sharedInstance().sessionManager
    var _castSession:GCKCastSession? = nil
    let _castMediaController = GCKUIMediaController()
    
    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = MediaView()
        
        _sessionManager.add(self)
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
extension MediaViewController {
    
    func continueAfterPlayButtonClicked() -> Bool {
        print("continueAfterPlayButtonClicked")
        let hasConnectedCastSession = GCKCastContext.sharedInstance().sessionManager.hasConnectedSession()
        if hasConnectedCastSession {
//            playSelectedItemRemotely()
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
        
        
        let mediaInfo = GCKMediaInformation(contentID: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
            , streamType: .buffered
            , contentType: "video/mp4"
            , metadata: metadata
            , streamDuration: 5000
            , mediaTracks: nil
            , textTrackStyle: nil
            , customData: nil)
        
        
        return mediaInfo
    }
    
    func switchToLocalPlayback() {
    }
    
    func switchToRemotePlayback() {
    }
 
}

extension MediaViewController: GCKSessionManagerListener {
    
    func sessionManager(_ sessionManager: GCKSessionManager, didStart session: GCKSession) {
        print("MediaViewController: sessionManager didStartSession \(session)")
        switchToRemotePlayback()
    }
    func sessionManager(_ sessionManager: GCKSessionManager, didResumeSession session: GCKSession) {
        print("MediaViewController: sessionManager didResumeSession \(session)")
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

//extension MediaViewController: LocalPlayerViewDelegate {
    
    
    
//}










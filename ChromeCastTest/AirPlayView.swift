//
//  AirPlayView.swiftView
//  ChromeCastTest
//
//  Created by Richard Adem on 11/3/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class AirPlayView: UIView {
    
    // MARK - Subviews lazy var
    lazy var videoView:VideoView = {
        let videoView = VideoView()
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.dataSource = self
        videoView.delegate = self
        self.addSubview(videoView)
        return videoView
    }()
    
    lazy var airPlayControl:MPVolumeView = {
        let airPlayControl = MPVolumeView()
        airPlayControl.translatesAutoresizingMaskIntoConstraints = false
        airPlayControl.showsVolumeSlider = false
        
        self.addSubview(airPlayControl)
        return airPlayControl
    }()
    
    internal var hasSetupConstraints = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup this view
        backgroundColor = UIColor(hue: 0.4, saturation: 0.74, brightness: 1.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !hasSetupConstraints {
            hasSetupConstraints = true
            
            // Setup frames or constraints
            videoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
            videoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
            videoView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
            videoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
            
            
            //airPlayControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
            airPlayControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -60).isActive = true
            airPlayControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120).isActive = true
            
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension AirPlayView: VideoViewDataSource {
    func videoViewUrlString(_ videoView: VideoView) -> String? {
        return "https://commondatastorage.googleapis.com/gtv-videos-bucket/CastVideos/mp4/GoogleIO-2014-CastingToTheFuture.mp4"
    }
}
extension AirPlayView: VideoViewDelegate {
    func videoView(_ videoView:VideoView, timeDidChange time:CMTime) {}
    func videoViewVideoDidEnd(_ videoView:VideoView) {}
}


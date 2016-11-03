//
//  MediaView.swiftView
//  ChromeCastTest
//
//  Created by Richard Adem on 11/2/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit
import GoogleCast

class MediaView: UIView {
    
    // MARK - Subviews lazy var
    lazy var chromeCastButton:GCKUICastButton = {
        //GCKUICastButton *castButton =
        //    [[GCKUICastButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        //castButton.tintColor = [UIColor whiteColor];
        
        let chromeCastButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        chromeCastButton.translatesAutoresizingMaskIntoConstraints = false
        chromeCastButton.tintColor = UIColor.red
        chromeCastButton.backgroundColor = UIColor.green
        //chromeCastButton.setTitle("!!", for: .normal)
        chromeCastButton.setInactiveIcon(UIImage(named: "NotConnected")!
            , activeIcon: UIImage(named: "Connected")!
            , animationIcons: [
                UIImage(named: "Connecting0")!
                , UIImage(named: "Connecting0")!
                , UIImage(named: "Connecting0")!
            ])
        
        chromeCastButton.isHidden = false
        self.addSubview(chromeCastButton)
        return chromeCastButton
    }()
    
    internal var hasSetupConstraints = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup this view
        backgroundColor = UIColor(hue: 0.2, saturation: 0.74, brightness: 1.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !hasSetupConstraints {
            hasSetupConstraints = true
            
            // Setup frames or constraints
            chromeCastButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
            chromeCastButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
            chromeCastButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
            chromeCastButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
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

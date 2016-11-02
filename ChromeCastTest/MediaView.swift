//
//  MediaView.swiftView
//  ChromeCastTest
//
//  Created by Richard Adem on 11/2/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit

class MediaView: UIView {
    
    // MARK - Subviews lazy var
    
    internal var hasSetupConstraints = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup this view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !hasSetupConstraints {
            hasSetupConstraints = true
            
            // Setup frames or constraints
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

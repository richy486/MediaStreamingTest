//
//  AirPlayViewController.swift
//  ChromeCastTest
//
//  Created by Richard Adem on 11/3/16.
//  Copyright (c) 2016 Richard Adem. All rights reserved.
//

import UIKit

class AirPlayViewController: UIViewController {
    
    // MARK: - View
    
    var contentView:AirPlayView {
        get {
            return self.view as! AirPlayView
        }
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = AirPlayView()
        
        
        //tabBarItem = UITabBarItem(title: "AirPlay", image: UIImage(named: "AirPlay"), selectedImage: nil)
        // Relationships between view controller and view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentView.videoView.play()
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

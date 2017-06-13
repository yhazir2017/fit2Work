//
//  AboutViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/22/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
class AboutViewController : UIViewController {
    
    
    @IBOutlet weak var openButton: UIButton!
    
    override  func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        openButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:UIControlEvents.touchUpInside)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)

    }
}

//
//  HomeViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/22/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
class HomeViewController : UIViewController {
    

    @IBOutlet weak var openButton: UIButton!
  
    @IBOutlet weak var Menu: UIBarButtonItem!
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController - viewDidLoad")
        if self.revealViewController() != nil {
            Menu.target = self.revealViewController()
            Menu.action = #selector(SWRevealViewController.revealToggle(_:))
            // Do any additional setup after loading the view.

            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
      
        openButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:UIControlEvents.touchUpInside)

  
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)

    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        print("HomeViewController - viewWillDisappear")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("HomeViewController - viewWillAppear")
        if self.revealViewController() != nil {
            Menu.target = self.revealViewController()
            Menu.action = #selector(SWRevealViewController.revealToggle(_:))
            // Do any additional setup after loading the view.
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = 100
          
        }
        
        openButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:UIControlEvents.touchUpInside)
    }
    
}

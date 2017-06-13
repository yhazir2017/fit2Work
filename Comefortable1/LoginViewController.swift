//
//  LoginViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/22/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let prefs = UserDefaults.standard
        let isUserLoggedin = prefs.bool(forKey: "isUserLoggedin")
        if (isUserLoggedin) {
            //self.performSegue(withIdentifier: "loginView", sender: self)
            //self.performSegue(withIdentifier: "sw_rear", sender: self)
            self.performSegue(withIdentifier: "basicMenu", sender: self)
        }
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        let prefs = UserDefaults.standard
        prefs.set(false, forKey: "isUserLoggedin")
        prefs.synchronize()
        self.performSegue(withIdentifier: "loginView", sender: self)
        
        
        
    }
}

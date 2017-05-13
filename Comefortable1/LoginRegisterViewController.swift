//
//  LoginRegisterViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/23/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class LoginRegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
  
    
    @IBOutlet weak var userPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userPassword = userPasswordTextField.text
        let userEmail = userEmailTextField.text
        print("userEmail : \(userEmail) userPassword :\(userPassword)")
        let prefs = UserDefaults.standard
        
        let userEmailStored = prefs.string(forKey: "userEmail")
        let userPasswordStored = prefs.string(forKey: "userPassword")
        print("userEmailStored :\(userEmailStored) userPasswordStored :\(userPasswordStored)")
        
        if (userEmail == userEmailStored){
            if (userPassword == userPasswordStored){
                prefs.set(true, forKey: "isUserLoggedin")
                prefs.synchronize()
               self.dismiss(animated: true, completion: nil)
                print("username and passwords are Correct")
            }
        }
    
    }

}

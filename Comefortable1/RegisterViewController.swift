//
//  RegisterViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/22/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    @IBOutlet weak var repeatedPasswordTextFied: UITextField!
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let repeatedPassword = repeatedPasswordTextFied.text
        
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (repeatedPassword?.isEmpty)!){
            displayAlertMessage(userMsg:"All Fields are required")
            return
            
        }
        if ( userPassword != repeatedPassword){
            displayAlertMessage(userMsg:"Passwords do not match")
            return
        }
        let prefs = UserDefaults.standard
        prefs.setValue(userEmail, forKey: "userEmail")
        prefs.setValue(userPassword, forKey: "userPassword")
        prefs.synchronize()
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is succesfull, Thank you", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true,completion: nil)
                self.performSegue(withIdentifier: "basicMenuSegu", sender: self)
        }
            myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion:nil)
       
    }
    func displayAlertMessage(userMsg : String){
        let myAlert = UIAlertController(title: "Alert", message: userMsg, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

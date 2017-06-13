//
//  MenuViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/20/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var Open: UIBarButtonItem!
//    @IBOutlet weak var menuButton: UIBarButtonItem!
//    
//    @IBOutlet weak var alertButton: UIBarButtonItem!
//    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sideMenus()
//        customizeNavBar()
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func sideMenus(){
//        if revealViewController() != nil{
//            menuButton.target = revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            revealViewController().rearViewRevealWidth = 275
//            revealViewController().rightViewRevealWidth = 160
//            
//            alertButton.target = revealViewController()
//            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
//            
//            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//    }
//
//    func customizeNavBar(){
//        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1/255)
//        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 87/255, blue: 35/255, alpha: 1/255)
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//    }

}

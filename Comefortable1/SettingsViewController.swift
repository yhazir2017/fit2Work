//
//  SettingsViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/22/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController{
    
    
    @IBOutlet var settingsView: UIView!
    
    
  
    @IBOutlet weak var musicStatusSwitch: UISwitch!
    
    @IBOutlet weak var exerciseBriefingTxt: UITextView!
    
    var musicFlag = false
    var musicStatus : String = "without"
    let prefs = UserDefaults.standard
    
    @IBOutlet weak var openButton: UIButton!
    
    
    override  func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        openButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:UIControlEvents.touchUpInside)
        
       // self.navigationController?.navigationBar.isHidden = true
        
        exerciseBriefingTxt.text =  "The Exercise briefing for the User after the settings"
        

        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        var exerciseLength = ""
        var workoutTime = ""
        var dateDataString = ""
        

        exerciseLength = prefs.string(forKey:"exerciseLength")!
        workoutTime = prefs.string(forKey: "workoutTime")!
        dateDataString =  prefs.string(forKey: "dateDataString")!
        
        let deskerciseDefinition = "\(exerciseLength)"+" Minutes Deskercise duration for \n5 different body sections, each includes \n4 workouts in " + "\(workoutTime)" + " Seconds; " + "\(musicStatus)" + " Music" + "\nIn the following schedule(s) : " + "\n"+dateDataString
        
        print(deskerciseDefinition)
        exerciseBriefingTxt.text =  deskerciseDefinition
        

    }
  
    
    @IBAction func goShortExerciseVC(_ sender: Any) {
        
        let userInput = musicFlag
        
        performSegue(withIdentifier: "shortExerciseVC", sender: userInput)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shortExerciseVC" {
            if let destination = segue.destination as? SubViewController{
                destination.musicFlag = (sender as? Bool)!
            }
        }
    }
    
    @IBAction func statusSwitchTapped(_ sender: UISwitch) {
        
        musicStatusSwitch.backgroundColor = UIColor.white
        musicStatusSwitch.layer.cornerRadius = 16.0;

        if  (sender.isOn){
            musicFlag = sender.isOn
            prefs.set(musicFlag, forKey: "musicFlag")
            prefs.synchronize()
            print("musicFlag \(sender.isOn)")
            musicStatusSwitch.thumbTintColor = UIColor.green
            musicStatusSwitch.onTintColor = UIColor.orange
            musicStatus = "with"
            
        }
        else if(sender.isOn == false){
            musicFlag = sender.isOn
            prefs.set(musicFlag, forKey: "musicFlag")
            prefs.synchronize()
            print("musicFlag \(sender.isOn)")
            musicStatusSwitch.thumbTintColor = UIColor.orange
            musicStatusSwitch.onTintColor = UIColor.green
            musicStatus = "without"
            
        }
        
    }
    
         
    
}

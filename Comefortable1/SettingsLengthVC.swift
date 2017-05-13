//
//  SettingsLengthVC.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 5/4/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
import UIKit

class SettingsLengthVC : UIViewController{
  
    @IBOutlet weak var lengthSegment: UISegmentedControl!
    
    
    @IBOutlet weak var exerciseLength: UILabel!
    
    
    @IBOutlet weak var workoutLength: UILabel!
    let prefs = UserDefaults.standard
    var workoutTime   = ""
    
    override  func viewDidLoad() {
        workoutTime = "10"
        exerciseLength.text = "3"
        workoutLength.text = workoutTime
    }
    
    
    @IBAction func lengthSegmentValueChanged(_ sender: Any) {
        
        switch lengthSegment.selectedSegmentIndex {
        case 0:
            print("lengthSegmentValueChanged \(lengthSegment.selectedSegmentIndex)")
            workoutTime = "10"
            exerciseLength.text = "3"
            workoutLength.text = workoutTime
        case 1:
            print("lengthSegmentValueChanged \(lengthSegment.selectedSegmentIndex)")
            workoutTime = "15"
             exerciseLength.text = "5"
            workoutLength.text = workoutTime
        case 2:
            print("lengthSegmentValueChanged \(lengthSegment.selectedSegmentIndex)")
            workoutTime = "24"
             exerciseLength.text = "8"
            workoutLength.text = workoutTime
        default: break
        }
  prefs.set(workoutTime, forKey: "workoutTime")
  prefs.set(exerciseLength.text, forKey: "exerciseLength")
        print("exerciseLength :\(exerciseLength.text!)")
        print("workoutTime :\(workoutLength.text!)")
      
        
    }
}

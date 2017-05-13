//
//  SettingRoutineVC.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 5/4/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
import UIKit

class SettingsRoutineVC : UIViewController{
    
    @IBOutlet weak var datePickerTxt0: UITextField!
    
    
    @IBOutlet weak var datePickerTxt1: UITextField!
    
    
    @IBOutlet weak var datePickerTxt2: UITextField!
    
    
    @IBOutlet weak var datePickerTxt3: UITextField!
    
    @IBOutlet weak var datePickerTxt4: UITextField!
    
    @IBOutlet weak var datePickerTxt5: UITextField!
    
    @IBOutlet weak var datePickerTxt6: UITextField!

    
    @IBOutlet weak var datePickerTxt7: UITextField!
   
    @IBOutlet weak var datePickerTxt8: UITextField!
    
    
    @IBOutlet weak var datePickerTxt9: UITextField!
    
    @IBOutlet weak var workoutSegmentControl: UISegmentedControl!
    
    let prefs = UserDefaults.standard
    
    let datePicker0 = UIDatePicker()
    let datePicker1 = UIDatePicker()
    let datePicker2 = UIDatePicker()
    let datePicker3 = UIDatePicker()
    let datePicker4 = UIDatePicker()
    let datePicker5 = UIDatePicker()
    let datePicker6 = UIDatePicker()
    let datePicker7 = UIDatePicker()
    let datePicker8 = UIDatePicker()
    let datePicker9 = UIDatePicker()
    
    override  func viewDidLoad() {
        
        datePickerTxt0.isHidden = false
        datePickerTxt1.isHidden = false
        datePickerTxt2.isHidden = false
        datePickerTxt3.isHidden = false
        datePickerTxt4.isHidden = false
        datePickerTxt5.isHidden = false
        datePickerTxt6.isHidden = false
        datePickerTxt7.isHidden = false
        datePickerTxt8.isHidden = false
        datePickerTxt9.isHidden = false
        
        createDatePicker()
        workoutSegmentControl.selectedSegmentIndex = 0
        workoutSegmentValueChanged(workoutSegmentControl)
        
    }
    
    func createDatePicker(){
        datePicker0.datePickerMode = .time
        datePicker1.datePickerMode = .time
        datePicker2.datePickerMode = .time
        datePicker3.datePickerMode = .time
        datePicker4.datePickerMode = .time
        datePicker5.datePickerMode = .time
        datePicker6.datePickerMode = .time
        datePicker7.datePickerMode = .time
        datePicker8.datePickerMode = .time
        datePicker9.datePickerMode = .time
        
        
    }
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        var dateDataString = ""
        
        print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
        
        switch workoutSegmentControl.selectedSegmentIndex {
        case 0:
            datePickerTxt0.text = dateFormatter.string(from: datePicker0.date)
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            dateDataString = datePickerTxt0.text!
        case 1:
            datePickerTxt1.text = dateFormatter.string(from: datePicker1.date)
            datePickerTxt2.text = dateFormatter.string(from: datePicker2.date)
            
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            
            dateDataString = datePickerTxt1.text! + ", " + datePickerTxt2.text!
            
        case 2:
            datePickerTxt3.text = dateFormatter.string(from: datePicker3.date)
            datePickerTxt4.text = dateFormatter.string(from: datePicker4.date)
            datePickerTxt5.text = dateFormatter.string(from: datePicker5.date)
            
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            
            dateDataString = datePickerTxt3.text! + ", " + datePickerTxt4.text! + ", " + datePickerTxt5.text!
            
        case 3:
            datePickerTxt6.text = dateFormatter.string(from: datePicker6.date)
            datePickerTxt7.text = dateFormatter.string(from: datePicker7.date)
            datePickerTxt8.text = dateFormatter.string(from: datePicker8.date)
            datePickerTxt9.text = dateFormatter.string(from: datePicker9.date)
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            dateDataString = datePickerTxt6.text! + ", " + datePickerTxt7.text! + ", " + datePickerTxt8.text! + ", " + datePickerTxt9.text!
        default: break
        }
        print(dateDataString)
        prefs.set(dateDataString, forKey: "dateDataString")
        self.view.endEditing(true)
    }
    @IBAction func workoutSegmentValueChanged(_ sender: UISegmentedControl) {
        datePicker0.datePickerMode = .time
        datePicker1.datePickerMode = .time
        
        datePicker2.datePickerMode = .time
        
        datePicker3.datePickerMode = .time
        
        datePicker4.datePickerMode = .time
        
        datePicker5.datePickerMode = .time
        
        datePicker6.datePickerMode = .time
        
        datePicker7.datePickerMode = .time
        
        datePicker8.datePickerMode = .time
        datePicker9.datePickerMode = .time
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        workoutSegmentControl.selectedSegmentIndex = sender.selectedSegmentIndex
        print("workoutSegmentValueChanged \(workoutSegmentControl.selectedSegmentIndex)")
        
        switch workoutSegmentControl.selectedSegmentIndex {
        case 0:
            print("workoutSegmentValueChanged \(workoutSegmentControl.selectedSegmentIndex)")
            
            datePickerTxt0.text = ""
            
            datePickerTxt0.isHidden = false
            datePickerTxt1.isHidden = true
            datePickerTxt2.isHidden = true
            datePickerTxt3.isHidden = true
            datePickerTxt4.isHidden = true
            datePickerTxt5.isHidden = true
            datePickerTxt6.isHidden = true
            datePickerTxt7.isHidden = true
            datePickerTxt8.isHidden = true
            datePickerTxt9.isHidden = true
            
            datePickerTxt0.inputAccessoryView = toolBar
            datePickerTxt0.inputView = datePicker0
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            print("workoutSegmentValueChanged \(workoutSegmentControl.selectedSegmentIndex)")
            
        case 1:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            datePickerTxt1.text = ""
            datePickerTxt2.text = ""
            
            datePickerTxt0.isHidden = true
            datePickerTxt1.isHidden = false
            datePickerTxt2.isHidden = false
            datePickerTxt3.isHidden = true
            datePickerTxt4.isHidden = true
            datePickerTxt5.isHidden = true
            datePickerTxt6.isHidden = true
            datePickerTxt7.isHidden = true
            datePickerTxt8.isHidden = true
            datePickerTxt9.isHidden = true
            
            datePickerTxt1.inputAccessoryView = toolBar
            datePickerTxt1.inputView = datePicker1
            datePickerTxt2.inputAccessoryView = toolBar
            datePickerTxt2.inputView = datePicker2
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
            
        case 2:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
            datePickerTxt3.text = ""
            datePickerTxt4.text = ""
            datePickerTxt5.text = ""
            
            datePickerTxt0.isHidden = true
            datePickerTxt1.isHidden = true
            datePickerTxt2.isHidden = true
            datePickerTxt3.isHidden = false
            datePickerTxt4.isHidden = false
            datePickerTxt5.isHidden = false
            
            datePickerTxt6.isHidden = true
            datePickerTxt7.isHidden = true
            datePickerTxt8.isHidden = true
            datePickerTxt9.isHidden = true
            
            datePickerTxt3.inputAccessoryView = toolBar
            datePickerTxt3.inputView = datePicker3
            
            datePickerTxt4.inputAccessoryView = toolBar
            datePickerTxt4.inputView = datePicker4
            
            datePickerTxt5.inputAccessoryView = toolBar
            datePickerTxt5.inputView = datePicker5
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
        case 3:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            datePickerTxt0.isHidden = true
            datePickerTxt1.isHidden = true
            datePickerTxt2.isHidden = true
            datePickerTxt3.isHidden = true
            datePickerTxt4.isHidden = true
            datePickerTxt5.isHidden = true
            datePickerTxt6.isHidden = false
            datePickerTxt7.isHidden = false
            datePickerTxt8.isHidden = false
            datePickerTxt9.isHidden = false
            
            datePickerTxt6.text = ""
            datePickerTxt7.text = ""
            datePickerTxt8.text = ""
            datePickerTxt9.text = ""
            
            datePickerTxt6.inputAccessoryView = toolBar
            datePickerTxt6.inputView = datePicker6
            
            datePickerTxt7.inputAccessoryView = toolBar
            datePickerTxt7.inputView = datePicker7
            
            datePickerTxt8.inputAccessoryView = toolBar
            datePickerTxt8.inputView = datePicker8
            
            datePickerTxt9.inputAccessoryView = toolBar
            datePickerTxt9.inputView = datePicker9
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
        default: break
            
        }
        
        
    }
 
 
}

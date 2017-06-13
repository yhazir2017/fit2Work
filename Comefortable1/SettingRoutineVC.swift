//
//  SettingRoutineVC.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 5/4/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class SettingsRoutineVC : UIViewController{
    
    var datePickerSenderFlag0 = false
    var datePickerSenderFlag1 = false
    var datePickerSenderFlag2 = false
    var datePickerSenderFlag3 = false
    var datePickerSenderFlag4 = false
    var datePickerSenderFlag5 = false
    var datePickerSenderFlag6 = false
    var datePickerSenderFlag7 = false
    var datePickerSenderFlag8 = false
    var datePickerSenderFlag9 = false
    
    var dateInfo0 = DateComponents()
    var dateInfo1 = DateComponents()
    var dateInfo2 = DateComponents()
    var dateInfo3 = DateComponents()
    var dateInfo4 = DateComponents()
    var dateInfo5 = DateComponents()
    var dateInfo6 = DateComponents()
    var dateInfo7 = DateComponents()
    var dateInfo8 = DateComponents()
    var dateInfo9 = DateComponents()
    
    
    @IBAction func scheduleNotification(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Routine for Workouts"
        content.subtitle = "Time to become healthy"
        content.body = " Fit2Work Exercise program will run at the scheduled times"
        content.badge = 1
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "notificationCategoryIdentity1"
        
        let requestIdentifier0 = "Go to Exercise0"
        let requestIdentifier1 = "Go to Exercise1"
        let requestIdentifier2 = "Go to Exercise2"
        let requestIdentifier3 = "Go to Exercise3"
        let requestIdentifier4 = "Go to Exercise4"
        let requestIdentifier5 = "Go to Exercise5"
        let requestIdentifier6 = "Go to Exercise6"
        let requestIdentifier7 = "Go to Exercise7"
        let requestIdentifier8 = "Go to Exercise8"
        let requestIdentifier9 = "Go to Exercise9"
        
        print ("scheduleNotification initial")
        
        switch workoutSegmentControl.selectedSegmentIndex {
        case 0:
            
            if datePickerSenderFlag0 == true {
                print ("dateInfo0 hours0 : \(dateInfo0.hour!)")
                print ("dateInfo0 minutes0 : \(dateInfo0.minute!)")
                print ("dateInfo0 month0 : \(dateInfo0.month!)")
                print ("dateInfo0 day0 : \(dateInfo0.day!)")
                
                
                let trigger0 = UNCalendarNotificationTrigger(dateMatching: dateInfo0, repeats: true)
                
                let request0 = UNNotificationRequest(identifier: requestIdentifier0, content: content, trigger: trigger0)
                
                center.add(request0, withCompletionHandler: {
                    error in
                    if error != nil{
                        print(error!)
                    }
                })
                datePickerSenderFlag0 = false
            }
            if datePickerSenderFlag1 == true {
                
                print ("dateInfo0 hours1 : \(dateInfo1.hour!)")
                print ("dateInfo0 minutes1 : \(dateInfo1.minute!)")
                print ("dateInfo0 month1 : \(dateInfo1.month!)")
                print ("dateInfo0 day1 : \(dateInfo1.day!)")
                
                
                let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateInfo1, repeats: true)
                
                
                let request1 = UNNotificationRequest(identifier: requestIdentifier1, content: content, trigger: trigger1)
                
                
                center.add(request1, withCompletionHandler: {
                    error in
                    if error != nil{
                        print(error!)
                    }
                })
                datePickerSenderFlag1 = false
                
            }
            print ("scheduleNotification case 0")
            content.categoryIdentifier = "notificationCategoryIdentity1"
            
        case 1:
            if datePickerSenderFlag0 == true {
                let trigger0 = UNCalendarNotificationTrigger(dateMatching: dateInfo0, repeats: false)
                let request0 = UNNotificationRequest(identifier: requestIdentifier0, content: content, trigger: trigger0)
                
                center.add(request0, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag0 = false
            }
            if datePickerSenderFlag1 == true {
                let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateInfo1, repeats: false)
                let request1 = UNNotificationRequest(identifier: requestIdentifier1, content: content, trigger: trigger1)
                
                center.add(request1, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag1 = false
            }
            if datePickerSenderFlag2 == true {
                let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateInfo2, repeats: false)
                let request2 = UNNotificationRequest(identifier: requestIdentifier2, content: content, trigger: trigger2)
                center.add(request2, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag2 = false
            }
            if datePickerSenderFlag3 == true {
                let trigger3 = UNCalendarNotificationTrigger(dateMatching: dateInfo3, repeats: false)
                
                let request3 = UNNotificationRequest(identifier: requestIdentifier3, content: content, trigger: trigger3)
                
                
                center.add(request3, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag0 = false
            }
            print ("scheduleNotification case 1")
            content.categoryIdentifier = "notificationCategoryIdentity1"
            
            
        case 2:
            if datePickerSenderFlag0 == true {
                let trigger0 = UNCalendarNotificationTrigger(dateMatching: dateInfo0, repeats: false)
                let request0 = UNNotificationRequest(identifier: requestIdentifier0, content: content, trigger: trigger0)
                center.add(request0, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag0 = false
            }
            if datePickerSenderFlag1 == true {
                let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateInfo1, repeats: false)
                let request1 = UNNotificationRequest(identifier: requestIdentifier1, content: content, trigger: trigger1)
                center.add(request1, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag1 = false
            }
            if datePickerSenderFlag2 == true {
                
                let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateInfo2, repeats: false)
                let request2 = UNNotificationRequest(identifier: requestIdentifier2, content: content, trigger: trigger2)
                center.add(request2, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag2 = false
            }
            if datePickerSenderFlag3 == true {
                let trigger3 = UNCalendarNotificationTrigger(dateMatching: dateInfo3, repeats: false)
                let request3 = UNNotificationRequest(identifier: requestIdentifier3, content: content, trigger: trigger3)
                center.add(request3, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag3 = false
            }
            if datePickerSenderFlag4 == true {
                let trigger4 = UNCalendarNotificationTrigger(dateMatching: dateInfo4, repeats: false)
                let request4 = UNNotificationRequest(identifier: requestIdentifier4, content: content, trigger: trigger4)
                center.add(request4, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag4 = false
            }
            if datePickerSenderFlag5 == true {
                let trigger5 = UNCalendarNotificationTrigger(dateMatching: dateInfo5, repeats: false)
                let request5 = UNNotificationRequest(identifier: requestIdentifier5, content: content, trigger: trigger5)
                
                center.add(request5, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag5 = false
            }
        case 3:
            if datePickerSenderFlag0 == true {
                let trigger0 = UNCalendarNotificationTrigger(dateMatching: dateInfo0, repeats: false)
                let request0 = UNNotificationRequest(identifier: requestIdentifier0, content: content, trigger: trigger0)
                center.add(request0, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag0 = false
            }
            if datePickerSenderFlag1 == true {
                let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateInfo1, repeats: false)
                let request1 = UNNotificationRequest(identifier: requestIdentifier1, content: content, trigger: trigger1)
                center.add(request1, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag1 = false
            }
            if datePickerSenderFlag2 == true {
                
                let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateInfo2, repeats: false)
                let request2 = UNNotificationRequest(identifier: requestIdentifier2, content: content, trigger: trigger2)
                center.add(request2, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag2 = false
            }
            if datePickerSenderFlag3 == true {
                let trigger3 = UNCalendarNotificationTrigger(dateMatching: dateInfo3, repeats: false)
                let request3 = UNNotificationRequest(identifier: requestIdentifier3, content: content, trigger: trigger3)
                center.add(request3, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag3 = false
            }
            if datePickerSenderFlag4 == true {
                let trigger4 = UNCalendarNotificationTrigger(dateMatching: dateInfo4, repeats: false)
                let request4 = UNNotificationRequest(identifier: requestIdentifier4, content: content, trigger: trigger4)
                center.add(request4, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag4 = false
            }
            if datePickerSenderFlag5 == true {
                let trigger5 = UNCalendarNotificationTrigger(dateMatching: dateInfo5, repeats: false)
                let request5 = UNNotificationRequest(identifier: requestIdentifier5, content: content, trigger: trigger5)
                
                center.add(request5, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag5 = false
            }
            
            
            if datePickerSenderFlag6 == true {
                let trigger6 = UNCalendarNotificationTrigger(dateMatching: dateInfo6, repeats: false)
                let request6 = UNNotificationRequest(identifier: requestIdentifier6, content: content, trigger: trigger6)
                center.add(request6, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag6 = false
            }
            if datePickerSenderFlag7 == true {
                let trigger7 = UNCalendarNotificationTrigger(dateMatching: dateInfo7, repeats: false)
                let request7 = UNNotificationRequest(identifier: requestIdentifier7, content: content, trigger: trigger7)
                center.add(request7, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag7 = false
            }
            if datePickerSenderFlag8 == true {
                let trigger8 = UNCalendarNotificationTrigger(dateMatching: dateInfo8, repeats: false)
                let request8 = UNNotificationRequest(identifier: requestIdentifier8, content: content, trigger: trigger8)
                center.add(request8, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag8 = false
            }
            if datePickerSenderFlag9 == true {
                let trigger9 = UNCalendarNotificationTrigger(dateMatching: dateInfo9, repeats: false)
                let request9 = UNNotificationRequest(identifier: requestIdentifier9, content: content, trigger: trigger9)
                center.add(request9, withCompletionHandler: {
                    error in
                    //
                })
                datePickerSenderFlag9 = false
            }
        default: break
        }
    }
    
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
        
        //UNUserNotificationCenter.current().delegate = self
        
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
        
        //createDatePicker()
        workoutSegmentControl.selectedSegmentIndex = 0
        workoutSegmentValueChanged(workoutSegmentControl)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bckgrnd1.jpg")!)
        
    }
    
    func createDatePicker(){
        datePicker0.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker1.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker2.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker3.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker4.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker5.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker6.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker7.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker8.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker9.datePickerMode = UIDatePickerMode.dateAndTime
        
    }
    
    func convertMonhToInt(month: String)->Int{
        var monthInInteger = 0
        switch month {
        case "Jan" :
            monthInInteger = 1
        case "Feb" :
            monthInInteger = 2
        case "Mar" :
            monthInInteger = 3
        case "Apr" :
            monthInInteger = 4
        case "May" :
            monthInInteger = 5
        case "Jun" :
            monthInInteger = 6
        case "Jul" :
            monthInInteger = 7
        case "Aug" :
            monthInInteger = 8
        case "Sep" :
            monthInInteger = 9
        case "Oct" :
            monthInInteger = 10
        case "Nov" :
            monthInInteger = 11
        case "Dec" :
            monthInInteger = 12
        default: break
        }
        return monthInInteger
        
        
    }
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        
        dateFormatter.dateFormat = "MMM d, E, HH:mm"
        
        var dateDataString = ""
        
        let time0 = datePickerTxt0.text!
        let time1 = datePickerTxt1.text!
        let time2 = datePickerTxt2.text!
        let time3 = datePickerTxt3.text!
        let time4 = datePickerTxt4.text!
        let time5 = datePickerTxt5.text!
        let time6 = datePickerTxt6.text!
        let time7 = datePickerTxt7.text!
        let time8 = datePickerTxt8.text!
        let time9 = datePickerTxt9.text!
        
        switch workoutSegmentControl.selectedSegmentIndex {
        case 0:
            
            if datePickerSenderFlag0 == true {
                print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)\n")
                dateDataString = datePickerTxt0.text! + ", " + datePickerTxt1.text!
                
                let components0 = time0.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours0 = components0[5]
                let minutes0 = components0[6]
                let month0 = components0[0]
                let day0 = components0[1]
                dateInfo0.day = Int(day0)
                dateInfo0.month = convertMonhToInt(month: month0)
                
                dateInfo0.hour = Int(hours0)
                dateInfo0.minute = Int(minutes0)
                dateInfo0.day = Int(day0)
                dateInfo0.month = convertMonhToInt(month: month0)
                
                print ("dateInfo hours0 : \(dateInfo0.hour!)")
                print ("dateInfo minutes0 : \(dateInfo0.minute!)")
                print ("dateInfo day0 : \(dateInfo0.day!)")
                print ("dateInfo month0 : \(dateInfo0.month!)\n")
            }
            
            if datePickerSenderFlag1 == true {
                let components1 = time1.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours1 = components1[5]
                let minutes1 = components1[6]
                
                let month1 = components1[0]
                let day1 = components1[1]
                
                
                dateInfo1.hour = Int(hours1)
                dateInfo1.minute = Int(minutes1)
                dateInfo1.day = Int(day1)
                dateInfo1.month = convertMonhToInt(month: month1)
                
                print ("dateInfo hours1 : \(dateInfo1.hour!)")
                print ("dateInfo minutes1 : \(dateInfo1.minute!)")
                print ("dateInfo day1 : \(dateInfo1.day!)")
                print ("dateInfo month1 : \(dateInfo1.month!)\n")
                
                
            }
            
        case 1:
            
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            
            dateDataString = datePickerTxt0.text! + ", " + datePickerTxt1.text! + ", " + datePickerTxt2.text! + ", " + datePickerTxt3.text!
            
            if datePickerSenderFlag0 == true {
                let components0 = time0.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours0 = components0[5]
                let minutes0 = components0[6]
                
                print ("hours0 : \(hours0)")
                print ("minutes0 : \(minutes0)")
                
                dateInfo0.hour = Int(hours0)
                dateInfo0.minute = Int(minutes0)
                
                let month0 = components0[0]
                let day0 = components0[1]
                
                dateInfo0.day = Int(day0)
                dateInfo0.month = convertMonhToInt(month: month0)
            }
            if datePickerSenderFlag1 == true {
                
                let components1 = time1.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours1 = components1[5]
                let minutes1 = components1[6]
                
                print ("hours1 : \(hours1)")
                print ("minutes1 : \(minutes1)")
                
                dateInfo1.hour = Int(hours1)
                dateInfo1.minute = Int(minutes1)
                
                let month1 = components1[0]
                let day1 = components1[1]
                
                dateInfo1.day = Int(day1)
                dateInfo1.month = convertMonhToInt(month: month1)
            }
            
            if datePickerSenderFlag2 == true {
                let components2 = time2.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours2 = components2[5]
                let minutes2 = components2[6]
                
                print ("hours2 : \(hours2)")
                print ("minutes2 : \(minutes2)")
                dateInfo2.hour = Int(hours2)
                dateInfo2.minute = Int(minutes2)
                
                let month2 = components2[0]
                let day2 = components2[1]
                dateInfo2.day = Int(day2)
                dateInfo2.month = convertMonhToInt(month: month2)
            }
            if datePickerSenderFlag3 == true {
                
                let components3 = time3.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours3 = components3[5]
                let minutes3 = components3[6]
                
                print ("hours3 : \(hours3)")
                print ("minutes3 : \(minutes3)")
                dateInfo3.hour = Int(hours3)
                dateInfo3.minute = Int(minutes3)
                
                let month3 = components3[0]
                let day3 = components3[1]
                dateInfo3.day = Int(day3)
                dateInfo3.month = convertMonhToInt(month: month3)
            }
            
        case 2:
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            
            dateDataString = datePickerTxt0.text! + ", " + datePickerTxt1.text! + ", " + datePickerTxt2.text! + ", " + datePickerTxt3.text! + ", " + datePickerTxt4.text! + ", " + datePickerTxt5.text!
            
            if datePickerSenderFlag0 == true {
                let components0 = time0.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours0 = components0[5]
                let minutes0 = components0[6]
                
                print ("hours0 : \(hours0)")
                print ("minutes0 : \(minutes0)")
                dateInfo0.hour = Int(hours0)
                dateInfo0.minute = Int(minutes0)
                
                let month0 = components0[0]
                let day0 = components0[1]
                dateInfo0.day = Int(day0)
                dateInfo0.month = convertMonhToInt(month: month0)
            }
            if datePickerSenderFlag1 == true {
                let components1 = time1.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours1 = components1[5]
                let minutes1 = components1[6]
                
                print ("hours1 : \(hours1)")
                print ("minutes1 : \(minutes1)")
                dateInfo1.hour = Int(hours1)
                dateInfo1.minute = Int(minutes1)
                
                let month1 = components1[0]
                let day1 = components1[1]
                dateInfo1.day = Int(day1)
                dateInfo1.month = convertMonhToInt(month: month1)
            }
            if datePickerSenderFlag2 == true {
                
                let components2 = time2.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours2 = components2[5]
                let minutes2 = components2[6]
                
                print ("hours2 : \(hours2)")
                print ("minutes2 : \(minutes2)")
                dateInfo2.hour = Int(hours2)
                dateInfo2.minute = Int(minutes2)
                let month2 = components2[0]
                let day2 = components2[1]
                dateInfo2.day = Int(day2)
                dateInfo2.month = convertMonhToInt(month: month2)
            }
            if datePickerSenderFlag3 == true {
                let components3 = time3.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours3 = components3[5]
                let minutes3 = components3[6]
                
                print ("hours3 : \(hours3)")
                print ("minutes3 : \(minutes3)")
                dateInfo3.hour = Int(hours3)
                dateInfo3.minute = Int(minutes3)
                
                let month3 = components3[0]
                let day3 = components3[1]
                dateInfo3.day = Int(day3)
                dateInfo3.month = convertMonhToInt(month: month3)
                
            }
            if datePickerSenderFlag4 == true {
                let components4 = time4.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours4 = components4[5]
                let minutes4 = components4[6]
                
                print ("hours4 : \(hours4)")
                print ("minutes4 : \(minutes4)")
                dateInfo4.hour = Int(hours4)
                dateInfo4.minute = Int(minutes4)
                let month4 = components4[0]
                let day4 = components4[1]
                dateInfo4.day = Int(day4)
                dateInfo4.month = convertMonhToInt(month: month4)
            }
            if datePickerSenderFlag5 == true {
                
                let components5 = time5.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours5 = components5[5]
                let minutes5 = components5[6]
                
                print ("hours5 : \(hours5)")
                print ("minutes4 : \(minutes5)")
                dateInfo5.hour = Int(hours5)
                dateInfo5.minute = Int(minutes5)
                
                let month5 = components5[0]
                let day5 = components5[1]
                dateInfo5.day = Int(day5)
                dateInfo5.month = convertMonhToInt(month: month5)
            }
            
            
        case 3:
            
            
            
            print("workoutSegmentControl in donePressed \(workoutSegmentControl.selectedSegmentIndex)")
            dateDataString = datePickerTxt0.text! + ", " + datePickerTxt1.text! + ", " + datePickerTxt2.text! + ", " + datePickerTxt3.text! + ", " + datePickerTxt4.text! + ", " + datePickerTxt5.text! + ", " + datePickerTxt6.text! + ", " + datePickerTxt7.text! + ", " + datePickerTxt8.text! + ", " + datePickerTxt9.text!
            
            if datePickerSenderFlag0 == true {
                let components0 = time0.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours0 = components0[5]
                let minutes0 = components0[6]
                
                print ("hours0 : \(hours0)")
                print ("minutes0 : \(minutes0)")
                dateInfo0.hour = Int(hours0)
                dateInfo0.minute = Int(minutes0)
                
                let month0 = components0[0]
                let day0 = components0[1]
                dateInfo0.day = Int(day0)
                dateInfo0.month = convertMonhToInt(month: month0)
            }
            if datePickerSenderFlag1 == true {
                let components1 = time1.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours1 = components1[5]
                let minutes1 = components1[6]
                
                print ("hours1 : \(hours1)")
                print ("minutes1 : \(minutes1)")
                dateInfo1.hour = Int(hours1)
                dateInfo1.minute = Int(minutes1)
                
                let month1 = components1[0]
                let day1 = components1[1]
                dateInfo1.day = Int(day1)
                dateInfo1.month = convertMonhToInt(month: month1)
            }
            if datePickerSenderFlag2 == true {
                
                let components2 = time2.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours2 = components2[5]
                let minutes2 = components2[6]
                
                print ("hours2 : \(hours2)")
                print ("minutes2 : \(minutes2)")
                dateInfo2.hour = Int(hours2)
                dateInfo2.minute = Int(minutes2)
                let month2 = components2[0]
                let day2 = components2[1]
                dateInfo2.day = Int(day2)
                dateInfo2.month = convertMonhToInt(month: month2)
            }
            if datePickerSenderFlag3 == true {
                let components3 = time3.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours3 = components3[5]
                let minutes3 = components3[6]
                
                print ("hours3 : \(hours3)")
                print ("minutes3 : \(minutes3)")
                dateInfo3.hour = Int(hours3)
                dateInfo3.minute = Int(minutes3)
                
                let month3 = components3[0]
                let day3 = components3[1]
                dateInfo3.day = Int(day3)
                dateInfo3.month = convertMonhToInt(month: month3)
                
            }
            if datePickerSenderFlag4 == true {
                let components4 = time4.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours4 = components4[5]
                let minutes4 = components4[6]
                
                print ("hours4 : \(hours4)")
                print ("minutes4 : \(minutes4)")
                dateInfo4.hour = Int(hours4)
                dateInfo4.minute = Int(minutes4)
                let month4 = components4[0]
                let day4 = components4[1]
                dateInfo4.day = Int(day4)
                dateInfo4.month = convertMonhToInt(month: month4)
            }
            if datePickerSenderFlag5 == true {
                
                let components5 = time5.components(separatedBy: [",", " ", ",", " ", ":"])
                let hours5 = components5[5]
                let minutes5 = components5[6]
                
                print ("hours5 : \(hours5)")
                print ("minutes4 : \(minutes5)")
                dateInfo5.hour = Int(hours5)
                dateInfo5.minute = Int(minutes5)
                
                let month5 = components5[0]
                let day5 = components5[1]
                dateInfo5.day = Int(day5)
                dateInfo5.month = convertMonhToInt(month: month5)
            }
            if datePickerSenderFlag6 == true {
                
            let components6 = time6.components(separatedBy: [",", " ", ",", " ", ":"])
            let hours6 = components6[5]
            let minutes6 = components6[6]
            
            print ("hours6 : \(hours6)")
            print ("minutes6 : \(minutes6)")
            dateInfo6.hour = Int(hours6)
            dateInfo6.minute = Int(minutes6)
            
            let month6 = components6[0]
            let day6 = components6[1]
            dateInfo6.day = Int(day6)
            dateInfo6.month = convertMonhToInt(month: month6)
            
            print ("dateInfo6 month6 : \(dateInfo6.month!)")
            print ("dateInfo6 day6 : \(dateInfo6.day!)")
            }
            if datePickerSenderFlag7 == true {
                
            let components7 = time7.components(separatedBy: [",", " ", ",", " ", ":"])
            let hours7 = components7[5]
            let minutes7 = components7[6]
            
            print ("hours7 : \(hours7)")
            print ("minutes7 : \(minutes7)")
            dateInfo7.hour = Int(hours7)
            dateInfo7.minute = Int(minutes7)
            let month7 = components7[0]
            let day7 = components7[1]
            dateInfo7.day = Int(day7)
            dateInfo7.month = convertMonhToInt(month: month7)
            print ("dateInfo7 month7 : \(dateInfo7.month!)")
            print ("dateInfo7 day7 : \(dateInfo7.day!)")
            }
            if datePickerSenderFlag8 == true {
                
            
            let components8 = time8.components(separatedBy: [",", " ", ",", " ", ":"])
            let hours8 = components8[5]
            let minutes8 = components8[6]
            
            print ("hours8 : \(hours8)")
            print ("minutes8 : \(minutes8)")
            dateInfo8.hour = Int(hours8)
            dateInfo8.minute = Int(minutes8)
            
            let month8 = components8[0]
            let day8 = components8[1]
            dateInfo8.day = Int(day8)
            dateInfo8.month = convertMonhToInt(month: month8)
            
            print ("dateInfo8 month8 : \(dateInfo8.month!)")
            print ("dateInfo8 day8 : \(dateInfo8.day!)")
            }
            if datePickerSenderFlag9 == true {
                
            
            let components9 = time9.components(separatedBy: [",", " ", ",", " ", ":"])
            let hours9 = components9[5]
            let minutes9 = components9[6]
            
            print ("hours9 : \(hours9)")
            print ("minutes9 : \(minutes9)")
            dateInfo9.hour = Int(hours9)
            dateInfo9.minute = Int(minutes9)
            
            let month9 = components9[0]
            let day9 = components9[1]
            dateInfo9.day = Int(day9)
            dateInfo9.month = convertMonhToInt(month: month9)
            
            print ("dateInfo9 month9 : \(dateInfo9.month!)")
            print ("dateInfo9 day9 : \(dateInfo9.day!)")
            }
            
        default: break
        }
        print(dateDataString)
        prefs.set(dateDataString, forKey: "dateDataString")
        self.view.endEditing(true)
    }
    
    
    @IBAction func date_picker_change_action(_ sender : UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        
        
        
        //dateFormatter.dateFormat = "E, HH:mm"
        dateFormatter.dateFormat = "MMM d, E, HH:mm"
        
        //show date label in text
        switch workoutSegmentControl.selectedSegmentIndex {
        case 0:
            if (sender == datePicker0) {
                
                datePickerTxt0.text = dateFormatter.string(from: datePicker0.date)
                print("datePicker0 :\(datePickerTxt0.text!)")
                datePickerSenderFlag0 = true
            }
            if (sender == datePicker1) {
                
                datePickerTxt1.text = dateFormatter.string(from: datePicker1.date)
                print("datePicker1 :\(datePickerTxt1.text!)")
                datePickerSenderFlag1 = true
                
            }
        case 1:
            if (sender == datePicker0) {
                print("datePicker0")
                datePickerTxt0.text = dateFormatter.string(from: datePicker0.date)
                datePickerSenderFlag0 = true
            }
            else if (sender == datePicker1) {
                print("datePicker1")
                datePickerTxt1.text = dateFormatter.string(from: datePicker1.date)
                datePickerSenderFlag1 = true
            }
            else if (sender == datePicker2) {
                print("datePicker2")
                datePickerTxt2.text = dateFormatter.string(from: datePicker2.date)
                datePickerSenderFlag2 = true
            }
            else if (sender == datePicker3) {
                print("datePicker3")
                datePickerTxt3.text = dateFormatter.string(from: datePicker3.date)
                datePickerSenderFlag3 = true
            }
            
            
        case 2:
            if (sender == datePicker0) {
                print("datePicker0")
                datePickerTxt0.text = dateFormatter.string(from: datePicker0.date)
                datePickerSenderFlag0 = true
            }
            else if (sender == datePicker1) {
                print("datePicker1")
                datePickerTxt1.text = dateFormatter.string(from: datePicker1.date)
                datePickerSenderFlag1 = true
            }
            else if (sender == datePicker2) {
                print("datePicker2")
                datePickerTxt2.text = dateFormatter.string(from: datePicker2.date)
                datePickerSenderFlag2 = true
            }
            else if (sender == datePicker3) {
                print("datePicker3")
                datePickerTxt3.text = dateFormatter.string(from: datePicker3.date)
                datePickerSenderFlag3 = true
            }
            else if (sender == datePicker4) {
                print("datePicker4")
                datePickerTxt4.text = dateFormatter.string(from: datePicker4.date)
                datePickerSenderFlag4 = true
            }
            else if (sender == datePicker5) {
                print("datePicker5")
                datePickerTxt5.text = dateFormatter.string(from: datePicker5.date)
                datePickerSenderFlag5 = true
            }
            
        case 3:
            if (sender == datePicker0) {
                print("datePicker0")
                datePickerTxt0.text = dateFormatter.string(from: datePicker0.date)
                datePickerSenderFlag0 = true
            }
            else if (sender == datePicker1) {
                print("datePicker1")
                datePickerTxt1.text = dateFormatter.string(from: datePicker1.date)
                datePickerSenderFlag1 = true
            }
            else if (sender == datePicker2) {
                print("datePicker2")
                datePickerTxt2.text = dateFormatter.string(from: datePicker2.date)
                datePickerSenderFlag2 = true
            }
            else if (sender == datePicker3) {
                print("datePicker3")
                datePickerTxt3.text = dateFormatter.string(from: datePicker3.date)
                datePickerSenderFlag3 = true
            }
            else if (sender == datePicker4) {
                print("datePicker4")
                datePickerTxt4.text = dateFormatter.string(from: datePicker4.date)
                datePickerSenderFlag4 = true
            }
            else if (sender == datePicker5) {
                print("datePicker5")
                datePickerTxt5.text = dateFormatter.string(from: datePicker5.date)
                datePickerSenderFlag5 = true
            }
            else if (sender == datePicker6) {
                print("datePicker6")
                datePickerTxt6.text = dateFormatter.string(from: datePicker6.date)
                datePickerSenderFlag6 = true
            }
            else if (sender == datePicker7) {
                print("datePicker7")
                datePickerTxt7.text = dateFormatter.string(from: datePicker7.date)
                datePickerSenderFlag7 = true
            }
            else if (sender == datePicker8) {
                print("datePicker8")
                datePickerTxt8.text = dateFormatter.string(from: datePicker8.date)
                datePickerSenderFlag8 = true
            }
            else if (sender == datePicker9) {
                print("datePicker9")
                datePickerTxt9.text = dateFormatter.string(from: datePicker9.date)
                datePickerSenderFlag9 = true
            }
            
            
        default: break
            
        }
    }
    
    
    @IBAction func workoutSegmentValueChanged(_ sender: UISegmentedControl) {
        
        
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
            
            datePickerTxt0.isHidden = false
            datePickerTxt1.isHidden = false
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
            
            datePicker0.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            
            
            datePickerTxt1.inputAccessoryView = toolBar
            datePickerTxt1.inputView = datePicker1
            
            
            datePicker1.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            
            
        case 1:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            datePickerTxt6.text = ""
            datePickerTxt7.text = ""
            
            datePickerTxt0.isHidden = false
            datePickerTxt1.isHidden = false
            datePickerTxt2.isHidden = false
            datePickerTxt3.isHidden = false
            datePickerTxt4.isHidden = true
            datePickerTxt5.isHidden = true
            datePickerTxt6.isHidden = true
            datePickerTxt7.isHidden = true
            datePickerTxt8.isHidden = true
            datePickerTxt9.isHidden = true
            
            datePickerTxt0.inputAccessoryView = toolBar
            datePickerTxt0.inputView = datePicker0
            datePickerTxt1.inputAccessoryView = toolBar
            datePickerTxt1.inputView = datePicker1
            
            datePickerTxt2.inputAccessoryView = toolBar
            datePickerTxt2.inputView = datePicker2
            datePickerTxt3.inputAccessoryView = toolBar
            datePickerTxt3.inputView = datePicker3
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            datePicker0.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker1.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker2.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker3.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            
            
            
            
        case 2:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
            datePickerTxt6.text = ""
            datePickerTxt7.text = ""
            datePickerTxt8.text = ""
            
            datePickerTxt0.isHidden = false
            datePickerTxt1.isHidden = false
            datePickerTxt2.isHidden = false
            datePickerTxt3.isHidden = false
            datePickerTxt4.isHidden = false
            datePickerTxt5.isHidden = false
            datePickerTxt6.isHidden = true
            datePickerTxt7.isHidden = true
            datePickerTxt8.isHidden = true
            datePickerTxt9.isHidden = true
            
            datePickerTxt0.inputAccessoryView = toolBar
            datePickerTxt0.inputView = datePicker0
            
            datePickerTxt1.inputAccessoryView = toolBar
            datePickerTxt1.inputView = datePicker1
            
            datePickerTxt2.inputAccessoryView = toolBar
            datePickerTxt2.inputView = datePicker2
            
            datePickerTxt3.inputAccessoryView = toolBar
            datePickerTxt3.inputView = datePicker3
            
            datePickerTxt4.inputAccessoryView = toolBar
            datePickerTxt4.inputView = datePicker4
            
            datePickerTxt5.inputAccessoryView = toolBar
            datePickerTxt5.inputView = datePicker5
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
            datePicker0.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker1.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker2.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker3.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker4.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker5.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            
            
            
        case 3:
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
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
            
            datePickerTxt0.text = ""
            datePickerTxt1.text = ""
            datePickerTxt2.text = ""
            datePickerTxt3.text = ""
            datePickerTxt4.text = ""
            datePickerTxt5.text = ""
            datePickerTxt6.text = ""
            datePickerTxt7.text = ""
            datePickerTxt8.text = ""
            datePickerTxt9.text = ""
            
            datePickerTxt0.inputAccessoryView = toolBar
            datePickerTxt0.inputView = datePicker0
            
            datePickerTxt1.inputAccessoryView = toolBar
            datePickerTxt1.inputView = datePicker1
            
            datePickerTxt2.inputAccessoryView = toolBar
            datePickerTxt2.inputView = datePicker2
            
            datePickerTxt3.inputAccessoryView = toolBar
            datePickerTxt3.inputView = datePicker3
            
            datePickerTxt4.inputAccessoryView = toolBar
            datePickerTxt4.inputView = datePicker4
            
            datePickerTxt5.inputAccessoryView = toolBar
            datePickerTxt5.inputView = datePicker5
            
            datePickerTxt6.inputAccessoryView = toolBar
            datePickerTxt6.inputView = datePicker6
            
            datePickerTxt7.inputAccessoryView = toolBar
            datePickerTxt7.inputView = datePicker7
            
            datePickerTxt8.inputAccessoryView = toolBar
            datePickerTxt8.inputView = datePicker8
            
            datePickerTxt9.inputAccessoryView = toolBar
            datePickerTxt9.inputView = datePicker9
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
            toolBar.setItems([doneButton], animated: false)
            
            print("workoutSegmentValueChanged \(sender.selectedSegmentIndex)")
            
            datePicker0.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker1.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker2.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker3.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker4.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker5.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker6.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker7.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker8.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            datePicker9.addTarget(self, action: #selector(date_picker_change_action(_:)), for: UIControlEvents.valueChanged)
            
            
            
            
        default: break
            
        }
        
        
    }
    
    
}



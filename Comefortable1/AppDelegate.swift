//
//  AppDelegate.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/10/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         print("AppDelegate")
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {granted, error in })
        let actionOne = UNNotificationAction(identifier: "actionOne", title: "Open Fit2Work App", options: [.foreground])
        
         let categoryOne = UNNotificationCategory(identifier: "notificationCategoryIdentity1", actions: [actionOne], intentIdentifiers: [], options: [])
       
        center.setNotificationCategories([categoryOne])
        
        return true
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "actionOne" {
        DispatchQueue.main.async(execute: {
            self.notificationActionTapped()
        })
        }
    }
    func notificationActionTapped(){
        print("notificationActionTapped")
        let alert = UIAlertController(title: "Hi", message: "Welcome to Fit2Work", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(UIAlertAction) in
        // do some thing
        
        }))
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
 
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        initialViewController.present(alert, animated: true, completion: nil)
        
        
        //
//        let presentedViewController : UIViewController = (self.window?.rootViewController)!
//        presentedViewController.present(alert, animated: true, completion: nil)
//        
        
        
        /**
        let pushedViewController: [UIViewController] = [(self.window?.rootViewController)!] as [UIViewController];
        print("pushedViewController.count : \(pushedViewController.count)")
        
        let presentedViewController = pushedViewController[pushedViewController.count - 1]
        presentedViewController.present(alert, animated: true, completion: nil)
        */
        
        
    }
    

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


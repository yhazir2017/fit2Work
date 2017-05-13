//
//  SubViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/17/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import KDCircularProgress

class SubViewController: UIViewController {
    var progress: KDCircularProgress!
    
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var labelText: UITextField!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var uiview0: UIView!
    
    @IBOutlet weak var uiview1: UIView!
    
    @IBOutlet weak var uiview2: UIView!
    
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var uiview3: UIView!
    
    @IBOutlet weak var uiview4: UIView!
    
    @IBOutlet weak var uiview5: UIView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var exerciseSegmentControl: UISegmentedControl!
    
    var timer = Timer()
   
    var counterConstant = 4
    var counter : Int = 0
    var currentAdvance = 0
    
    var musicFlag = false
    
    var exercises:[Exercise] = [
        Exercise(type: "neck",image: "neck1.png", text: "Place your right hand against the right side of your head and press against your head at the same time you push your head against your hand."),
        Exercise(type: "shoulder",image: "Shoulder1.png", text: "Place your left arm across the front of your body at shoulder level. With your right hand, hold your left arm just above the elbow and gently pull across your chest until you feel the streetch across the back of your shoulder and upper arm."),
        Exercise(type: "leg",image: "leg1.png", text: "Bend your knee and lift your leg about 12 inches off the floor. Do this at least 10 times with each leg and if you can, stretch your knee all the way up to your chest before releasing it."),
        Exercise(type: "hand",image: "hand1.png", text: "Sitting, with elbows on the table and palms together, slowly lower wrists to table until a stretch is felt. Ensure palms stay together throughout the stretch."),
        Exercise(type: "eye",image: "eye1.png", text: "Look up and hold for 3 seconds then look down and hold for another 3 seconds. Repeat 3 times in total") ]
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = counterConstant
        uiview0.backgroundColor = UIColor.red
        uiview1.backgroundColor = UIColor.red
        
        counterLbl.text = String(counter)
        image0.image = UIImage(named: exercises[0].image)
        image1.image = UIImage(named: exercises[0].image)
        image2.image = UIImage(named: exercises[1].image)
        image3.image = UIImage(named: exercises[2].image)
        image4.image = UIImage(named: exercises[3].image)
        image5.image = UIImage(named: exercises[4].image)
        exerciseSegmentControl.selectedSegmentIndex = 0
        
        image0.layer.cornerRadius = image0.frame.size.width/2
        image0.clipsToBounds = true
        image0.layer.borderColor = UIColor.red.cgColor
        
        image1.layer.cornerRadius = image1.frame.size.width/2
        image1.clipsToBounds = true
        
        image2.layer.cornerRadius = image2.frame.size.width/2
        image2.clipsToBounds = true
        
        image3.layer.cornerRadius = image3.frame.size.width/2
        image3.clipsToBounds = true
        
        image4.layer.cornerRadius = image4.frame.size.width/2
        image4.clipsToBounds = true
        
        image5.layer.cornerRadius = image5.frame.size.width/2
        image5.clipsToBounds = true
        
        uiview1.backgroundColor = UIColor.red
        uiview2.backgroundColor = UIColor.white
        uiview3.backgroundColor = UIColor.white
        uiview4.backgroundColor = UIColor.white
        uiview5.backgroundColor = UIColor.white
        
        
        do{
            let audioPath = Bundle.main.path(forResource: "silk", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch{
            print("Error")
        }
        print ("Music Flag  \(musicFlag)")
        
        let prefs = UserDefaults.standard
        
        musicFlag = prefs.bool(forKey: "musicFlag")
        
        if musicFlag {
            audioPlayer.play()
        }
        
        //progress = KDCircularProgress(frame: CGRect(x: 34, y: 291, width: 360, height: 360))
        progress = KDCircularProgress(frame: CGRect(x: 60, y: 320, width: 255, height: 270))
        progress.startAngle = -90
        progress.progressThickness = 0.1
        progress.trackThickness = 0.2
        progress.clockwise = true
        progress.gradientRotateSpeed = 0
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.set(colors: UIColor.cyan ,UIColor.white, UIColor.magenta, UIColor.white, UIColor.orange)
        //progress.center = CGPoint(x: view.center.x, y: view.center.y + 55)
        view.addSubview(progress)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SubViewController.timeElapsed), userInfo: nil, repeats: true)
       
        progressTimeAnimater()
        //self.navigationController?.navigationBar.isHidden = true
        
    }
    internal func progressTimeAnimater() {
        progress.animate(fromAngle: 0, toAngle: 360, duration: TimeInterval(counterConstant)) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    

    
    internal func timeElapsed() {
        
        if counter > 0 {
            print("counter  : \(counter) currentAdvance : \(currentAdvance)  " )
            counter -= 1
            if (currentAdvance == 4) && (counter == 1){
                image0.image = #imageLiteral(resourceName: "eye4")
                textLabel.text =  "Rest your eyes by staring at the Picture for a while."
                print("endExercise()")
                progressTimeAnimater()
                endExercise()
            }
        }
        else if (counter == 0) {
            print("counter  : \(counter)")
            counter = counterConstant
            
            exerciseSegmentControl.selectedSegmentIndex += 1
            currentAdvance = exerciseSegmentControl.selectedSegmentIndex
            
            switch exerciseSegmentControl.selectedSegmentIndex {
            case 0:
                print("neck")
                image0.image = UIImage(named: exercises[currentAdvance].image)
                textLabel.text = exercises[currentAdvance].text
                uiview1.backgroundColor = UIColor.red
                uiview2.backgroundColor = UIColor.white
                uiview3.backgroundColor = UIColor.white
                uiview4.backgroundColor = UIColor.white
                uiview5.backgroundColor = UIColor.white
                progressTimeAnimater()
                
            case 1:
                print("shoulder")
                image0.image = UIImage(named: exercises[currentAdvance].image)
                textLabel.text = exercises[currentAdvance].text
                uiview1.backgroundColor = UIColor.white
                uiview2.backgroundColor = UIColor.red
                progressTimeAnimater()
                
            case 2:
                print("leg")
                image0.image = UIImage(named: exercises[currentAdvance].image)
                textLabel.text = exercises[currentAdvance].text
                uiview2.backgroundColor = UIColor.white
                uiview3.backgroundColor = UIColor.red
                progressTimeAnimater()
                
            case 3:
                print("hand ")
                image0.image = UIImage(named: exercises[currentAdvance].image)
                textLabel.text = exercises[currentAdvance].text
                uiview3.backgroundColor = UIColor.white
                uiview4.backgroundColor = UIColor.red
                progressTimeAnimater()
                
            case 4:
                print("eye ")
                image0.image = UIImage(named: exercises[currentAdvance].image)
                textLabel.text = exercises[currentAdvance].text
                uiview4.backgroundColor = UIColor.white
                uiview5.backgroundColor = UIColor.red
                progressTimeAnimater()
                
                
            default: break
            }
            
            
        }
        
        counterLbl.text = String(counter)
    }
    internal func endExercise(){
        counterLbl.text = String(0)
        image0.image = #imageLiteral(resourceName: "eye4")
        textLabel.text =  "Rest your eyes by staring at the Picture for a while."
        print("timer.invalidate()")
        timer.invalidate()
        perform(#selector(terminateAudio), with: nil, afterDelay: 20)
        progress.animate(fromAngle: 0, toAngle: 360, duration: 20.0) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
        
    }
    internal func terminateAudio(){
        audioPlayer.stop()
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        if (stopButton.currentImage?.isEqual(UIImage(named:"stop.png")))!{
            print("stop")
            timer.invalidate()
            counter = counterConstant
            counterLbl.text = String(counter)
            image0.image = #imageLiteral(resourceName: "eye4")
            textLabel.text =  "Rest your eyes by staring at the Picture for a while."
            audioPlayer.stop()
            let image = UIImage(named: "start.png")
            stopButton.setImage(image, for: .normal)
            progress.stopAnimation()
            
        }
        else if (stopButton.currentImage?.isEqual(UIImage(named:"start.png")))!{
            print("start")
            let image = UIImage(named: "stop.png")
            stopButton.setImage(image, for: .normal)
            self.viewDidLoad()
            progress.stopAnimation()
        }
        
        
    
}


//    @IBAction func onBackButtonClicked(_ sender: Any) {
        
//        let viewControllers: [UIViewController] = (self.navigationController?.viewControllers)!
//
//        self.navigationController!.popToViewController(viewControllers[viewControllers.count-2], animated: true);
//        
//        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
//        self.navigationController!.popToViewController(viewControllers[0], animated: true);
//        self.navigationController?.popToRootViewController(animated: true)
        
  //      if let composeViewController = self.navigationController?.viewControllers[1] {
    //        self.navigationController?.popToViewController(composeViewController, animated: true)
   //     }
   // }
    
    
}

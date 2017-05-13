//
//  ViewController.swift
//  Comefortable1
//
//  Created by YILDIRAY HAZIR on 4/10/17.
//  Copyright © 2017 codepath. All rights reserved.
//
import Foundation
import UIKit
import AVFoundation
import KDCircularProgress

class ViewController: UIViewController {
    var progress: KDCircularProgress!

    
    @IBOutlet weak var counterLbl: UILabel!
    
    
    @IBOutlet weak var uiview0: UIView!
    
    
    @IBOutlet weak var uiview1: UIView!
    
    @IBOutlet weak var uiview2: UIView!
    
    @IBOutlet weak var uiview3: UIView!
    
    
    @IBOutlet weak var uiview4: UIView!
    
    
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var exerciseSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    var counterConstant = 2
    var counter : Int = 0
    var currentAdvance = 0
    var musicFlag = false

    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    let prefs = UserDefaults.standard
    
    var exercises:[Exercise] = [
        Exercise(type: "neck",image: "neck1.png", text: "Place your right hand against the right side of your head and press against your head at the same time you push your head against your hand."),
        Exercise(type: "neck",image: "neck2.png", text: "Place your left hand against the left side of your head and press against your head at the same time you push your head against your hand."),
        Exercise(type: "neck",image: "neck3.png", text: "Place your hand against your forehead and press backward at the same time you press your head forward against your palm."),
        Exercise(type: "neck",image: "neck4.png", text: "Place both of your hands behind your head and try to press your head backward while you push forward with your hands."),
        
        Exercise(type: "shoulder",image: "Shoulder1.png", text: "Place your left arm across the front of your body at shoulder level. With your right hand, hold your left arm just above the elbow and gently pull across your chest until you feel the streetch across the back of your shoulder and upper arm."),
        Exercise(type: "shoulder",image: "Shoulder2.png", text: "Stand and raise your shoulders. Hold for 1 seconds. Squeeze your shoulder blades back and together and hold for 2 seconds. Pull your shoulder blades downward and hold for 2 seconds. Relax and repeat."),
        Exercise(type: "shoulder",image: "Shoulder3.png", text: "Pull your arm across your body.Hold for 1 Minute."),
        Exercise(type: "shoulder",image: "Shoulder4.png", text: "Gripping the elbow as shown, pull back and across. Hold for 1 seconds. Bend upper body away from side being stretched."),
        
        Exercise(type: "leg",image: "leg1.png", text: "Bend your knee and lift your leg about 12 inches off the floor. Do this at least 10 times with each leg and if you can, stretch your knee all the way up to your chest before releasing it."),
        Exercise(type: "leg",image: "leg2.png", text: "Simply rotate your ankles for 30 seconds in a clockwise direction, then repeat this in an anticlockwise direction."),
        Exercise(type: "leg",image: "leg3.png", text: "Keep your heels on the floor and point your toes towards the sky. Do this ten times with each foot."),
        Exercise(type: "leg",image: "leg4.png", text: "Place your weight on your toes then lift your heels up, holding the position for 3 seconds before placing your feet flat to the floor."),
        
        Exercise(type: "hand",image: "hand1.png", text: "Sitting, with elbows on the table and palms together, slowly lower wrists to table until a stretch is felt. Ensure palms stay together throughout the stretch."),
        Exercise(type: "hand",image: "hand2.png", text: "Gently bend wrist from side to side as far as possible."),
        Exercise(type: "hand",image: "hand3.png", text: "Keeping elbow straight, grasp and slowly bend wrist forward until stretch is felt."),
        Exercise(type: "hand",image: "hand4.png", text: "Keeping elbow straight, grasp and slowly bend wrist back until stretch is felt."),
        
        Exercise(type: "eye",image: "eye1.png", text: "Look up and hold for 3 seconds then look down and hold for another 3 seconds. Repeat 3 times in total."),
        Exercise(type: "eye",image: "eye2.png", text: "Look right and hold for 3 seconds then look left and hold for another 3 seconds. Repeat at least 3 times in total."),
        Exercise(type: "eye",image: "eye3.png", text: "Close your eyes tight and hold for 10 seconds, relax."),
        Exercise(type: "eye",image: "eye4.png", text: "Rest your eyes by staring at the Picture for a while.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        //let prefs = UserDefaults.standard

        let exerciseLength = prefs.integer(forKey: "exerciseLength")
        
        switch exerciseLength {
        case 3:
            counterConstant = 10
        case 5:
            counterConstant = 15
        case 8:
            counterConstant = 24
        default: break
        }
        
        
        counter = counterConstant
        
        uiview0.backgroundColor = UIColor.red
        uiview1.backgroundColor = UIColor.red
        
        counterLbl.text = String(counter)
        image0.image = UIImage(named: exercises[0].image)
        image1.image = UIImage(named: exercises[0].image)
        image2.image = UIImage(named: exercises[1].image)
        image3.image = UIImage(named: exercises[2].image)
        image4.image = UIImage(named: exercises[3].image)
        exerciseSegmentControl.selectedSegmentIndex = 0
        labelText.text = "Place your right hand against the right side of your head and press against your head at the same time you push your head against your hand."
        
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
        
        do{
            let audioPath = Bundle.main.path(forResource: "silk", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch{
            print("Error")
        }
        print ("Music Flag before read \(musicFlag)")
        
        
        musicFlag = prefs.bool(forKey: "musicFlag")
        print ("Music Flag after read \(musicFlag)")

        if musicFlag {
            audioPlayer.play()
        }
 
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timeElapsed), userInfo: nil, repeats: true)
        progressTimeAnimater()
        self.navigationController?.navigationBar.isHidden = true
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
        }
        else if (counter == 0) {
            print("counter  : \(counter) currentAdvance : \(currentAdvance)  " )
            
            if ((currentAdvance % 4) == 0) && (currentAdvance != 0){
                exerciseSegmentControl.selectedSegmentIndex += 1
                 print("exerciseSegmentControl.selectedSegmentIndex += 1" )
            }
            
            if ((currentAdvance % 4) == 0) && (currentAdvance == 0) && (exerciseSegmentControl.selectedSegmentIndex == 0){
                
                currentAdvance += 1
                print("exerciseSegmentControl.selectedSegmentIndex += 1" )
            }
            counter = counterConstant
            
            if  (exerciseSegmentControl.selectedSegmentIndex == 0){
                
                print("Seg : 0 neck => currentAdvance : \(currentAdvance) \n " )
                
                switch currentAdvance {
                case 0:
                    uiview1.backgroundColor = UIColor.red
                    uiview4.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 0 Case 0: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()
                    
                case 1:
                    uiview2.backgroundColor = UIColor.red
                    uiview1.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 0 Case 1: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 2:
                    uiview3.backgroundColor = UIColor.red
                    uiview2.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 0 Case 2: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 3:
                    uiview4.backgroundColor = UIColor.red
                    uiview3.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 0 Case 3: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()
                    
                default: break
                }
                
                
            }
            else if (exerciseSegmentControl.selectedSegmentIndex == 1){
                print(" Seg : 1 shoulder => currentAdvance : \(currentAdvance) \n " )
                if ((currentAdvance % 4) == 0){
                    image1.image = UIImage(named: exercises[currentAdvance].image)
                    image2.image = UIImage(named: exercises[currentAdvance + 1].image)
                    image3.image = UIImage(named: exercises[currentAdvance + 2].image)
                    image4.image = UIImage(named: exercises[currentAdvance + 3].image)
                }
                switch currentAdvance % 4 {
                case 0:
                    uiview1.backgroundColor = UIColor.red
                    uiview4.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 1 Case 0: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                case 1:
                    uiview2.backgroundColor = UIColor.red
                    uiview1.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 1 Case 1: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 2:
                    uiview3.backgroundColor = UIColor.red
                    uiview2.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 1 Case 2: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 3:
                    uiview4.backgroundColor = UIColor.red
                    uiview3.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    //exerciseSegmentControl.selectedSegmentIndex += 1
                    print("Seg : 1 Case 3: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                default: break
                }
            }
            else if (exerciseSegmentControl.selectedSegmentIndex == 2){
                print(" Seg : 2 leg => currentAdvance : \(currentAdvance) \n " )
                if ((currentAdvance % 4) == 0){
                    image1.image = UIImage(named: exercises[currentAdvance].image)
                    image2.image = UIImage(named: exercises[currentAdvance + 1].image)
                    image3.image = UIImage(named: exercises[currentAdvance + 2].image)
                    image4.image = UIImage(named: exercises[currentAdvance + 3].image)
                }
                switch currentAdvance % 4 {
                case 0:
                    uiview1.backgroundColor = UIColor.red
                    uiview4.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 2 Case 0: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                case 1:
                    uiview2.backgroundColor = UIColor.red
                    uiview1.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 2 Case 1: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 2:
                    uiview3.backgroundColor = UIColor.red
                    uiview2.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 2 Case 2: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 3:
                    uiview4.backgroundColor = UIColor.red
                    uiview3.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    //exerciseSegmentControl.selectedSegmentIndex += 1
                    print("Seg : 2 Case 3: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                default: break
                }
            }
            else if (exerciseSegmentControl.selectedSegmentIndex == 3){
                print(" Seg : 3 hand => currentAdvance : \(currentAdvance) \n " )
                if ((currentAdvance % 4) == 0){
                    image1.image = UIImage(named: exercises[currentAdvance].image)
                    image2.image = UIImage(named: exercises[currentAdvance + 1].image)
                    image3.image = UIImage(named: exercises[currentAdvance + 2].image)
                    image4.image = UIImage(named: exercises[currentAdvance + 3].image)
                }
                switch currentAdvance % 4 {
                case 0:
                    uiview1.backgroundColor = UIColor.red
                    uiview4.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 3 Case 0: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                case 1:
                    uiview2.backgroundColor = UIColor.red
                    uiview1.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 3 Case 1: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 2:
                    uiview3.backgroundColor = UIColor.red
                    uiview2.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 3 Case 2: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 3:
                    uiview4.backgroundColor = UIColor.red
                    uiview3.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    //exerciseSegmentControl.selectedSegmentIndex += 1
                    print("Seg : 3 Case 3: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                default: break
                }
            }
            else if (exerciseSegmentControl.selectedSegmentIndex == 4){
                print(" Seg : 4 eye => currentAdvance : \(currentAdvance) \n " )
                if ((currentAdvance % 4) == 0){
                    image1.image = UIImage(named: exercises[currentAdvance].image)
                    image2.image = UIImage(named: exercises[currentAdvance + 1].image)
                    image3.image = UIImage(named: exercises[currentAdvance + 2].image)
                    image4.image = UIImage(named: exercises[currentAdvance + 3].image)
                }
                switch currentAdvance % 4 {
                case 0:
                    uiview1.backgroundColor = UIColor.red
                    uiview4.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 4 Case 0: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                    
                case 1:
                    uiview2.backgroundColor = UIColor.red
                    uiview1.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 4 Case 1: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 2:
                    uiview3.backgroundColor = UIColor.red
                    uiview2.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    print("Seg : 4 Case 2: => currentAdvance : \(currentAdvance) \n " )
                    progressTimeAnimater()

                case 3:
                    uiview4.backgroundColor = UIColor.red
                    uiview3.backgroundColor = UIColor.white
                    image0.image = UIImage(named: exercises[currentAdvance].image)
                    labelText.text = exercises[currentAdvance].text
                    currentAdvance += 1
                    
                    print("Seg : 4 Case 3: => currentAdvance : \(currentAdvance) \n " )
                    print(" EYE : endExercise()")
                
                    if (currentAdvance == 20){
                        print("endExercise()")
                        
                        endExercise()
                    }
                    
                    
                default: break
                }
            }
            
        }
        
        counterLbl.text = String(counter)
        
    }
    
    internal func endExercise(){
        counterLbl.text = String(0)
        image0.image = #imageLiteral(resourceName: "eye4")
        labelText.text =  "Rest your eyes by staring at the Picture for a while."
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    internal func stopExercise(){
        timer.invalidate()
        counter = counterConstant
        counterLbl.text = String(counter)
        audioPlayer.stop()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        
        print("stop")
        if (stopButton.currentImage?.isEqual(UIImage(named:"stop.png")))!{
            print("stop")
            timer.invalidate()
            counter = counterConstant
            counterLbl.text = String(counter)
            image0.image = #imageLiteral(resourceName: "eye4")
            labelText.text =  "Rest your eyes by staring at the Picture for a while."
            audioPlayer.stop()
            let image = UIImage(named: "start.png")
            stopButton.setImage(image, for: .normal)
            
        }
        else if (stopButton.currentImage?.isEqual(UIImage(named:"start.png")))!{
            print("start")
            let image = UIImage(named: "stop.png")
            stopButton.setImage(image, for: .normal)
            self.viewDidLoad()
        }
        
    }
    


}


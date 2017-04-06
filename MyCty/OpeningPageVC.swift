//
//  OpeningPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/15/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Firebase
import FirebaseAuth

extension Timer {
    class func schedule(delay: TimeInterval, handler: ((Timer?) -> Void)!) -> Timer! {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, .commonModes)
        return timer
    }
}

class OpeningViewController : UIViewController{
    
   
    @IBOutlet weak var emailLoginTxt: UITextField!

    @IBOutlet weak var passwordLoginTxt: UITextField!
    @IBOutlet weak var sceneView: SKView!

    @IBOutlet weak var sceneView2: SKView!
  
    @IBOutlet weak var sceneView3: SKView!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    var scene:cloudScene?
    var scene2:carScene?
    
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "forgotPassword")
    present(vc, animated: true, completion: nil)
    }

    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OpeningView")
        present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if self.emailLoginTxt.text == "" || self.passwordLoginTxt.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please complete the fields", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        guard let email = emailLoginTxt.text, let password = passwordLoginTxt.text else{
            print("form is not valid")
            return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: "Login Failed", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "LandingPageVC")
                self.present(vc, animated: true, completion: nil)
            }
            
        })
        
    

    
    
    }

   override func viewDidLoad() {
    
        //login.layer.cornerRadius = 10
        signUp.layer.cornerRadius = 10
        super.viewDidLoad()

    self.scene = cloudScene(size: CGSize(width: self.sceneView.frame.size.width, height:self.sceneView.frame.size.height))
     self.scene2 = carScene(size: CGSize(width: self.sceneView2.frame.size.width, height:self.sceneView2.frame.size.height))
 
    self.sceneView.presentScene(scene)
    self.sceneView2.presentScene(scene2)
    
    self.scene?.floatingCloud()
    self.scene2?.movingCar()
    
    
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    
    //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
    //tap.cancelsTouchesInView = false
    
    view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    // Do any additional setup after loading the view, typically from a nib.

    
        }
    


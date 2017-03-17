//
//  OnBoardingVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/15/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingVC : UIViewController{
    
    
    
    @IBAction func skipBtn(_ sender: Any) {
        
    UserDefaults.standard.set(true, forKey: "save")
        //defaults.synchronize()
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            var vc = UIViewController()
            vc = storyboard.instantiateViewController(withIdentifier: "Home")
            
            
            present(vc, animated: true, completion: nil)
        }
    
    
    

    
  /* func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var buttonSelected: Int = 0
        
        if (segue.identifier == "button1Segue") {
            
            buttonSelected = 1
        }
            
        else if (segue.identifier == "button2Segue") {
            
            buttonSelected = 2
        }
        
        // Etc . . .
        
        UserDefaults.standard.set(buttonSelected, forKey: "buttonSelected") // Write the selection in user defaults
        UserDefaults.standard.synchronize() // Save changes
    }
    */
    /*func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let buttonSelected = UserDefaults.standard.integer(forKey: "buttonSelected")
        
        if buttonSelected != 0 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            var vcName = ""
            
            switch buttonSelected {
            case 1:
                vcName = "Button1Controller"
            case 2: break
                // Etc
            }
            
            let vc = storyboard.instantiateViewController(withIdentifier: vcName)
            self.window?.rootViewController?.presentViewController(vc, animated: true, completion: nil)
        }
        else {
            // The user default wasn't saved yet
        }
        return true
    }
}

    */
    
    
    
    
    
    
    /*func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        let prefs = UserDefaults.standard
        if prefs.bool(forKey: "button1") == true {
            // here code if button was clicked
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            var vc = UIViewController()
            vc = storyboard.instantiateViewController(withIdentifier: "Home") as UIViewController
        
           
            self.presentedViewController?.present(vc, animated: true, completion: nil)
        }

            
            
            
    
    else {
    
       print("setting was saved")
        
        
        }
        
        return true
    }
    */

    override func viewDidAppear(_ animated: Bool) {
        if let x  = UserDefaults.standard.object(  forKey: "save") as? Bool
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            var vc = UIViewController()
            vc = storyboard.instantiateViewController(withIdentifier: "Home")
           // x == true
            
            present(vc, animated: true, completion: nil)
        }

        else{
            print("not saved")
    }
}
}

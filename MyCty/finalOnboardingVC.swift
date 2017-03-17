//
//  finalOnboardingVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/15/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import Foundation
import UIKit

class finalOnboardingVC : UIViewController {

    
    @IBAction func startBtn(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "start")
        //defaults.synchronize()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        vc = storyboard.instantiateViewController(withIdentifier: "Home")
        
        
        present(vc, animated: true, completion: nil)

    }
        

    override func viewDidAppear(_ animated: Bool) {
        if let x  = UserDefaults.standard.object(forKey: "start") as? Bool
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

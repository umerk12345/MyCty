//
//  HomePageController.swift
//  MyCty
//
//  Created by Umer Khan on 3/11/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class HomeViewController : UIViewController{
    
    
    @IBAction func Btn(_ sender: Any) {
        if FIRAuth.auth()?.currentUser == nil{
            print("Not Signed in")
            
        }
        
        if FIRAuth.auth()?.currentUser != nil {
            print("Signed in")
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
       
    }

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
    }
}

//
//  HomePageController.swift
//  MyCty
//
//  Created by Umer Khan on 3/11/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


//IGNORE THIS FILE MADE ONLY FOR DEBUGGING


import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class HomeViewController : UIViewController{
    
    
    
    @IBAction func loggedIn(_ sender: Any) {
    
        if FIRAuth.auth()?.currentUser != nil {
    let successController = UIAlertController(title: "Logged in as", message: FIRAuth.auth()?.currentUser?.email!, preferredStyle: .alert)
    let defaultActionSuccess = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    successController.addAction(defaultActionSuccess)
    self.present(successController, animated: true, completion: nil)
}
    
    else{
        let alertController = UIAlertController(title: "Logged in as", message: "Guest", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func Btn(_ sender: Any) {
       
        if FIRAuth.auth()?.currentUser != nil {
            
           // print(FIRAuth.auth()?.currentUser?.email!)
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
            present(vc, animated: true, completion: nil)

        }
       
    }
    
    func configureGradientBackground(colors:CGColor...){
        
        let gradient: CAGradientLayer = CAGradientLayer()
     //   let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
        // let size = CGSize(width: 100, height: 100)
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSize(width: 600, height: 1000))
        gradient.frame = squareFrame
        
        gradient.colors = colors
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientBackground(colors: UIColor.blue.cgColor, UIColor.green.cgColor)

        }
}

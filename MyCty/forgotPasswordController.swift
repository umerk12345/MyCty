//
//  forgotPasswordController.swift
//  MyCty
//
//  Created by Umer Khan on 3/12/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class forgotPasswordController : UIViewController, UITextFieldDelegate {
    
    func configureGradientBackground(colors:CGColor...){
        
        let gradient: CAGradientLayer = CAGradientLayer()
      //  let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
        // let size = CGSize(width: 100, height: 100)
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSize(width: 600, height: 1000))
        gradient.frame = squareFrame
        
        gradient.colors = colors
        view.layer.insertSublayer(gradient, at: 0)
    }
    

    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    
    
    
    @IBAction func submit(_ sender: Any) {
        
        if self.emailTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email first.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTxtField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTxtField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }

    }
    
    
    override func viewDidLoad() {
        submitBtn.layer.cornerRadius = 10
        backBtn.layer.cornerRadius = 10
        configureGradientBackground(colors: UIColor.blue.cgColor, UIColor.yellow.cgColor)

        super.viewDidLoad()
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
    // Do any additional setup after loading the
        
        
    }



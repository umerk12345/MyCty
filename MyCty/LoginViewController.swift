//
//  LoginViewController.swift
//  MyCty
//
//  Created by Umer Khan on 3/8/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var loginBtnLbl: UIButton!
 
    @IBOutlet weak var emailLoginTxt: UITextField!
    @IBOutlet weak var passwordLoginTxt: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
  
    }
    
   
    
    @IBAction func forgotPassword(_ sender: Any) {
        
        if self.emailLoginTxt.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email first.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailLoginTxt.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailLoginTxt.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
   //LOGIN BUTTON
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
                   self.performSegue(withIdentifier: "loginToHome", sender: self)
                        }
 
                })
        
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    loginBtnLbl.layer.cornerRadius = 10
    
   
    
    
  
    //Looks for single or multiple taps.
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
    
    // Do any additional setup after loading the view, typically from a nib.

}
 







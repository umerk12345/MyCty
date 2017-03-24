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
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OpeningView")
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var loginBtnLbl: UIButton!
 
    @IBOutlet weak var emailLoginTxt: UITextField!
    @IBOutlet weak var passwordLoginTxt: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if textField == emailLoginTxt{
            self.passwordLoginTxt.becomeFirstResponder()
        }
        return true
    }
  
    @IBAction func forgotPassword(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "forgotPassword")
        present(vc, animated: true, completion: nil)

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
   
    
   // var gradientLayer: CAGradientLayer!
  
    /*
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
       gradientLayer.colors = [UIColor(red: 92.0/255.0, green: 24.0/255.0, blue: 27.0/255.0, alpha: 1.0).cgColor, UIColor(red: 245.0/255.0, green: 69.0/255.0, blue: 107.0/255.0, alpha: 1.0).cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    */
    func configureGradientBackground(colors:CGColor...){
        
        let gradient: CAGradientLayer = CAGradientLayer()
       // let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
       // let size = CGSize(width: 100, height: 100)
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSize(width: 600, height: 1000))
        gradient.frame = squareFrame
        
        gradient.colors = colors
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    @IBAction func guestBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "LandingPageVC")
        present(vc, animated: true, completion: nil)
        
    }
      
        override func viewDidLoad() {
    super.viewDidLoad()
    loginBtnLbl.layer.cornerRadius = 10
    backBtn.layer.cornerRadius = 10
    //createGradientLayer()
            
    configureGradientBackground(colors: UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor, UIColor(red: 245.0/255.0, green: 69.0/255.0, blue: 107.0/255.0, alpha: 1.0).cgColor)
    
       // Do any additional setup after loading the view, typically from a nib.
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
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








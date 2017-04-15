//
//  createAgenda.swift
//  MyCty
//
//  Created by Umer Khan on 3/23/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//
import UIKit
import Social
import MobileCoreServices
import FirebaseDatabase
import Firebase
import FirebaseAuth

class AgendaDetailVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func createAgenda(_ sender: Any) {
      
        if categoryTextField.text != "" && descriptionField.text != "" && timeTextField.text != "" && dateTextField.text != "" {
            
            guard let category = categoryTextField.text, category != "" else{
                print(" UMER: Category must be entered")
                return
            }
            
            guard let date = dateTextField.text, date != "" else{
                print(" UMER: Date must be entered")
                return
            }

            guard let description = descriptionField.text, description != "" else{
                print(" UMER: Descripiton must be entered")
                return
            }

            guard let time = timeTextField.text, time != "" else{
                print(" UMER: Time must be entered")
                return
            }
        
        self.postToFirebase()
           
        }
        self.performSegue(withIdentifier: "backToLand", sender: self)
    }
    
 

    //posts to Firebase
    func postToFirebase(){
        let ref = FIRDatabase.database().reference().child("Agenda")
       
        let userID = FIRAuth.auth()?.currentUser?.uid
    
        
        let post: Dictionary<String, AnyObject> = [
            
            "userID": userID as AnyObject  ,"category": categoryTextField.text! as AnyObject, "date": dateTextField.text! as AnyObject, "description": descriptionField.text! as AnyObject, "time": timeTextField.text! as AnyObject
        ]
        
        let userPost = DataService.ds.Ref_Users.child(userID!)
        
        
        let firebasePost = DataService.ds.Ref_Agendas.childByAutoId()
        firebasePost.setValue(post)
        
        
        categoryTextField.text = ""
        descriptionField.text = ""
        timeTextField.text = ""
        dateTextField.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
              view.addGestureRecognizer(tap)
    }
    
       func dismissKeyboard() {
        view.endEditing(true)
    }
    
}








    


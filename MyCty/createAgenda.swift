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
        
        ref = FIRDatabase.database().reference()
        var handle:FIRDatabaseHandle?
        
       
        if categoryTextField.text != "" && descriptionField.text != "" && timeTextField.text != "" && dateTextField.text != "" {
            
            
            
           // agenda[0][0] = categoryTextField.text!
           // agenda[0][1] = descriptionField.text!
           // agenda[0][2] = timeTextField.text!
           // agenda[0][3] = dateTextField.text!
            
            
            //let createdAgenda = [agenda[0][0], agenda[0][1], agenda[0][2], agenda[0][3]]
          //agenda.append(createdAgenda)
            
           
    
        }
        self.performSegue(withIdentifier: "backToLand", sender: self)
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








    


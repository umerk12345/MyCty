//
//  FullAgendaView.swift
//  MyCty
//
//  Created by Umer Khan on 4/12/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FullAgendaView: UIViewController{
    
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var event: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
 
    @IBOutlet weak var details: UITextView!
    
   
    //var product = DataService.ds.Ref_Agendas.child("Agendas/id")
    var categorytext :String?
    var handle :FIRDatabaseHandle?
    var agenda = [Agenda]()
   
 


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        category.text = categorytext
            //print(category.text)
                    // Make our jokes array for the tableView.
}
}

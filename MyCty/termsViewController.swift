//
//  termsViewController.swift
//  MyCty
//
//  Created by Umer Khan on 3/12/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit

class termsViewController : UIViewController{
    
    
    @IBOutlet weak var termsView: UITextView!
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {
 
     termsView.layer.cornerRadius = 10
        super.viewDidLoad()
      
    }

}

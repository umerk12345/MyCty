//
//  TableViewCell.swift
//  MyCty
//
//  Created by Umer Khan on 3/22/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell{

    @IBOutlet weak var categoryLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var bigDateLabel: UILabel!
    
    @IBOutlet weak var smallDateLabel: UILabel!
    
    @IBOutlet weak var smallDateView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        smallDateView.layer.borderWidth = 1
        smallDateView.layer.masksToBounds = false
        
        smallDateView.layer.cornerRadius = smallDateView.frame.height/2
        smallDateView.clipsToBounds = true

        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

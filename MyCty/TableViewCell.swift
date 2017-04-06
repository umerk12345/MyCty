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
    @IBOutlet weak var blueView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        blueView.layer.cornerRadius = 10
        smallDateView.layer.borderWidth = 1
        smallDateView.layer.masksToBounds = false
        smallDateView.layer.cornerRadius = smallDateView.frame.height/2
        smallDateView.clipsToBounds = true
    }
    
    
    func configureCell(agendaData:Agenda) {
        categoryLabel.text = agendaData.category
        descriptionLabel.text = agendaData.description
        time.text = agendaData.time
        bigDateLabel.text = agendaData.date
        smallDateLabel.text = agendaData.date
        
    }
    
    
}

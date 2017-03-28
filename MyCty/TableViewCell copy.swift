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
    /*
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        categoryLabel.text = post.category
        descriptionLabel.text = post.description
        time.text = post.time
        bigDateLabel.text = post.date
        smallDateLabel.text = post.date
       /* postImageView.image = post.image
        postStatsLabel.text = "\(post.numberOfLikes!) Likes     \(post.numberOfComments!) Comments     \(post.numberOfShares!) Shares"
 */
    }
    
    
    
*/

        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    
        
        
        
        
        
        blueView.layer.cornerRadius = 10
        
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

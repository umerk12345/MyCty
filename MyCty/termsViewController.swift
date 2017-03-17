//
//  termsViewController.swift
//  MyCty
//
//  Created by Umer Khan on 3/12/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit

class termsViewController : UIViewController{
    
    
    func configureGradientBackground(colors:CGColor...){
        
        let gradient: CAGradientLayer = CAGradientLayer()
    //    let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
        // let size = CGSize(width: 100, height: 100)
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSize(width: 600, height: 1000))
        gradient.frame = squareFrame
        
        gradient.colors = colors
        view.layer.insertSublayer(gradient, at: 0)
    }

    
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {

         backBtn.layer.cornerRadius = 10
        super.viewDidLoad()
        configureGradientBackground(colors: UIColor.blue.cgColor, UIColor.green.cgColor)

    }

}

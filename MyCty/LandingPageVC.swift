//
//  LandingPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/22/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


import UIKit
var agenda: [[String]] = [["", "", "", ""]]

class LandingPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var myTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (agenda.count-1)
        
            }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell

    cell.categoryLabel.text! =  agenda[0][0]
    cell.descriptionLabel.text! = agenda[0][1]
    cell.time.text! = agenda[0][2]
    cell.bigDateLabel.text! = agenda[0][3]
    cell.smallDateLabel.text! = agenda[0][3]
        
    return (cell)
}
    
   
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
       {
            agenda.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
        override func viewDidAppear(_ animated: Bool) {
  
        myTableView.reloadData()
        
    }

        
        

    override func viewDidLoad() {
        super.viewDidLoad()
                navBar.barTintColor = UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    //override var prefersStatusBarHidden: Bool {
     //   return true
   // }
}


//
//  LandingPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/22/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//
import UIKit

//var agenda: [String] = []
var agenda = ["", "", "", "", "", ""]

class LandingPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var myTableView: UITableView!
   
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   // let agenda = ["category", "location", "time"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (agenda.count-5)
        //return (agenda.count+1)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell
        
        cell.categoryLabel.text = agenda[0]
        cell.descriptionLabel.text = agenda[1]
        cell.time.text = agenda[2]
        cell.bigDateLabel.text = agenda[3]
        cell.smallDateLabel.text = agenda[3]
        
        /*myTableView.beginUpdates()
        myTableView.insertRows(at: [IndexPath(row: agenda.count-5, section: 0)], with: .automatic)
        myTableView.endUpdates()
        */
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AgendaView")
        //self.navigationController?.pushViewController(vc, animated: true)
    present(vc, animated: true, completion: nil)
        
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
       // navBar.tintColor = UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0)
       // navBar.backgroundColor = UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0)
         navBar.barTintColor = UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //override var prefersStatusBarHidden: Bool {
     //   return true
   // }
}


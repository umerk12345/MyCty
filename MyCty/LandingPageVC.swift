//
//  LandingPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/22/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


import UIKit
//var agenda = ["", "", "",""]
//var agenda: [[String]] = [[""]]
//var agenda = [Agenda]()
//var agenda:[[String]] = [[]]
var agenda: [[String]] = [["", "", "", ""]]

// OLD WORKING CODE var agenda = ["", "", "", "", "", ""]

class LandingPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var myTableView: UITableView!
    //var agenda = [Agenda]()


   // var posts: [Post]?
    
    /* Old Working code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    */
   // let agenda = ["category", "location", "time"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {/*
        if let posts = posts {
            return posts.count
        } else {
            return 0
        }
    }
*/
        //old working code
        return (agenda.count-1)
        //return (agenda.count-5)
        //return (agenda.count+1)
    //}
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell/*
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell
        /*cell.post = self.posts?[indexPath.row]
        
        return cell
    }
*/
      */
      
// old working code
        //cell.categoryLabel.text = "25"
               // var agenda = [Agenda]()
       //agenda.append(Agenda(category: cell.categoryLabel.text!, time: cell.time.text!, date: cell.bigDateLabel.text!, description: cell.descriptionLabel.text!))
      cell.categoryLabel.text = agenda[0][0]
        cell.descriptionLabel.text = agenda[0][1]
        cell.time.text = agenda[0][2]
        cell.bigDateLabel.text = agenda [0][3]
        cell.smallDateLabel.text = agenda[0][3]
       // agenda[0] = [cell.categoryLabel.text! , cell.descriptionLabel.text!, cell.time.text!,  cell.bigDateLabel.text! ]
       
       /*
        cell.categoryLabel.text = agenda[0]
        cell.descriptionLabel.text = agenda[1]
        cell.time.text = agenda[2]
        cell.bigDateLabel.text = agenda[3]
        cell.smallDateLabel.text = agenda[3]
        
       // */
    
    return (cell)
}
        /*myTableView.beginUpdates()
        myTableView.insertRows(at: [IndexPath(row: agenda.count-5, section: 0)], with: .automatic)
        myTableView.endUpdates()
 
        return (cell)
    }
    */
 /* old working code
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AgendaView")
        //self.navigationController?.pushViewController(vc, animated: true)
    present(vc, animated: true, completion: nil)
        
    }
    */
    
   //  old working code
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
       {
            agenda.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    //*/
  /*
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        myTableView.reloadData()
    }
*/
        
    //old working code
    override func viewDidAppear(_ animated: Bool) {
  
        myTableView.reloadData()
        
    }

        
        

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.fetchPosts()
        
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


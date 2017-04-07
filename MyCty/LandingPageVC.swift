//
//  LandingPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/22/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


import UIKit
import Firebase
import SwiftKeychainWrapper

  //var agenda: [[String]] = [["", "", "", ""]]
class LandingPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variables & Oulets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var myTableView: UITableView!
    var testingKey = "237895837hfjskdlfjkld3" //only used for testing - need user key
    var agenda = [Agenda]()
    
    //TODO: Setup user in Userdefaults or keychain to be used in Firebase query
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    
        navBar.barTintColor = UIColor(red: 132.0/255.0, green: 36.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        
        //retrieve Firebase Data
        DataService.ds.Ref_Agendas.observe(.value, with: { snap in
            if let snap = snap.children.allObjects as? [FIRDataSnapshot] {
                for agendas in snap {
                    if let agendasDict = agendas.value as? Dictionary<String,AnyObject> {
                        if let data = agendasDict[self.testingKey] as? Dictionary<String,AnyObject> {
                            let newAgendas = Agenda(key: agendas.key, data: data)
                            self.agenda.append(newAgendas)
                        }
                    }
                }
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agenda.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let agendas = agenda[indexPath.row]
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableViewCell {
            cell.configureCell(agendaData: agendas)
            return cell
        } else {
            let cell = MyCustomTableViewCell()
            cell.configureCell(agendaData: agendas)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            agenda.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)//removeObjectForKey
        print("Umer: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OpeningView")
        self.present(vc, animated: true, completion: nil)


    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }

    //override var prefersStatusBarHidden: Bool {
     //   return true
   // }
}


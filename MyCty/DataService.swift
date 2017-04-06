//
//  DataService.swift
//  MyCty
//
//  Created by Kenneth Grandberry - Contractor on 4/5/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let URL_BASE = FIRDatabase.database().reference()

class DataService {
    
    static var ds = DataService()
    
    private var _Ref_Base = URL_BASE
    private var _Ref_Users = URL_BASE.child("Users")
    private var _Ref_Agendas = URL_BASE.child("Agendas")
    
    var Ref_Base:FIRDatabaseReference {
        return _Ref_Base
    }
    
    var Ref_Users:FIRDatabaseReference {
        return _Ref_Users
    }
    
    var Ref_Agendas:FIRDatabaseReference {
        return _Ref_Agendas
    }
    
    func createFirebaseUser(uid:String, userData:Dictionary<String,String>) {
        Ref_Users.child(uid).updateChildValues(userData)
    }
}

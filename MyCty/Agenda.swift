//
//  Agenda.swift
//  MyCty
//
//  Created by Umer Khan on 3/21/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//


class Agenda {
    private var _category: String!
    private var _location: String!
    private var _time: String!
    private var _event: String!
    private var _cost: String!
    private var _details: String!
    private var _date: String!
    private var _description: String!
    private var _newagenda: String!
    
        var category: String{
        
        if _category ==  nil {
            _category = ""
        }
        return _category.capitalized
    }
    
    var location: String{
        if _location == nil {
            _location = ""
        }
        return _location
    }
    
    var time: String{
        if _time == nil {
            _time = ""
        }
        return _time
    }
    
    var event: String{
        if _event == nil{
            _event = ""
        }
        return _event
    }
    var cost: String {
        if _cost == nil{
            _cost = ""
        }
        return _cost
    }
    
    var details: String {
        if _details == nil{
            _details = ""
        }
        return _details
    }

    var date: String {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var description: String{
        if _description == nil{
            _description = ""
        }
        return _description
    }
    
    init(category: String, time: String, date: String, description: String) {
        self._category = category
        self._time = time
        self._date = date
        self._description = description
        
        
        
    }

}

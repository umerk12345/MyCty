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
    
    //setting getters because variables are private, can't destroy data
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
    

/*
    init(category: String, time: String, date: String, description: String) {
        self._category = category
        self._time = time
        self._date = date
        self._description = description
        
    }
    */
    
  /*
    //"/api/v1/pokemon/1/"
    
    init(name :String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId!)/"
        
    }
     
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        let pokemonUrl = URL(string: _pokemonUrl)!
        Alamofire.request(pokemonUrl).responseJSON { response in
            //Alamofire.request(url)
            //.responseString(completionHandler:
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1 ..< types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                        
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"]{
                        let pokemonDescriptionUrl = URL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(pokemonDescriptionUrl).responseJSON { response in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject>{
                                
                                if let description = descDict["description"] as? String {
                                    self._descrption = description
                                    print (self._descrption)
                                    /* if let url = descArr[0]["resource_uri"] {
                                     let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                                     
                                     
                                     Alamofire.request(nsurl.self as! URLRequestConvertible).responseJSON { response in
                                     //Alamofire.request(pokemonUrl).responseJSON { response in
                                     
                                     if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                     
                                     if let description = descDict["description"] as? String {
                                     self._descrption = description
                                     print(self._descrption)
                                     */
                                }
                            }
                            
                            completed()
                        }
                    }
                    
                } else {
                    self._descrption = ""
                }
                
                
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>], evolutions.count > 0{
                    
                    if let to = evolutions[0]["to"] as? String {
                        
                        //Can't support mega pokemon right now but
                        //api still has mega data
                        if to.range(of: "mega") == nil {
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                
                                let num = newStr.replacingOccurrences(of: "/", with: "")
                                
                                self._nextEvolutionId = num
                                self._nextEvolutionTxt = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    self._nextEvolutionLvl = "\(lvl)"
                                }
                                
                                
                                print(self._nextEvolutionId)
                                print(self._nextEvolutionTxt)
                                print(self._nextEvolutionLvl)
                                //Description of pokemon comes in the end bc asynchrounous request takes longer even though code happened before
                            }
                        }
                        completed()
                    }
                    
                }
            }
            
        }
        
    }
}




/*if let height = dict["height"] as? String{
 self._height = height
 
 }
 if let weight = dict["weight"] as? String{
 self._weight = weight
 }
 }
 
 print(self._height)
 print(self._weight)
 
 }
 
 }
 
 */

/* func downloadPokemonDetails(completed: @escaping DownloadComplete) {
 let final = (string: _pokemonUrl)
 Alamofire.request(final!)
 .responseString { response in
 // print response as string for debugging, testing, etc.
 //print(response)
 if let dict = response.value as? Dictionary<String, AnyObject>{
 
 if let height = dict["height"] as? String{
 self._height = height
 print(self._height)
 }
 completed()
 print(self._height)
 }
 */

/* if let dict = response.result.value as? Dictionary<String, AnyObject>{
 
 if let weight = dict["weight"] as String{
 self._weight = weight
 }
 
 if let height = dict["height"] as? String{
 self._height = height
 }
 
 if let attack = dict["attack"] as? Int{
 self._attack = "\(attack)"
 }
 
 if let defense = dict["defense"] as? Int{
 self._defense = "\(defense)"
 }
 print(self._weight)
 print(self._height)
 print(self._attack)
 print(self._defense)
 }
 */
/*
 //print(response.result.value)
 //print(response.result.error)
 
 
 
 // func downloadPokemonDetails (completed: @escaping DownloadComplete){
 
 //   let pokemonUrl = URL(string: _pokemonUrl)!
 
 // Alamofire.request(pokemonUrl).responseJSON { response in
 
 //   if let dict = response.result.value as? Dictionary<String, AnyObject>{
 
 //     print(response)
 
 //func downloadPokemonDetails(completed: DownloadComplete) {
 
 //Alamofire.request(_pokemonUrl).response { response in
 
 // debugPrint(response)
 
 */



*/
}



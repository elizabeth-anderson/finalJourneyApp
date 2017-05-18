//
//  PersistentData.swift
//  Journey
//
//  Created by Student on 5/16/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import Foundation

class JournalEntry : NSObject, NSCoding
{
    
  //  UserDefaults.standard
    struct Keys
    {
        static let VacationLocation = "vacationLocation"
        static let LastName = "lastName"
        
    }
    
    var s = Keys()
    
    
    private var _vacationLocation = ""
    private var _vacationEntry = ""
    override init() {}
    
    init(vacationLocation: String, vacationEntry: String)
    {
        self._vacationLocation = vacationLocation
        self._vacationEntry = vacationEntry
        
    }
    
    required init(coder decoder: NSCoder)
    {
        if let vacationLocationObj = decoder.decodeObject(forKey: Keys.VacationLocation) as? String
        {
            _vacationLocation = vacationLocationObj
        }
        //if let vacationEntryObj = decoder.decodeObject(forKey: Keys.vacationEntryObj) as?
      //  String
       // {
        //    _vacationEntry = _vacationEntryObj
       // }
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(_vacationLocation, forKey: Keys.VacationLocation)
        
        //coder.encode(_vacationEntry, forKey: Keys.VacationEntry)
    }
    
    var VacationLocation: String
    {
    get
    {
        return _vacationLocation
    }
    set
    {
    _vacationLocation = newValue
    }
    
}
    var VacationEntry: String
    {
    get
    {
        return _vacationEntry
    }
    set
    {
    _vacationEntry = newValue
    }
}

    
    
    
    
    
}




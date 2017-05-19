//
//  DiaryClass.swift
//  Journey
//
//  Created by Elizabeth on 5/18/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

class DiaryClass: NSObject {
    var location = ""
    var date = ""
    var text = ""
    var image = UIImage(named: "defualt")
    
    init(Location: String, Date: String, Text: String, Image: UIImage)
    {
        location = Location
        date = Date
        text = Text
        image = Image
        
    }
    
    init(Location: String, Date: String)
    {
        date = Date
        location = Location
    }
    

}

//
//  GroupMenu.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 28/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class GroupMenu: NSObject {
    var name = ""
    var number = 0
    var count = 0
    
    override init(){
        super.init()
    }
    
    required init (coder aDecoder:NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        number = aDecoder.decodeObject(forKey: "number") as! Int
        count = aDecoder.decodeObject(forKey: "count") as! Int
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(number, forKey: "number")
        aCoder.encode(count, forKey: "count")
    }

}

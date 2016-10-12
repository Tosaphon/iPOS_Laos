//
//  MenuList.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 1/10/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class MenuList: NSObject {
    var menu = [Menu()]
    var groupNo = 0
    var groupName = ""
    
    override init(){
        super.init()
    }
    
    required init (coder aDecoder:NSCoder){
        menu = aDecoder.decodeObject(forKey: "menu") as! [Menu]
        groupNo = aDecoder.decodeObject(forKey: "groupNo") as! Int
        groupName = aDecoder.decodeObject(forKey: "groupName") as! String
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(menu, forKey: "menu")
        aCoder.encode(groupNo, forKey: "groupNo")
        aCoder.encode(groupName, forKey: "groupName")
    }
    
}

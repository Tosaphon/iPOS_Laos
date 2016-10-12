//
//  Menu.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 27/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class Menu: NSObject {
    var name = "Menu"
    var price : Double = 0
    var discountPercent = 0
    var discountMoney = 0
    var group = 0
    var picture = "noimage.jpeg"

    
    func setMenu(name:String,price:Double,discountPercent:Int,discountMoney:Int,picture:String,group:Int) {
        self.name = name
        self.price = price
        self.discountPercent = discountPercent
        self.discountMoney = discountMoney
        self.picture = picture
        self.group = group
    }
    
    override init(){
        super.init()
    }
    
    required init (coder aDecoder:NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        price = aDecoder.decodeObject(forKey: "name") as! Double
        discountPercent = aDecoder.decodeObject(forKey: "dPercent") as! Int
        discountMoney = aDecoder.decodeObject(forKey: "dMoney") as! Int
        group = aDecoder.decodeObject(forKey: "group") as! Int
        picture = aDecoder.decodeObject(forKey: "picture") as! String
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(picture, forKey: "picture")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(group, forKey: "group")
        aCoder.encode(discountPercent, forKey: "dPercent")
        aCoder.encode(discountMoney, forKey: "dMoney")
    }
}

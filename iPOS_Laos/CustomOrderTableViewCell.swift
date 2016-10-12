//
//  CustomOrderTableViewCell.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 27/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class CustomOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quan: UILabel!
    @IBOutlet weak var Lable1: UILabel!
    @IBAction func stepperAction(_ sender: AnyObject) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

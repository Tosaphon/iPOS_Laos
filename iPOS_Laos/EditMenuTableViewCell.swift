//
//  EditMenuTableViewCell.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 28/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class EditMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

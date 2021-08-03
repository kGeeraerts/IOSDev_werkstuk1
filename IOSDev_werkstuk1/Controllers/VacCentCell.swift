//
//  VacCentCell.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 03/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class VacCentCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var telefoonnummer: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NBUTableViewCell.swift
//  Currency
//
//  Created by Dima Opalko on 7/14/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit

class NBUTableViewCell: UITableViewCell {
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

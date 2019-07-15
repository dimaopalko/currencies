//
//  PrivatBankTableViewCell.swift
//  Currency
//
//  Created by Dima Opalko on 7/12/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit

class PrivatBankTableViewCell: UITableViewCell {

    @IBOutlet weak var ccyLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
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

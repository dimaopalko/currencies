//
//  PrivatBankCurrency.swift
//  Currency
//
//  Created by Dima Opalko on 7/12/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import Foundation

struct PrivatBankCurrency: Codable {
    let ccy: String
    let baseCCY: String
    let buy: String
    let sale: String
    
    enum CodingKeys: String, CodingKey {
        case ccy
        case baseCCY = "base_ccy"
        case buy
        case sale
    }
}


//
//  NBUCurrency.swift
//  Currency
//
//  Created by Dima Opalko on 7/14/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import Foundation

struct NBUCurrency: Codable {
    let r030: Int
    let name: String
    let rate: Double
    let ccy: String
    let exchengeDate: String
    
    enum CodingKeys: String, CodingKey {
        case r030
        case name = "txt"
        case rate
        case ccy = "cc"
        case exchengeDate = "exchangedate"
    }
}

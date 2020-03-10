//
//  PriceModel.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol PriceModelProtocol {
    var amount: Int { get }
    var currency: String { get }
}

struct PriceModel: PriceModelProtocol, Codable {
    var amount: Int
    var currency: String
}

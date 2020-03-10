//
//  AddressModel.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol AddressModelProtocol {
    var city: String { get }
    var address: String { get }
}

struct AddressModel: AddressModelProtocol, Codable {
    var city: String
    var address: String
}

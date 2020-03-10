//
//  VehicleModel.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol VehicleModelProtocol {
    var regNumber: String { get }
    var modelName: String { get }
    var photo: String { get }
    var driverName: String { get }
}

struct VehicleModel: VehicleModelProtocol, Codable {
    var regNumber: String
    var modelName: String
    var photo: String
    var driverName: String
}

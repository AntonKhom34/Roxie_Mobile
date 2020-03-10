//
//  OrderModel.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol OrderModelProtocol {
    var id: Int { get }
    var startAddress: AddressModel { get }
    var endAddress: AddressModel { get }
    var price: PriceModel { get }
    var orderTime: String { get }
    var vehicle: VehicleModel { get }
}

struct OrderModel: Codable, OrderModelProtocol {
    var id: Int
    var startAddress: AddressModel
    var endAddress: AddressModel
    var price: PriceModel
    var orderTime: String
    var vehicle: VehicleModel
}

/*

     {
     "id": 465,
     "startAddress": {
         "city": "Санкт-Петербург",
         "address": "Пр. Ленина, д. 1"
     },
     "endAddress": {
         "city": "Санкт-Петербург",
         "address": "Пр. Невский, д. 126"
     },
     "price": {
         "amount": 45000,
         "currency": "RUB"
     },
     "orderTime": "2015-08-27T16:36:56+03:00",
     "vehicle": {
         "regNumber": "х555мт98",
         "modelName": "Nissan Almera",
         "photo": "01.jpg",
         "driverName": "Иванов Иван Иванович"
     }
 }
 
 */

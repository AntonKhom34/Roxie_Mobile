//
//  MainServiceProtocol.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol MainServiceProtocol {
    func getOrderList(onComplete: @escaping ([OrderModel]) -> Void)
}

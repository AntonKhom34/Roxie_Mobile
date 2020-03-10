//
//  OrderDetailProviderProtocol.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

protocol OrderDetailProviderProtocol {
    func getImage(name: String, onComplete: @escaping (UIImage?) -> Void)
}

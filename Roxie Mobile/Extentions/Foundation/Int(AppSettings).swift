//
//  Int(AppSettings).swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

enum CurrencyType: String {
    case CurrencyTypeRUB = "RUB"
}

extension CurrencyType {
    func getCurrentString() -> String {
        switch self {
            case .CurrencyTypeRUB:
                return "руб"
        }
    }
}

extension Int {
    func getCurrentPrice(currency: String) -> String {
        let integerPath = self / 100
        let remainder = self % 100
        let currency = CurrencyType(rawValue: currency)
        if remainder >= 10 {
            return "\(integerPath).\(remainder) " + (currency?.getCurrentString() ?? "")
        } else {
            return "\(integerPath).0\(remainder) " + (currency?.getCurrentString() ?? "")
        }
    }
}

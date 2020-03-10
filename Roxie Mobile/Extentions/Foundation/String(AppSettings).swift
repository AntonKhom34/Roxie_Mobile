//
//  String(AppSettings).swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        let localizebleString = NSLocalizedString(self, comment: "")
        return localizebleString
    }
    
    func dateFormater(format: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        if let date = dateFormatterGet.date(from: self) {
            return dateFormatter.string(from: date)
        } else {
            print("could not get current date format")
            return ""
        }
    }
    
}

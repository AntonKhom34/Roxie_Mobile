//
//  RoxieMobileUserDefaults.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 09.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

class RoxieMobileUserDefaults: NSObject {

    // MARK: - Set
    
    static func setSaveDate(photoName: String) {
        let time: UInt64 = DispatchTime.now().rawValue
        let defaults = UserDefaults.standard
        defaults.setValue(time, forKey: photoName)
        defaults.synchronize()
    }

    // MARK: - Get
    
    static func getSaveDate(photoName: String) -> DispatchTime? {
        guard let time = UserDefaults.standard.value(forKey: photoName) as? UInt64 else {
            return nil
        }
        return DispatchTime(uptimeNanoseconds: time)
    }
    
    // MARK: - Remove
    
    static func removeSaveDate(photoName: String) {
        UserDefaults.standard.removeObject(forKey: photoName)
    }

}

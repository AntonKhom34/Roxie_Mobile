//
//  AppearanceConfigDefault.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class AppearanceConfigDefault: AppearanceConfigProtocol {
    
    // MARK: - Colors
    
    var defaultTextColor: UIColor {
        get {
            return UIColor.black
        }
    }
    
    // MARK: - Fonts
    
    var defaultTextFont: UIFont {
           get {
               return UIFont.systemFont(ofSize: 16, weight: .medium)
           }
       }
    
}

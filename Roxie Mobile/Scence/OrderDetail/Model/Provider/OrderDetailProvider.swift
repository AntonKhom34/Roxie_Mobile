//
//  OrderDetailProvider.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class OrderDetailProvider {
    
    // MARK: - Const
    
    private let tenMin: TimeInterval = 600
    
    // MARK: - Properties
    
    var service: OrderDetailServiceProtocol
    
    // MARK: - Init
    
    init(service: OrderDetailServiceProtocol) {
        self.service = service
    }
    
    // MARK: - Private
    
    private func saveImage(name: String, onComplete: @escaping (UIImage?) -> Void) {
        StorageHelper.download(url: name) {
            DispatchQueue.main.async {
                let image = StorageHelper.getSaveFileUrl(fileName: name)
                RoxieMobileUserDefaults.setSaveDate(photoName: name)
                onComplete(UIImage(named: image))
            }
        }
    }
    
}

// MARK: - OrderDetailProviderProtocol

extension OrderDetailProvider: OrderDetailProviderProtocol {
    func getImage(name: String, onComplete: @escaping (UIImage?) -> Void) {
        let saveTime: DispatchTime = RoxieMobileUserDefaults.getSaveDate(photoName: name) ?? DispatchTime.init(uptimeNanoseconds: 0)
        if saveTime > (DispatchTime.now() - self.tenMin) {
            let image = StorageHelper.getSaveFileUrl(fileName: name)
            onComplete(UIImage(named: image))
        } else {
            StorageHelper.removeFromStorage(photo: name)
            RoxieMobileUserDefaults.removeSaveDate(photoName: name)
            self.saveImage(name: name) { image in
                onComplete(image)
            }
        }
    }
    
}

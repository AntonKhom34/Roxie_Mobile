//
//  MainProvider.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

class MainProvider {
    
    // MARK: - Properties
    
    var service: MainServiceProtocol
    
    // MARK: - Init
    
    init(service: MainServiceProtocol) {
        self.service = service
    }
    
}

// MARK: - MainProviderProtocol

extension MainProvider: MainProviderProtocol {
    func getOrderList(onComplete: @escaping ([OrderModel]) -> Void) {
        self.service.getOrderList(onComplete: { orderList in
            DispatchQueue.main.async {
                onComplete(orderList)
            }
        })
    }
}

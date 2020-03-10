//
//  MainService.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

class MainService {
    
    // MARK: - Private
    
    private func getOrderListURL() -> URL {
        let urlString = ServiceManager.api + "orders.json"
        guard let url = URL(string: urlString) else {
            fatalError("Could not get URL from:\(urlString)")
        }
        return url
    }
    
}

// MARK: - MainServiceProtocol

extension MainService: MainServiceProtocol {
    
    func getOrderList(onComplete: @escaping ([OrderModel]) -> Void) {
        URLSession.shared.dataTask(with: self.getOrderListURL()) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }
            do {
                let dataResult = try JSONDecoder().decode([OrderModel].self, from: data)
                onComplete(dataResult)
            } catch {
                onComplete([])
            }
            }.resume()
    }

}

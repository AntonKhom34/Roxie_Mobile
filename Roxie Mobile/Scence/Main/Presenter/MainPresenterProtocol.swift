//
//  MainPresenterProtocol.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {
    func onViewWillAppear()
    func getCellCount() -> Int
    func getModelWith(indexPath: IndexPath) -> OrderModel
    func getAppearance() -> AppearanceConfigProtocol
    func userSelectedOrderWithIndex(_ indexPath: Int)
}

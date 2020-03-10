//
//  MainPresenter.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

class MainPresenter {
    
    // MARK: - Const
    
    private let provider: MainProviderProtocol
    
    // MARK: - Properties
    
    unowned var view: MainViewProtocol
    private var appearance: AppearanceConfigProtocol?
    private var orderList: [OrderModel]
    
    // MARK: - Init
    
    init(view: MainViewProtocol, provider: MainProviderProtocol, appearance: AppearanceConfigProtocol) {
        self.view = view
        self.provider = provider
        self.appearance = appearance
        self.orderList = []
    }
    
    // MARK: - Private
    
    private func getOrderList() {
        self.provider.getOrderList() { [weak self] orderList in
            guard let strongSelf = self else {
                return
            }
            strongSelf.orderList = orderList.sorted(by: { $0.orderTime > $1.orderTime })
            strongSelf.view.reloadTable()
        }
    }
    
}

// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
    func onViewWillAppear() {
        self.getOrderList()
    }
    
    func getCellCount() -> Int {
        return self.orderList.count
    }
    
    func getModelWith(indexPath: IndexPath) -> OrderModel {
        return self.orderList[indexPath.row]
    }
    
    func getAppearance() -> AppearanceConfigProtocol {
        guard let appearance = self.appearance else {
            return AppearanceConfigDefault()
        }
        return appearance
    }
    
    func userSelectedOrderWithIndex(_ indexPath: Int) {
        self.view.showOrderDetail(appearance: self.getAppearance(), order: self.orderList[indexPath])
    }
    
}

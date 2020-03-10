//
//  OrderDetailPresenter.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class OrderDetailPresenter {
    
    // MARK: - Const
    
    private let provider: OrderDetailProviderProtocol
    
    // MARK: - Properties
    
    unowned var view: OrderDetailViewProtocol
    private var appearance: AppearanceConfigProtocol?
    private var order: OrderModel?
    
    // MARK: - Init
    
    init(view: OrderDetailViewProtocol,
         provider: OrderDetailProviderProtocol,
         appearance: AppearanceConfigProtocol,
         order: OrderModel) {
        self.view = view
        self.provider = provider
        self.appearance = appearance
        self.order = order
    }
    
    // MARK: - Private
    
    private func getOrder() -> OrderModel {
        guard let order = self.order else {
            fatalError("order is nil")
        }
        return order
    }
    
    private func getImage() {
        self.provider.getImage(name: self.getOrder().vehicle.photo) { image in
            self.view.setImage(image: image)
        }
    }
    
}

// MARK: - OrderDetailPresenterProtocol

extension OrderDetailPresenter: OrderDetailPresenterProtocol {
    func onViewDidLoad() {
        self.view.fillInfo(order: self.getOrder())
        self.getImage()
    }

}

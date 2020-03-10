//
//  ViewControllerFactory.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    // MARK: - make Main screen OrderDetail
    
    static func makeMainViewController(appearance: AppearanceConfigProtocol) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as! MainViewController
        let provider = MainProvider(service: MainService())
        let presenter = MainPresenter(view: view, provider: provider, appearance: appearance)
        view.presenter = presenter
        return view
    }
    
    // MARK: - make Order detail
    
    static func makeOrderDetailViewController(appearance: AppearanceConfigProtocol,
                                              order: OrderModel) -> UIViewController {
        let view = UIStoryboard(name: "OrderDetail", bundle: nil).instantiateViewController(withIdentifier: "OrderDetail") as! OrderDetailViewController
        let provider = OrderDetailProvider(service: OrderDetailService())
        let presenter = OrderDetailPresenter(view: view, provider: provider,
                                             appearance: appearance, order: order)
        view.presenter = presenter
        return view
    }
    
}

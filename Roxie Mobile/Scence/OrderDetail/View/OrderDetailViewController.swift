//
//  OrderDetailViewController.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var startAddressLabel: UILabel!
    @IBOutlet private weak var endAddressLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var orderCostLabel: UILabel!
    @IBOutlet private weak var diriverNameLabel: UILabel!
    @IBOutlet private weak var carLabel: UILabel!
    
    // MARK: - Properties
    
    var presenter: OrderDetailPresenterProtocol?
    
    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPresenter().onViewDidLoad()
        self.setup()
    }
    
    // MARK: - setup
    
    private func setup() {
        self.setupColors()
        self.setupFonts()
        self.setupNavigationPanel()
    }
    
    private func setupColors() {
        
    }
    
    private func setupFonts() {
        
    }
    
    private func setupNavigationPanel() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "OrderDetail_Title".localize()
    }
    
    // MARK: - Private
    
    private func getPresenter() -> OrderDetailPresenterProtocol {
        guard let presenter = self.presenter else {
            fatalError("presenter is nil")
        }
        return presenter
    }
    
    private func getCurrentAddress(address: AddressModel) -> String {
        return address.address + ". " + address.city
    }

}

// MARK: - OrderDetailViewProtocol

extension OrderDetailViewController: OrderDetailViewProtocol {
    func fillInfo(order: OrderModel) {
        self.startAddressLabel.text = "OrderDetail_StartAdress".localize() + self.getCurrentAddress(address: order.startAddress)
        self.endAddressLabel.text = "OrderDetail_EndAdress".localize() + self.getCurrentAddress(address: order.endAddress)
        self.dateLabel.text = "OrderDetail_Date".localize() + order.orderTime.dateFormater(format: "dd:MM:yyyy")
        self.orderCostLabel.text = "OrderDetail_Cost".localize() + order.price.amount.getCurrentPrice(currency: order.price.currency)
        self.diriverNameLabel.text = "OrderDetail_Name".localize() + order.vehicle.driverName
        self.carLabel.text = "\(order.vehicle.modelName): \(order.vehicle.regNumber)"
    }
    
    func setImage(image: UIImage?) {
        self.carImage.image = image
    }

}

//
//  OrderInfoTableViewCell.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class OrderInfoTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var startAddressLabel: UILabel!
    @IBOutlet private weak var endAddressLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var orderCostLabel: UILabel!
    
    // MARK: - Properties
    
    private var appearance: AppearanceConfigProtocol?
    
    // MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup
    
    private func setup() {
        self.setupColors()
        self.setupFonts()
    }
    
    private func setupColors() {
        self.startAddressLabel.textColor = self.getAppearance().defaultTextColor
        self.endAddressLabel.textColor = self.getAppearance().defaultTextColor
        self.dateLabel.textColor = self.getAppearance().defaultTextColor
        self.orderCostLabel.textColor = self.getAppearance().defaultTextColor
    }
    
    private func setupFonts() {
        self.startAddressLabel.font = self.getAppearance().defaultTextFont
        self.endAddressLabel.font = self.getAppearance().defaultTextFont
        self.dateLabel.font = self.getAppearance().defaultTextFont
        self.orderCostLabel.font = self.getAppearance().defaultTextFont
    }
    
    // MARK: - Public
    
    func fillCellInfo(model: OrderModel, appearance: AppearanceConfigProtocol) {
        self.startAddressLabel.text = "Main_StartAdress".localize() + self.getCurrentAddress(address: model.startAddress)
        self.endAddressLabel.text = "Main_EndAdress".localize() + self.getCurrentAddress(address: model.endAddress)
        self.dateLabel.text = "Main_Date".localize() + model.orderTime.dateFormater(format: "dd:MM:yyyy")
        self.orderCostLabel.text = "Main_Cost".localize() + model.price.amount.getCurrentPrice(currency: model.price.currency)
    }
    
    // MARK: - Private
    
    private func getAppearance() -> AppearanceConfigProtocol {
        guard let appearance = self.appearance else {
            return AppearanceConfigDefault()
        }
        return appearance
    }
    
    private func getCurrentAddress(address: AddressModel) -> String {
        return address.address + ". " + address.city
    }
    
}

// MARK: - NibName

extension OrderInfoTableViewCell {
    static let nibName = "OrderInfoTableViewCell"
}

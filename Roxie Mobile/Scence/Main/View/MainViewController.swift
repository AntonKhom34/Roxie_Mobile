//
//  MainViewController.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    static private let orderInfoCellId = "OrderInfoTableViewCell"
    
    // MARK: - Outlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationPanel()
        self.getPresenter().onViewWillAppear()
    }
    
    // MARK: - setup
    
    private func setup() {
        self.setupTable()
    }
    
    private func setupNavigationPanel() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: OrderInfoTableViewCell.nibName, bundle: nil),
                           forCellReuseIdentifier: MainViewController.orderInfoCellId)
    }
    
    // MARK: - Private
    
    private func getPresenter() -> MainPresenterProtocol {
        guard let presenter = self.presenter else {
            fatalError("presenter is nil")
        }
        return presenter
    }

}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showOrderDetail(appearance: AppearanceConfigProtocol, order: OrderModel) {
        let viewController = ViewControllerFactory.makeOrderDetailViewController(appearance: appearance,
                                                                                 order: order)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.getPresenter().getCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewController.orderInfoCellId, for: indexPath)
        guard let orderInfoCell = cell as? OrderInfoTableViewCell else {
            fatalError("Cell is not OrderInfoTableViewCell")
        }
        orderInfoCell.fillCellInfo(model: self.getPresenter().getModelWith(indexPath: indexPath),
                                   appearance: self.getPresenter().getAppearance())
        return orderInfoCell
    }
    
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.getPresenter().userSelectedOrderWithIndex(indexPath.row)
    }
}

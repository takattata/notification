//
//  SettingListViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

protocol SettingListView: class {
    func showSetting(with: AlertDay, at: Int)
    func setAlertDay(with: AlertDay, at: Int)
}

class SettingListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private(set) lazy var dataSource = SettingListViewDataSource.init(presenter: self.presenter)
    private lazy var presenter = SettingListViewPresenter(view: self)

    static func instantiate() -> SettingListViewController {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as! SettingListViewController

        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.configure(with: tableView)
        setupNavigation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
}

extension SettingListViewController {
    private func setupNavigation() {
        navigationItem.title = "通知リスト"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "追加", style: .done, target: self, action: #selector(SettingListViewController.plusButtonTap))
    }

    @objc private func plusButtonTap(_ sender: UIBarButtonItem) {
        presenter.showSetting()
    }
}

extension SettingListViewController: SettingListView {
    func showSetting(with date: AlertDay, at row: Int) {
        let viewController = SettingViewController.instantiate(date: date, line: row)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func setAlertDay(with date: AlertDay, at row: Int) {
        presenter.setDay(with: date, at: row)
    }
}

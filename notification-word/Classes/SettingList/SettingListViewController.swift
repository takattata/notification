//
//  SettingListViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class SettingListViewController: UIViewController {
    enum Section: Int {
        case alert

        case MAX_NUM
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self

            tableView.register(UINib(nibName: Identifier.Cell.alertDateCell, bundle: nil), forCellReuseIdentifier: Identifier.Cell.alertDateCell)
        }
    }

    static func create() -> SettingListViewController {
        let storyboard = UIStoryboard(name: Identifier.Storyboard.settingListViweController, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Identifier.Storyboard.settingListViweController) as! SettingListViewController

        return viewController
    }
}

extension SettingListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .alert:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.alertDateCell, for: indexPath) as! AlertDateCell
            cell.configure(time: Date(), dayOfTheWeek: "月(test)", enabled: true)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension SettingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else {
            return
        }

        switch section {
        case .alert:
            ///FIXME: model作って渡す、かな.
            showSetting()
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ///FIXME: 破棄.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension SettingListViewController {
    private func setupNavigation() {
        navigationItem.title = "通知リスト"
    }

    private func showSetting() {
        let viewController = SettingViewController.create()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

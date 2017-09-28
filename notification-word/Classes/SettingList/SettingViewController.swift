//
//  SettingViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    enum Section: Int {
        case alertDate

        case MAX_NUM
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self

            tableView.register(UINib(nibName: Identifier.Cell.alertDateCell, bundle: nil), forCellReuseIdentifier: Identifier.Cell.alertDateCell)
        }
    }

    static func create() -> SettingViewController {
        let storyboard = UIStoryboard(name: Identifier.Storyboard.settingViweController, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Identifier.Storyboard.settingViweController) as! SettingViewController

        return viewController
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .alertDate:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.alertDateCell, for: indexPath) as! AlertDateCell
            cell.configure(time: Date(), dayOfTheWeek: "月(test)", enabled: true)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//
//  SettingViewDataSource.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

final class SettingViewDataSource: NSObject {
    enum Section: Int {
        case date
        case time

        case MAX_NUM
    }

    func configure(with tableView: UITableView) {
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false

        tableView.register(cellType: AlertDateCell.self)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .date:
            let cell = tableView.dequeueReusableCell(with: SettingDateCell.self, for: indexPath)
            cell.configure()
            return cell
        case .time:
            let cell = tableView.dequeueReusableCell(with: SettingTimeCell.self, for: indexPath)
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//
//  SettingListViewDataSource.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

final class SettingListViewDataSource: NSObject {
    enum Section: Int {
        case alert

        case MAX_NUM
    }

    private let presenter: SettingListPresenter

    init(presenter: SettingListPresenter) {
        self.presenter = presenter
    }

    func configure(with tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(cellType: AlertDayCell.self)
    }
}

extension SettingListViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countOfDays()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .alert:
            let cell = tableView.dequeueReusableCell(with: AlertDayCell.self, for: indexPath)
            if let data = presenter.getDay(at: indexPath.row), let date = data.time.date {
                cell.configure(time: date, dayOfTheWeek: data.days, enabled: data.enabled)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension SettingListViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else {
            return
        }

        switch section {
        case .alert:
            if let date = presenter.getDay(at: indexPath.row) {
                presenter.showSetting(with: date, at: indexPath.row)
            }
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.removeDay(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//
//  SettingListViewPresenter.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

protocol SettingListPresenter: class {
    init(view: SettingListView)
    func showSetting(with: AlertDay?, at: Int)
    func countOfDays() -> Int
    func getDay(at: Int) -> AlertDay?
    func removeDay(at row: Int)
    func setAllNotification()
}

final class SettingListViewPresenter: SettingListPresenter {
    private weak var view: SettingListView?
    private var dates = AlertDays()

    init(view: SettingListView) {
        self.view = view
    }

    ///FIXME: for displaying.
    func fetchDates() {
    }

    func showSetting(with date: AlertDay? = nil, at row: Int = 0) {
        var target: AlertDay
        if let date = date {
            target = date
        } else {
            target = AlertDay(days: "", time: DateComponents(), enabled: true)
            dates.add(target)
        }
        view?.showSetting(with: target, at: row)
    }

    func countOfDays() -> Int {
        return dates.count
    }

    ///FIXME: UInt or check row.
    func getDay(at row: Int) -> AlertDay? {
        return dates.date(at: row)
    }

    func setDay(with date: AlertDay, at row: Int) {
        dates.set(with: date, at: row)
    }

    func removeDay(at row: Int) {
        dates.remove(at: row)
    }

    ///FIXME: call at willEnterBackground.
    func setAllNotification() {

    }
}

//
//  SettingListViewPresenter.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let listFetchDates = Notification.Name("listFetchDates")
}
fileprivate extension Selector {
    static let fetchDates = #selector(SettingListViewPresenter.fetchDates)
}

protocol SettingListPresenter: class {
    init(view: SettingListView)
    func viewDidLoad()
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

    func viewDidLoad() {
        fetchDates()
        NotificationCenter.default.addObserver(self, selector: Selector.fetchDates, name: .listFetchDates, object: nil)
    }

    ///FIXME: for displaying.
    ///FIXME: remove @objc. 
    @objc func fetchDates() {
        let userDefaults = UserDefaults.standard
        var days = userDefaults.object(forKey: AlertDay.Parameter.days.rawValue) as? [String]
        var times = userDefaults.object(forKey: AlertDay.Parameter.time.rawValue) as? [String]
        var flags = userDefaults.object(forKey: AlertDay.Parameter.enabled.rawValue) as? [Bool]
        dates.reset()
        if let count = days?.count {
            for i in 0..<count {
                ///FIXME: not date extension!!!!
                let time = Date().convertTime(with: times![i])
                let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: time!)
                dates.add(AlertDay(days: days![i], time: dateComponents, enabled: flags![i]))
            }
        }
    }

    func showSetting(with date: AlertDay?, at row: Int) {
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

    func removeDay(at row: Int) {
        dates.remove(at: row)
    }

    ///FIXME: call at willEnterBackground.
    func setAllNotification() {

    }
}

//
//  SettingViewPresenter.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

protocol SettingPresenter: class {
    var alertDay: AlertDay! { get set }
    var line: Int! { get set }

    init(view: SettingView)
}

final class SettingViewPresenter: SettingPresenter {
    var alertDay: AlertDay!
    var line: Int!

    private weak var view: SettingView?

    init(view: SettingView) {
        self.view = view
    }

    func setDay(with days: String) {
        alertDay.days = days
    }

    func setTime(with time: DateComponents) {
        alertDay.time = time
    }

    ///FIXME: save to UserDefaults.
    func save() {
        ///FIXME: ugly source... 
        let manager = AlertManager()
        manager.saveToAdd(with: alertDay, at: line)
        NotificationCenter.default.post(name: .listFetchDates, object: nil)
    }
}

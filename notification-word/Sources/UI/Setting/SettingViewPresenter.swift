//
//  SettingViewPresenter.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

protocol SettingPresenter: class {
    init(view: SettingView)
}

final class SettingViewPresenter: SettingPresenter {
    private weak var view: SettingView?

    init(view: SettingView) {
        self.view = view
    }
}

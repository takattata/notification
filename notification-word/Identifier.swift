//
//  Identifier.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

///FIXME: 管理方法考える余地あり.
struct Identifier {
    struct Cell {
        static let quotationCell = "QuotationCell"
        static let textCell = "TextCell"
        static let alertDateCell = "AlertDateCell"
        static let settingDateCell = "SettingDateCell"
        static let settingTimeCell = "SettingTimeCell"
    }

    struct Storyboard {
        static let homeViweController = "HomeViewController"
        static let settingListViweController = "SettingListViewController"
        static let settingViewController = "SettingViewController"
    }
}

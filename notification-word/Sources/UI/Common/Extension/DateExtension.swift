//
//  DateExtension.swift
//  notification-word
//
//  Created by Takashima on 2017/10/27.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

extension Date {
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }

    func displayTime() -> String {
        return dateFormatter.string(from: self)
    }

    func convertTime(with time: String) -> Date? {
        return dateFormatter.date(from: time)
    }
}

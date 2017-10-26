//
//  AlertDays.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

///FIXME: should use Calender.
enum Day: Int {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday

    static var text: [String] { return ["日", "月", "火", "水", "木", "金", "土"] }

    static func days(_ days: [Day]) -> String {
        let text = self.text
        var value = ""
        days.forEach { day in
            value += text[day.rawValue]
        }
        return value
    }

    static func days(_ value: String) -> [Day] {
        var days: [Day] = []
        value.characters.forEach { character in
            if let index = text.index(of: character.description), let day = Day(rawValue: index) {
                days.append(day)
            }
        }
        return days
    }
}

struct AlertDay {
    var days: String
    var time: DateComponents
    var enabled: Bool

    enum Parameters {
        case days(line: Int)
        case time(line: Int)
        case enabled(line: Int)
    }
    static func key(with parameter: Parameters) -> String {
        switch parameter {
        case let .days(line):
            return "AlertDay\(line).days"
        case let .time(line):
            return "AlertDay\(line).time"
        case let .enabled(line):
            return "AlertDay\(line).enabled"
        }
    }
}

class AlertDays {
    var count: Int { return alerts.count }
    private var alerts: [AlertDay] = []

    func add(_ alert: AlertDay) {
        alerts.append(alert)
    }

    func remove(at row: Int) {
        alerts.remove(at: row)
    }

    func set(with alert: AlertDay, at row: Int) {
        alerts[row] = alert
    }

    func date(at index: Int) -> AlertDay? {
        return index < count ? alerts[index] : nil
    }
}

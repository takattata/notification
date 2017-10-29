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
    enum Parameter: String {
        case days = "AlertDays"
        case time = "AlertTimes"
        case enabled = "AlertEnabled"
    }

    var days: String
    var time: DateComponents
    var enabled: Bool
}

class AlertDays {
    var count: Int { return alerts.count }
    private var alerts: [AlertDay] = []

    func reset() {
        alerts.removeAll()
    }

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

class AlertManager {
    let userDefaults = UserDefaults.standard

    func loadDays() -> [String] {
        var days: [String] = []
        if userDefaults.object(forKey: AlertDay.Parameter.days.rawValue) != nil {
            days = userDefaults.object(forKey: AlertDay.Parameter.days.rawValue) as! [String]
        }
        return days
    }

    func loadTimes() -> [String] {
        var times: [String] = []
        if userDefaults.object(forKey: AlertDay.Parameter.days.rawValue) != nil {
            times = userDefaults.object(forKey: AlertDay.Parameter.time.rawValue) as! [String]
        }
        return times
    }

    func loadFlags() -> [Bool] {
        var flags: [Bool] = []
        if userDefaults.object(forKey: AlertDay.Parameter.enabled.rawValue) != nil {
            flags = userDefaults.object(forKey: AlertDay.Parameter.enabled.rawValue) as! [Bool]
        }
        return flags
    }

    func saveToAdd(with alertDay: AlertDay, at line: Int) {
        var days = loadDays()
        var times = loadTimes()
        var flags = loadFlags()
        let time = alertDay.time.date?.displayTime()
        if line < days.count {
            days[line] = alertDay.days
            times[line] = time!
            flags[line] = alertDay.enabled
        } else {
            days.append(alertDay.days)
            times.append(time!)
            flags.append(alertDay.enabled)
        }
        userDefaults.set(days, forKey: AlertDay.Parameter.days.rawValue)
        userDefaults.set(times, forKey: AlertDay.Parameter.time.rawValue)
        userDefaults.set(flags, forKey: AlertDay.Parameter.enabled.rawValue)
    }

    func saveToDelete(at line: Int) {
        var days = loadDays()
        var times = loadTimes()
        var flags = loadFlags()
        if line < days.count {
            days.remove(at: line)
            times.remove(at: line)
            flags.remove(at: line)
        }
        userDefaults.set(days, forKey: AlertDay.Parameter.days.rawValue)
        userDefaults.set(times, forKey: AlertDay.Parameter.time.rawValue)
        userDefaults.set(flags, forKey: AlertDay.Parameter.enabled.rawValue)
    }

    func reset() {
        userDefaults.removeObject(forKey: AlertDay.Parameter.days.rawValue)
        userDefaults.removeObject(forKey: AlertDay.Parameter.time.rawValue)
        userDefaults.removeObject(forKey: AlertDay.Parameter.enabled.rawValue)
    }
}

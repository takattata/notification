//
//  UIDatePickerExtension.swift
//  notification-word
//
//  Created by Takashima on 2017/10/30.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

import UIKit

extension UIDatePicker {
    /// Returns the date that reflects the displayed date clamped to the `minuteInterval` of the picker.
    /// - note: Adapted from [ima747's](http://stackoverflow.com/users/463183/ima747) answer on [Stack Overflow](http://stackoverflow.com/questions/7504060/uidatepicker-with-15m-interval-but-always-exact-time-as-return-value/42263214#42263214})
    public var clampedDate: Date {
        let referenceTimeInterval = self.date.timeIntervalSinceReferenceDate
        let remainingSeconds = referenceTimeInterval.truncatingRemainder(dividingBy: TimeInterval(minuteInterval * 60))
        let timeRoundedToInterval = referenceTimeInterval - remainingSeconds
        return Date(timeIntervalSinceReferenceDate: timeRoundedToInterval)
    }
}

//
//  AlertDateCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class AlertDateCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var enableSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func configure(time: Date, dayOfTheWeek: String, enabled: Bool) {
        setTime(time)//Date())
        setDate(dayOfTheWeek)//"月(test)")
        setEnable(enabled)
    }

    private func setTime(_ time: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        timeLabel.text = formatter.string(from: time)
    }

    private func setDate(_ dayOfTheWeek: String) {
        dateLabel.text = dayOfTheWeek
    }

    private func setEnable(_ enabled: Bool) {
        enableSwitch.isOn = enabled
    }
}

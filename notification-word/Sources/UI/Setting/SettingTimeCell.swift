//
//  SettingTimeCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class SettingTimeCell: UITableViewCell {
    @IBOutlet weak var datePicker: UIDatePicker!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func configure(with time: DateComponents) {
    }

    func getData() -> DateComponents {
        return Calendar.current.dateComponents(in: TimeZone.current, from: datePicker.clampedDate)
    }
}

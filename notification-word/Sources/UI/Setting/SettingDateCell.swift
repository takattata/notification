//
//  SettingDaysCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class SettingDaysCell: UITableViewCell {
    @IBOutlet weak var daysStackView: UIStackView!
    @IBOutlet weak var groupStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func configure(with days: String) {
        setDay(with: days)
        setGroup()
    }

    func getData() -> String {
        var days = ""
        daysStackView.arrangedSubviews.forEach { day in
            if let button = day as? UIButton, button.isSelected, let titleLabel = button.titleLabel {
                days += titleLabel.text ?? ""
            }
        }
        return days
    }

    private func setDay(with days: String) {
        daysStackView.arrangedSubviews.forEach { body in
            if let body: UIButton = body as? UIButton {
                body.layer.borderWidth = 1
                body.layer.borderColor = UIColor.systemBlue.cgColor
                body.addTarget(self, action: #selector(SettingDaysCell.dayButtonTap), for: .touchUpInside)
                body.setTitleColor(.white, for: .selected)
                if days.contains((body.titleLabel?.text?.characters.first)!) {
                    body.isSelected = true
                    body.layer.backgroundColor = UIColor.systemBlue.cgColor
                }
            }
        }
    }

    private func setGroup() {
        groupStackView.arrangedSubviews.forEach { body in
            if let body: UIButton = body as? UIButton {
                body.layer.borderWidth = 1
                body.layer.borderColor = UIColor.systemBlue.cgColor
                body.addTarget(self, action: #selector(SettingDaysCell.groupButtonTap), for: .touchUpInside)
                body.setTitleColor(.white, for: .selected)
            }
        }
    }

    @objc private func dayButtonTap(_ sender: UIButton) {
        let isOn = sender.layer.backgroundColor == UIColor.systemBlue.cgColor
        sender.isSelected = !isOn
        sender.layer.backgroundColor = sender.isSelected ? UIColor.systemBlue.cgColor : UIColor.white.cgColor
    }

    ///FIXME: 日付グループ機能.
    @objc private func groupButtonTap(_ sender: UIButton) {
        let isOn = sender.layer.backgroundColor == UIColor.systemBlue.cgColor
        sender.isSelected = !isOn
        sender.layer.backgroundColor = sender.isSelected ? UIColor.systemBlue.cgColor : UIColor.white.cgColor
    }
}

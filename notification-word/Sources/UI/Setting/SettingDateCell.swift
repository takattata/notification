//
//  SettingDateCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class SettingDateCell: UITableViewCell {
    @IBOutlet weak var dateStackView: UIStackView!
    @IBOutlet weak var groupStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func configure() {
        setDate()
        setGroup()
    }

    private func setDate() {
        dateStackView.arrangedSubviews.forEach { body in
            if let body: UIButton = body as? UIButton {
                body.layer.borderWidth = 1
                body.layer.borderColor = UIColor.systemBlue.cgColor
                body.addTarget(self, action: #selector(SettingDateCell.dateButtonTap), for: .touchUpInside)
                body.setTitleColor(.white, for: .selected)
            }
        }
    }

    private func setGroup() {
        groupStackView.arrangedSubviews.forEach { body in
            if let body: UIButton = body as? UIButton {
                body.layer.borderWidth = 1
                body.layer.borderColor = UIColor.systemBlue.cgColor
                body.addTarget(self, action: #selector(SettingDateCell.groupButtonTap), for: .touchUpInside)
                body.setTitleColor(.white, for: .selected)
            }
        }
    }

    @objc private func dateButtonTap(_ sender: UIButton) {
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

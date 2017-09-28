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
            body.layer.borderWidth = 1
            body.layer.borderColor = UIColor.blue.cgColor
        }
    }

    private func setGroup() {
        groupStackView.arrangedSubviews.forEach { body in
            body.layer.borderWidth = 1
            body.layer.borderColor = UIColor.blue.cgColor
        }
    }
}

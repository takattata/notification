//
//  TextCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class TextCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func configure() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "本文あああああああああああああああああああああああああああああああああああああああああ"
    }
}

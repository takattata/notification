//
//  WordCell.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var quotationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        titleLabel.numberOfLines = 0
        quotationLabel.numberOfLines = 0
    }

    func configure(title: String, quotation: String) {
        titleLabel.text = title

        quotationLabel.text = quotation
    }
}

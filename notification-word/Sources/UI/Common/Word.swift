//
//  Word.swift
//  notification-word
//
//  Created by Takashima on 2017/10/16.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

class Word {
    var id: Int
    var text: String
    var quotation: String

    init(id: Int, text: String, quotation: String) {
        self.id = id
        self.text = text
        self.quotation = quotation
    }
}

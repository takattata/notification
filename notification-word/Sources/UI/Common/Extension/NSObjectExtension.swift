//
//  NSObjectExtension.swift
//  notification-word
//
//  Created by Takashima on 2017/10/07.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

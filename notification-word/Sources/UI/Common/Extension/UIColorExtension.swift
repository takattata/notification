//
//  UIColorExtension.swift
//  notification-word
//
//  Created by Takashima on 2017/10/03.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    private enum System: UInt {
        case blue = 0x007aff
        case green = 0x4cd964
        case red = 0xff3b30
        case gray1 = 0xf5f5f7
        case gray2 = 0xefeff4
    }

    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red: CGFloat   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat  = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    class var systemBlue: UIColor { return UIColor(hex: System.blue.rawValue, alpha: 1.0) }
    class var systemGreen: UIColor { return UIColor(hex: System.green.rawValue, alpha: 1.0) }
    class var systemRed: UIColor { return UIColor(hex: System.red.rawValue, alpha: 1.0) }
    class var systemGray1: UIColor { return UIColor(hex: System.gray1.rawValue, alpha: 1.0) }
    class var systemGray2: UIColor { return UIColor(hex: System.gray2.rawValue, alpha: 1.0) }
}

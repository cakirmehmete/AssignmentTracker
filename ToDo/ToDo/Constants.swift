//
//  Constants.swift
//  ToDo
//
//  Created by Emre Cakir on 6/8/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Colors {
        static let green = UIColor(hexString: "4CAF50")
        static let blue = UIColor(hexString: "03A9F4")
        static let red = UIColor(hexString: "F44336")
        static let teal = UIColor(hexString: "00BCD4")
        static let orange = UIColor(hexString: "FF9800")
        static let lightGreen = UIColor(hexString: "90CD53")
        static let yellow = UIColor(hexString: "F8E71C")
        static let brown = UIColor(hexString: "8B572A")
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

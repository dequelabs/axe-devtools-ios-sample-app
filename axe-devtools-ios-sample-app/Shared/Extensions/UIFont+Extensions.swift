//
//  UIFont+Extensions.swift
//  axe-devtools-ios-sample-app
//

import UIKit

extension UIFont {
    enum FontWeight: String {
        case light = "Light"
        case extraBold = "ExtraBold"
    }

    /// The Gilroy font. Default weight is .light and fontSize is 16.
    static func gilroy(
        _ weight: FontWeight = .light,
        _ fontSize: CGFloat = 16
    ) -> UIFont {
        UIFont(
            name: "Gilroy-\(weight.rawValue)",
            size: fontSize
        ) ?? .systemFont(ofSize: fontSize)
    }

    /// The Italiana font. The default fontSize is 32.
    static func italiana(_ fontSize: CGFloat = 32) -> UIFont {
        UIFont(
            name: "Italiana-Regular",
            size: fontSize
        ) ?? .systemFont(ofSize: fontSize)
    }
}

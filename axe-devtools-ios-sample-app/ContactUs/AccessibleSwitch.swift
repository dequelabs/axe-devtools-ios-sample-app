//
//  AccessibleSwitch.swift
//  axe-devtools-ios-sample-app
//
//  Created by Nitya Baddam on 2/5/26.
//

import UIKit

class AccessibleSwitch: UISwitch {
    override var accessibilityPath: UIBezierPath? {
        get {
            guard let parent = self.superview else { return nil }
            return UIBezierPath(rect: parent.accessibilityFrame)
        }
        set { }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(onToggle), for: .valueChanged)
    }

    required init?(coder: NSCoder) {
        fatalError("Not used!")
    }

    @objc
    private func onToggle() {
        let isOn = self.isOn ? "on" : "off"
        let output = "The Lights are now \(isOn)."
        print(output)
    }
}

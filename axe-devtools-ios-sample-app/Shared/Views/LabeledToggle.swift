//
//  LabeledToggle.swift
//  axe-devtools-ios-sample-app
//
//  Created by Nitya Baddam on 2/5/26.
//

import UIKit

final class LabeledToggle: UIView {
    let title: String

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = .gilroy()
        return label
    }()

    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.isOn = true
        return toggle
    }()

    init(title: String) {
        self.title = title

        super.init(frame: .zero)

        configureAccessibilitySettings()
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureAccessibilitySettings() {
        isAccessibilityElement = true
        accessibilityTraits.insert(toggle.accessibilityTraits)
        accessibilityAttributedValue = toggle.accessibilityAttributedValue
    }

    private func buildView() {
        addSubview(label)
        addSubview(toggle)

        let verticalPadding: CGFloat = 4
        NSLayoutConstraint.activate([
            // Label
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            // TextField
            toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 0),
            toggle.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0),
            toggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}

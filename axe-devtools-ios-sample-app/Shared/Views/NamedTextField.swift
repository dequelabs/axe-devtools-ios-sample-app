//
//  NamedTextField.swift
//  axe-devtools-ios-sample-app
//

import UIKit

final class NamedTextField: UIView {
    let title: String

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = UIFont(name: "Gilroy-Light", size: 14)
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
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
        accessibilityTraits.insert(textField.accessibilityTraits)
        accessibilityAttributedValue = textField.accessibilityAttributedValue
    }

    private func buildView() {
        addSubview(label)
        addSubview(textField)

        NSLayoutConstraint.activate([
            // Label
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            // TextField
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

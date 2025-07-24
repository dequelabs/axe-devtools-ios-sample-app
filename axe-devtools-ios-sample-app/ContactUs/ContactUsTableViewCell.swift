//
//  ContactUsTableViewCell.swift
//  axe-devtools-ios-sample-app
//

import UIKit

final class ContactUsTableViewCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Us"
        label.font = UIFont.italiana()
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()

    private lazy var emailTextField: NamedTextField = {
        let textField = NamedTextField(title: "Enter your email:")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityLabel = "Email Address"
        return textField
    }()

    private lazy var questionTextField: NamedTextField = {
        let textField = NamedTextField(title: "What is your question?")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityLabel = "Enter a question"
        return textField
    }()

    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        button.accessibilityLabel = "Submit"
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.gilroy()
        return button
    }()

    convenience init() {
        self.init(style: .default, reuseIdentifier: nil)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor(named: "LightGray")

        contentView.addSubview(titleLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(questionTextField)
        contentView.addSubview(submitButton)

        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: padding
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -padding
            ),

            // Email TextField
            emailTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            emailTextField.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: padding
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -padding
            ),

            // Question TextField
            questionTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            questionTextField.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: padding
            ),
            questionTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -padding
            ),

            // Submit Button
            submitButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: padding
            ),
            submitButton.topAnchor.constraint(
                equalTo: questionTextField.bottomAnchor,
                constant: padding
            ),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

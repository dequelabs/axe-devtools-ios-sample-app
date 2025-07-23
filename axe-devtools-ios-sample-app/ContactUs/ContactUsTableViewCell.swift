//
//  ContactUsTableViewCell.swift
//  axe-devtools-ios-sample-app
//

import UIKit

final class ContactUsTableViewCell: UITableViewCell {

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
        button.titleLabel?.font = UIFont(name: "Gilroy-Light", size: 14)
        return button
    }()

    convenience init() {
        self.init(style: .default, reuseIdentifier: nil)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor(named: "LightGray")

        contentView.addSubview(emailTextField)
        contentView.addSubview(questionTextField)
        contentView.addSubview(submitButton)

        NSLayoutConstraint.activate([
            // Email TextField
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // Question TextField
            questionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            questionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // Submit Button
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            submitButton.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 20),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

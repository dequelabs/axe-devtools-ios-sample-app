//
//  ContactUsViewController.swift
//  axe-devtools-ios-sample-app
//

import UIKit

class NamedTextField: UIView {
    let title: String

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.isAccessibilityElement = true
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
        self.isAccessibilityElement = true
        self.accessibilityTraits.insert(textField.accessibilityTraits)
        self.accessibilityAttributedValue = textField.accessibilityAttributedValue
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView() {
        addSubview(label)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

final class ContactUsTableViewCell: UITableViewCell {

    private lazy var emailTextField: NamedTextField = {
        let textField = NamedTextField(title: "Enter your email address:")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityLabel = "Email"
        return textField
    }()

    private lazy var questionTextField: NamedTextField = {
        let textField = NamedTextField(title: "What is your question?")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityLabel = "Question"
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor(named: "LightGray")

        contentView.addSubview(emailTextField)
        contentView.addSubview(questionTextField)
        contentView.addSubview(submitButton)

        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            questionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            questionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

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

class ContactUsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = UIColor(named: "LightGray")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "Contact Us"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ContactUsTableViewCell(style: .default, reuseIdentifier: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

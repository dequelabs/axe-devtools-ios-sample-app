//
//  HeaderView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeImageView: UIView {

    let viewModel = HeaderViewModel()

    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: viewModel.imageName)
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        let gilroyBold = UIFont(name: "Gilroy-ExtraBold", size: 18)
        label.font = gilroyBold
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.subtitle
        label.textColor = .white
        let gilroyLight = UIFont(name: "Gilroy-Light", size: 12)
        label.font = gilroyLight
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var checkButton: UIButton = {
        let b = UIButton(type: .custom)
        let gilroyBold = UIFont(name: "Gilroy-ExtraBold", size: 14)
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: viewModel.buttonImage)
        configuration.imagePlacement = .trailing
        configuration.attributedTitle = AttributedString(viewModel.buttonText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Gilroy-ExtraBold", size: 14)!]))
        b.configuration = configuration
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(imageView)
        self.imageView.addSubview(stackView)
        self.stackView.addArrangedSubview(titleLabel)
        self.stackView.addArrangedSubview(subtitleLabel)
        self.stackView.addArrangedSubview(checkButton)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        // Button is not automatically 44px high, so we'll add this constraint to fix the TouchTarget Failure
        // checkButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -24),
            stackView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
}

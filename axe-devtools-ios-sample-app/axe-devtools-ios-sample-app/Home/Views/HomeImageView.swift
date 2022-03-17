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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.subtitle
        label.textColor = .white
        label.font.withSize(12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var checkButton: UIButton = {
        let b = UIButton()
        b.titleLabel?.text = viewModel.buttonText
        b.titleLabel?.textColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        // don't forget to do the arrow icon next to 'check' text
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

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
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

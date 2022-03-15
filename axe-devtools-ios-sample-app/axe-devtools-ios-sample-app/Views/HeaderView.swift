//
//  HeaderView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HeaderView: UIView {
    let viewModel = HeaderViewModel()

    var stackView: UIStackView {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }

    var image: UIImageView {
        let image = UIImage(named: viewModel.imageName)
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }

    var titleLabel: UILabel {
        let label = UILabel()
        label.text = viewModel.title
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        return label
    }

    var subtitleLabel: UILabel {
        let label = UILabel()
        label.text = viewModel.subtitle
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        return label
    }

    var checkButton: UIButton {
        let b = UIButton()
        b.titleLabel?.text = viewModel.buttonText
        b.titleLabel?.textColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .red
        // don't forget to do the arrow icon next to 'check' text
        return b
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24),
           //  image.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        buildStackView()

    }

    private func buildStackView() {
        image.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -24)
        ])

        self.stackView.addArrangedSubview(titleLabel)
        self.stackView.addArrangedSubview(subtitleLabel)
        self.stackView.addArrangedSubview(checkButton)
    }
}

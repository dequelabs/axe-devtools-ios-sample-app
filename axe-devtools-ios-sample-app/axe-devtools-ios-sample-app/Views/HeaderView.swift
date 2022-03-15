//
//  HeaderView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HeaderView: UIView {
    let viewModel = HeaderViewModel()

    var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.subtitle
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        return label
    }()

    lazy var checkButton: UIButton = {
        let b = UIButton()
        b.titleLabel?.text = viewModel.buttonText
        b.titleLabel?.textColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .red
        // don't forget to do the arrow icon next to 'check' text
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
       // buildStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        let headerImage = UIImage(named: viewModel.imageName)
        imageView.image = headerImage
        backgroundColor = .green
        self.addSubview(imageView)
       // imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
       // imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
       // imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24).isActive = true
        //imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        buildStackView()
    }

    func buildStackView() {
        self.imageView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50).isActive = true
            stackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 50).isActive = true
            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -24).isActive = true

        self.stackView.addSubview(titleLabel)
        self.stackView.addSubview(subtitleLabel)
        self.stackView.addSubview(checkButton)

    }
}

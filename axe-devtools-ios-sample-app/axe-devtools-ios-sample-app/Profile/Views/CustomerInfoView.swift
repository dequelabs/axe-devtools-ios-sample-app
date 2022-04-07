//
//  CustomerInfoView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation
import UIKit

class CustomerInfoView: UIView {
    let viewModel = ProfileViewModel()

    lazy var customerImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var customerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Gilroy-Light", size: 14)
        return l
    }()

    lazy var customerNameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 14)
        return l
    }()

    lazy var editIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(customerImageView)
        self.addSubview(customerLabel)
        self.addSubview(customerNameLabel)
        self.addSubview(editIconImageView)

        customerLabel.text = viewModel.customerText
        customerNameLabel.text = viewModel.customerName
        customerImageView.image = UIImage(named: viewModel.customerPhotoName)
        editIconImageView.image = UIImage(named: viewModel.editIconName)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            customerImageView.widthAnchor.constraint(equalToConstant: 82),
            customerImageView.heightAnchor.constraint(equalToConstant: 82),
            customerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            customerImageView.topAnchor.constraint(equalTo: self.topAnchor)
        ])

        NSLayoutConstraint.activate([
            customerLabel.topAnchor.constraint(equalTo: customerImageView.topAnchor, constant: 22),
            customerLabel.leadingAnchor.constraint(equalTo: customerImageView.trailingAnchor, constant: 24),
        ])

        NSLayoutConstraint.activate([
            customerNameLabel.topAnchor.constraint(equalTo: customerLabel.bottomAnchor, constant: 2),
            customerNameLabel.leadingAnchor.constraint(equalTo: customerImageView.trailingAnchor, constant: 24),
            customerNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            editIconImageView.widthAnchor.constraint(equalToConstant: 19),
            editIconImageView.heightAnchor.constraint(equalToConstant: 19),
            editIconImageView.centerYAnchor.constraint(equalTo: customerImageView.centerYAnchor),
            editIconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
    }

}

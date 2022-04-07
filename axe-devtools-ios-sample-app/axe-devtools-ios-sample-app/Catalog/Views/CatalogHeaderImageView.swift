//
//  CatalogHeaderImageView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation
import UIKit

class CatalogHeaderImageView: UIImageView {
    let viewModel = CatalogViewModel()

    lazy var textLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        let gilroy = UIFont(name: "Gilroy-ExtraBold", size: 32)
        l.font = gilroy
        l.text = viewModel.mainImageText
        return l
    }()

    lazy var dotIcons: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: viewModel.dotsImageName)
        iv.image = image
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override init(image: UIImage?) {
        super.init(image: image)
        self.image = image
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(textLabel)
        self.addSubview(dotIcons)
        self.contentMode = .scaleAspectFill
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 327),
            self.heightAnchor.constraint(equalToConstant: 327)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            dotIcons.heightAnchor.constraint(equalToConstant: 12),
            dotIcons.widthAnchor.constraint(equalToConstant: 78),
            dotIcons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 125),
            dotIcons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -125),
            dotIcons.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

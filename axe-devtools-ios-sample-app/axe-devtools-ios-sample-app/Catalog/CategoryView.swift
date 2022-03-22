//
//  CategoryView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CategoryView: UIView {
    // rectangular view with text in middle
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        return l
    }()

    var name: String

    init(name: String) {
        self.name = name
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(nameLabel)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

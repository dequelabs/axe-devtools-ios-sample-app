//
//  MostPopularItemsHeaderCollectionReusableView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/28/22.
//

import UIKit

class MostPopularItemsHeaderView: UICollectionReusableView {
    lazy var headerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Most popular"
        l.font = .systemFont(ofSize: 32)
        l.textColor = .black
        return l
    }()

    lazy var itemsButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "Arrow - Right")
        configuration.imagePlacement = .trailing
        let l = UIButton(configuration: configuration)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.titleLabel?.textColor = .lightGray
        l.tintColor = .white
        l.setTitle("56 Items ", for: .normal)
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        addSubview(headerLabel)
        addSubview(itemsButton)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            itemsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemsButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            itemsButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}

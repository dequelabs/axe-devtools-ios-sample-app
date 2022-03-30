//
//  RecommendedItemsHeaderView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/29/22.
//

import UIKit

class RecommendedItemsHeaderView: UICollectionReusableView {
    lazy var headerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Recommended"
        let italiana = UIFont(name: "Italiana-Regular", size: 32)
        l.font = italiana
        l.textColor = .black
        return l
    }()

    lazy var itemsButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "ArrowGray")
        configuration.imagePlacement = .trailing
        let l = UIButton(configuration: configuration)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.titleLabel?.textColor = .lightGray
        l.titleLabel?.tintColor = .lightGray
        let gilroyBold = UIFont(name: "Gilroy-ExtraBold", size: 14)
        l.titleLabel?.font = gilroyBold
        l.setTitle("13 Items ", for: .normal)
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

        self.backgroundColor = UIColor(named: "LightGray")
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            itemsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemsButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            itemsButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}

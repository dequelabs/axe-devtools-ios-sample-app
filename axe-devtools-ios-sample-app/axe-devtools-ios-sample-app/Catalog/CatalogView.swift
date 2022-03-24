//
//  CatalogView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CatalogView: UIView {

    let viewModel = CatalogViewModel()

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = viewModel.title
        l.font = .systemFont(ofSize: 32)
        return l
    }()

    lazy var searchImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Search")
        iv.image = image
        return iv
    }()

    lazy var allCategories: AllCategoriesView = {
        let acv = AllCategoriesView()
        acv.translatesAutoresizingMaskIntoConstraints = false
        return acv
    }()

    lazy var newCollectionImageView: UIImageView = {
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
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(titleLabel)
        self.addSubview(searchImageView)
        self.addSubview(allCategories)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            searchImageView.heightAnchor.constraint(equalToConstant: 18),
            searchImageView.widthAnchor.constraint(equalToConstant: 18),
            searchImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            searchImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])

        NSLayoutConstraint.activate([
            allCategories.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            allCategories.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            allCategories.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            allCategories.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

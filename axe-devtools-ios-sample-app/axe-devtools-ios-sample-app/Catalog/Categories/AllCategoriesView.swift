//
//  AllCategoriesView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class AllCategoriesView: UIView {
    let viewModel = CatalogViewModel()

    lazy var categoriesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func buildView() {
        addSubview(categoriesStackView)

        viewModel.categories.forEach { category in
            let categoryView = CategoryView(name: category)
            categoriesStackView.addArrangedSubview(categoryView)
        }

        let all = categoriesStackView.subviews[0] as! CategoryView
        all.backgroundColor = .black
        all.nameLabel.textColor = .white
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            categoriesStackView.topAnchor.constraint(equalTo: self.topAnchor),
            categoriesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            categoriesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24),
            categoriesStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

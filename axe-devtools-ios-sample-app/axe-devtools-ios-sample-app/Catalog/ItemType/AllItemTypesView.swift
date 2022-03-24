//
//  AllItemTypesView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class AllItemTypesView: UIView {

    let viewModel = AllItemTypesViewModel()

    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 26
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
        self.addSubview(stackView)

        viewModel.itemTypes.forEach { type in
            let vm = ItemTypeViewModel(itemType: type)
            stackView.addArrangedSubview(ItemTypeView(viewModel: vm))
        }
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

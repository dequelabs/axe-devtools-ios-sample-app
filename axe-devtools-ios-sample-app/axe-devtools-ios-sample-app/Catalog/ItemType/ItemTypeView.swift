//
//  ItemTypeView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class ItemTypeView: UIView {
    var viewModel: ItemTypeViewModel

    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var subtitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var itemImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    init(viewModel: ItemTypeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(nameLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(itemImage)
    }
}

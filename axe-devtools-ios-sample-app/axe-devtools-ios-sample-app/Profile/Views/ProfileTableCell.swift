//
//  ProfileTableCell.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/25/22.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    var viewModel: TableRowViewModel? {
        didSet {
            buildCell()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildCell() {
        guard let viewModel = viewModel else {
            return
        }

        var content = self.defaultContentConfiguration()
        content.text = viewModel.text
        content.image = UIImage(named: viewModel.imageName)
        self.contentConfiguration = content
    }
}

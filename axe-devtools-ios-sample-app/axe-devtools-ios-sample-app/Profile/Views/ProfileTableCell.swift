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

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildCell()
     //   imageView.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildCell() {
        
    }
}

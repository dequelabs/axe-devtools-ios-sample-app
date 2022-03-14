//
//  HeaderView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HeaderView: UIView {
    let viewModel = HeaderViewModel()

    var image: UIImageView {
        let image = UIImage(named: viewModel.imageName)
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }

    var titleLabel: UILabel {
        let label = UILabel()
        label.text = viewModel.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    var subtitleLabel: UILabel {
        let label = UILabel()
        label.text = viewModel.subtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

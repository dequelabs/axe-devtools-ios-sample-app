//
//  AllItemTypesView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class AllItemTypesView: UIView {
    // with an item type view for each type in the viewmodel

    let viewModel = AllItemTypesViewModel()

    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 26
        return sv
    }()
}

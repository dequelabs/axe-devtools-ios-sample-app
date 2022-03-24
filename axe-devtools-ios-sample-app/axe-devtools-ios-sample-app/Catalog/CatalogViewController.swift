//
//  CatalogViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import UIKit

class CatalogViewController: UIViewController {
    lazy var allCategoriesView: AllCategoriesView = {
        let hv = AllCategoriesView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

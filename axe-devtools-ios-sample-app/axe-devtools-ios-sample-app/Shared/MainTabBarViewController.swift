//
//  MainTabBarViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    lazy var baseScrollView: BaseScrollView = {
        let sv = BaseScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var homeVM = HomeViewModel()
    var catalogVM = CatalogViewModel()
    var cartVM = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
     //   buildView()
        setupViewControllers()
    }

    func buildView() {
        self.view.addSubview(baseScrollView)
        NSLayoutConstraint.activate([
            self.baseScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.baseScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.baseScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.baseScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(for: HomeViewController(),
                                title: homeVM.tabTitle,
                                image: UIImage(named: homeVM.imageName)!)
            ,
            createNavController(for: CatalogViewController(),
                                title: catalogVM.sectionTitle,
                                image: UIImage(named: catalogVM.iconName)!),
            createNavController(for: CartViewViewController(),
                                title: cartVM.sectionTitle,
                                image: UIImage(named: cartVM.iconName)!)
        ]
    }


}


extension MainTabBarViewController {
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}

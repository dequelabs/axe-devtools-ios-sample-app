//
//  MainTabBarViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    var homeVM = HomeViewModel()
    var catalogVM = CatalogViewModel()
    var cartVM = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
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

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
    var profileVM = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "LightGray")
        tabBar.tintColor = .label
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(for: HomeViewController(),
                                title: "",
                                image: UIImage(named: homeVM.imageName)!)
            ,
            createNavController(for: CatalogViewController(),
                                title: "",
                                image: UIImage(named: catalogVM.iconName)!),
            createNavController(for: CartViewViewController(),
                                title: "",
                                image: UIImage(named: cartVM.iconName)!),
            createNavController(for: ProfileViewController(),
                                title: "",
                                image: UIImage(named: profileVM.iconName)!)
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

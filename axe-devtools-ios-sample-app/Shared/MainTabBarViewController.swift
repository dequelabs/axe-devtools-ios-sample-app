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
        view.backgroundColor = .white//UIColor(named: "LightGray")
        tabBar.tintColor = .black
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(
                for: HomeViewController(),
                title: "Home",
                image: UIImage(named: homeVM.imageName)!,
                selectedImage: UIImage(named: homeVM.selectedImage)!
            ),
            createNavController(
                for: CatalogViewController(),
                title: "Catalog",
                image: UIImage(named: catalogVM.iconName)!,
                selectedImage: UIImage(named: catalogVM.selectedImage)!
            ),
            createNavController(
                for: CartViewViewController(),
                title: "Cart",
                image: UIImage(named: cartVM.iconName)!,
                selectedImage: UIImage(named: cartVM.selectedImage)!
            ),
            createNavController(
                for: ProfileViewController(),
                title: "Profile",
                image: UIImage(named: profileVM.iconName)!,
                selectedImage: UIImage(named: profileVM.iconName)!,
                prefersLargeTitles: false
            )
        ]
    }
}

extension MainTabBarViewController {
    func createNavController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage,
        selectedImage: UIImage,
        prefersLargeTitles: Bool = true
    ) -> UIViewController {

        let navController = UINavigationController(
            rootViewController: rootViewController
        )
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.prefersLargeTitles = prefersLargeTitles
        rootViewController.navigationItem.title = title

        return navController
    }
}

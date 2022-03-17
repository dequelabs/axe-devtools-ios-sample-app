//
//  MainTabBarViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var homeVM = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        buildView()
        setupViewControllers()
    }

    func buildView() {
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),

        ])
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(for: HomeViewController(),
                                   title: homeVM.tabTitle,
                                   image: UIImage(named: homeVM.imageName)!)]
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

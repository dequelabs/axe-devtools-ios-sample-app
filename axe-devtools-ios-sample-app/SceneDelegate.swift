//
//  SceneDelegate.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Attest
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
          window = UIWindow(frame: UIScreen.main.bounds)
          let home = MainTabBarViewController()
          self.window?.rootViewController = home
          window?.windowScene = windowScene
          window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) {
        let credentials = LoginInfo()
        // Login to Deque Framework
        Attest.setServer(withUsername: credentials.dequeUsername, andPassword: credentials.dequePassword)

        // Start testing - use AutomatedFABDelegate and AutomatedTestDelegate for UITesting.
        Attest.startTesting(with: AutomatedFABDelegate(), attestDelegate: AutomatedTestDelegate(), and: FABWindowStrategy.attach(_:))
    }

    func sceneWillResignActive(_ scene: UIScene) {
        Attest.stopTesting()
    }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

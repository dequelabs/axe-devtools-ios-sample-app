//
//  SceneDelegate.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//
import axeDevToolsUIKit
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var axe: AxeDevTools?

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

        // Login to Deque Framework
        axe = try? AxeDevTools.login(withAPIKey: Login.APIKey)

        //Manual Testing
       // axe?.showA11yFAB()

        //Automated Testing
        //axe?.showA11yFAB(customFAB: AutomatedTestFAB())
    }

    func sceneWillResignActive(_ scene: UIScene) {
        //axe?.hideA11yFAB()
    }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

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

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        let credentials = LoginInfo()
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        Attest.setServer(withUsername: credentials.dequeUsername, andPassword: credentials.dequePassword)
        Attest.startTesting(with: AutomatedFABDelegate(), attestDelegate: AutomatedTestDelegate(), and: FABWindowStrategy.attach(_:))
//        guard let token = AccessToken(username: "kate.owens@deque.com",
//                                      password: "Kate.owens!",
//                                      realm: "axe-qa",
//                                      clientId: "mobile",
//                                      authServerURL: "https://auth-qa.dequelabs.com/auth/") else { return }
//        guard let client = AttestClient(accessToken: token,
//                                        serverURL: "https://mobile-qa2.dequelabs.com") else { return }
//        Attest.setServer(usingAttestClient: client)
//        Attest.startTesting(with: AutomatedFABDelegate(),
//                            attestDelegate: AutomatedTestDelegate())
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


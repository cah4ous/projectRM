//
//  SceneDelegate.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// FirstVC
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let navigationViewController = UINavigationController(rootViewController: TextRedactorViewController())
                
                let tabBarController = UITabBarController()
                tabBarController.setViewControllers([navigationViewController], animated: true)
                                                    
                window.rootViewController = tabBarController
                self.window = window
                window.makeKeyAndVisible()
              }
    }
}

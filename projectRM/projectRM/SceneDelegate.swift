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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        self.loadBaseController()
    }
    
    func loadBaseController() {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       guard let window = self.window else { return }
       window.makeKeyAndVisible()
       if UserDefaults.standard.bool(forKey: "isLoggedIn") == false {
           let loginViewController = storyboard.instantiateViewController(withIdentifier: "regVC")
           self.window?.rootViewController = loginViewController
       } else {
           let personViewController = storyboard.instantiateViewController(withIdentifier: "personalVC")
           let navigationPersonViewController = UINavigationController(rootViewController: personViewController)
           self.window?.rootViewController = navigationPersonViewController
       }
        self.window?.makeKeyAndVisible()
    }
    
}

//
//  SceneDelegate.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// FirstVC
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let signInViewController = storyboard.instantiateViewController(withIdentifier: "signInVC")
//        window?.rootViewController = signInViewController
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.makeKeyAndVisible()

//        self.loadBaseController()
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

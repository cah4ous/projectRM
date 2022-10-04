//
//  AlreadyExistPersonViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 04.10.2022.
//

import UIKit
/// Экран, который хз че делает
final class AlreadyExistPersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                print("Saved user: \(savedUser)")
            }
        }
    }
}

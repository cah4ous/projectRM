//
//  SignInViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// Экран авторизации
final class SignInViewController: UIViewController {
    
    // MARK: - Private IBOutlet
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Private IBAction
    @IBAction private func signInButtonAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                if savedUser.name == nameTextField.text {
                    if savedUser.password == passwordTextField.text {
                        performSegue(withIdentifier: "goToApp", sender: nil)
                    }
                } else {
                    performSegue(withIdentifier: "goToRegistration", sender: nil)
                }
            }
        }
    }
}

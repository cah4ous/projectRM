//
//  RegistrationViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 04.10.2022.
//

import UIKit
/// Экран, который отвечает за регистрацию
final class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Private IBOutlet
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()

    }
    
    // MARK: - Private IBAction
    @IBAction func registerButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        
        let user = User(
            name: nameTextField.text ?? "nil", email: emailTextField.text ?? "nil",
            password: passwordTextField.text ?? "nil"
        )
        
        let defaults = UserDefaults.standard

        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "user")
        }
    }
    
    // MARK: - Private Methods
    private func initMethods() {
        notificationsSettings()
        setDelegate()
    }
    
    private func setDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func notificationsSettings() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil
        ) { _ in
            self.view.frame.origin.y = -200
                }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil
        ) { _  in
            self.view.frame.origin.y = 0
        }
    }
}

/// UITextFieldDelegate
extension RegistrationViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            emailTextField.becomeFirstResponder()
        case 1:
            passwordTextField.becomeFirstResponder()
        case 2:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}

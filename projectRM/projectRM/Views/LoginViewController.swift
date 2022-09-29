//
//  LoginViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 26.09.2022.
//

import UIKit
/// Экран, который отвечает за вход и регистрацию пользователя
class LoginViewController: UIViewController {

    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let eyeButton = UIButton()
    let singLabel = UILabel()
    var passEye = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initMethods()
    }

    func initMethods() {
        createButtonLogin()
        createLoginTextField()
        createPassTextField()
        createEyeButton()
        createSignInLabel()
    }

    func createLoginTextField() {
        loginTextField.placeholder = "Логин..."
        loginTextField.borderStyle = .roundedRect
        loginTextField.layer.cornerRadius = 5
        loginTextField.frame = CGRect(x: 50, y: 320, width: 300, height: 50)
        view.addSubview(loginTextField)

    }

    func createSignInLabel() {
        singLabel.text = "Sign In"
        singLabel.font = .boldSystemFont(ofSize: 30)

        singLabel.frame = CGRect(x: 150, y: 250, width: 150, height: 50)

        view.addSubview(singLabel)

    }

    func createEyeButton() {
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.tintColor = .lightGray
        
        eyeButton.frame = CGRect(x: 300, y: 390, width: 50, height: 50)

        view.addSubview(eyeButton)

        eyeButton.addTarget(self, action: #selector(togglePasswordAction), for: .touchUpInside)
    }

    func createPassTextField() {
        passwordTextField.placeholder = "Пароль..."
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.frame = CGRect(x: 50, y: 390, width: 300, height: 50)

        view.addSubview(passwordTextField)
    }

    func createButtonLogin() {
        let buttonLogin = UIButton()

        buttonLogin.layer.cornerRadius = 5
        buttonLogin.backgroundColor = .blue
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.addTarget(self, action: #selector(goToBirthdayViewControllerAction), for: .touchUpInside)
        
        buttonLogin.frame = CGRect(x: 50, y: 480, width: 300, height: 75)

        view.addSubview(buttonLogin)

    }
    
    @objc func togglePasswordAction() {
        let togglePassword = passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = togglePassword ? false : true
        if togglePassword {
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }

    @objc func goToBirthdayViewControllerAction() {
         if (loginTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
             let birthdayViewController = ProductViewController()
             navigationController?.pushViewController(birthdayViewController, animated: true)
         }
    }
}

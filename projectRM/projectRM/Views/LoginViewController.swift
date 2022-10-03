//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
 /// Экран, который отвечает за вход и регистрацию пользователя
 final class LoginViewController: UIViewController {
     
     private var registration = Registration()
     
     // MARK: - Private Visual Components
     private lazy var phoneTextField: UITextField = {
         var textField = UITextField()
         textField.placeholder = "Телефон..."
         textField.keyboardType = .phonePad
         textField.borderStyle = .roundedRect
         textField.layer.cornerRadius = 5
         textField.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
         
         return textField
     }()
     
     private lazy var passwordTextField: UITextField = {
         var textField = UITextField()
         textField.placeholder = "Пароль..."
         textField.borderStyle = .roundedRect
         textField.layer.cornerRadius = 5
         textField.frame = CGRect(x: 50, y: 390, width: 300, height: 50)
         
         return textField
     }()
     
     private lazy var cloudImageView: UIImageView = {
         var imageView = UIImageView()
         imageView.image = UIImage(named: "pizzaMain.jpeg")
         imageView.frame = CGRect(x: 150, y: 100, width: 110, height: 110)
         
         return imageView
     }()
     
     private lazy var phoneNumberLabel: UILabel = {
         var label = UILabel()
         label.frame = CGRect(x: 60, y: 260, width: 100, height: 50)
         label.text = "Phone"
         label.font = .systemFont(ofSize: 10)
         label.textColor = .orange
         
         return label
     }()
     
     private lazy var passwordLabel: UILabel = {
         var label = UILabel()
         label.frame = CGRect(x: 60, y: 350, width: 100, height: 50)
         label.text = "Password"
         label.font = .systemFont(ofSize: 10)
         label.textColor = .orange
         
         return label
     }()
     
     private lazy var eyeButton: UIButton = {
         var button = UIButton()
         button.setImage(UIImage(systemName: "eye"), for: .normal)
         button.tintColor = .lightGray
         button.frame = CGRect(x: 300, y: 390, width: 50, height: 50)
         button.addTarget(self, action: #selector(togglePasswordAction), for: .touchUpInside)
         
         return button
     }()
     
     private lazy var singLabel: UILabel = {
         var label = UILabel()
         label.text = "Bringo"
         label.font = .boldSystemFont(ofSize: 30)
         label.frame = CGRect(x: 155, y: 220, width: 150, height: 50)
         
         return label
     }()
     private lazy var fastSingInButton: UIButton = {
         var button = UIButton(type: .system)
         button.tintColor = .white
         button.layer.cornerRadius = 10
         button.backgroundColor = .gray
         button.setTitle("Быстрый вход", for: .normal)
         button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
         button.frame = CGRect(x: 120, y: 760, width: 150, height: 40)
     }()
     
     private lazy var fastSignInButton: UIButton = {
         let button = UIButton(type: .system)
         
         button.tintColor = .white
         button.layer.cornerRadius = 10
         button.backgroundColor = .gray
         button.setTitle("Быстрый вход", for: .normal)
         button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
         button.frame = CGRect(x: 120, y: 760, width: 150, height: 40)
         
         return button
     }()
     
     private lazy var registrationButton: UIButton = {
         let button = UIButton(type: .system)
         
         button.tintColor = .white
         button.layer.cornerRadius = 10
         button.backgroundColor = .orange
         button.setTitle("Зарегистрироваться", for: .normal)
         button.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
         button.frame = CGRect(x: 50, y: 580, width: 300, height: 65)
         
         return button
     }()
     
     private lazy var loginButton: UIButton = {
         let button = UIButton(type: .system)
         button.tintColor = .white
         button.layer.cornerRadius = 10
         button.backgroundColor = .orange
         button.setTitle("Войти", for: .normal)
         button.addTarget(self, action: #selector(goToFoodViewControllerAction), for: .touchUpInside)
         button.frame = CGRect(x: 50, y: 480, width: 300, height: 65)
         
         return button
     }()
     
     // MARK: - Lifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         initMethods()
     }
     
     // MARK: - Private IBAction
     @objc private func signInButtonAction() {
         let foodViewController = FoodViewController()
         navigationController?.pushViewController(foodViewController, animated: true)
     }
     
     @objc private func registrationAction() {
         if (phoneTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
             registration.addToMap(name: phoneTextField.text ?? "nil", pass: passwordTextField.text ?? "nil")
         }
     }
     
     @objc private func togglePasswordAction() {
         let togglePassword = passwordTextField.isSecureTextEntry
         passwordTextField.isSecureTextEntry = togglePassword ? false : true
         if togglePassword {
             eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
         } else {
             eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
         }
     }

     @objc private func goToFoodViewControllerAction() {
          if (phoneTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
              let loginAndPassInfo = registration.getFromMap()
              let login = phoneTextField.text ?? "nil"
              let pass = passwordTextField.text ?? "nil"
              guard loginAndPassInfo.keys.contains(login) else { return }
              if loginAndPassInfo[login] == pass {
                  let foodViewController = FoodViewController()
                  navigationController?.pushViewController(foodViewController, animated: true)
              }
    
          }
     }
     
     // MARK: - Private Methods
     private func initMethods() {
         configureViews()
     }
     
     private func configureViews() {
         view.addSubview(phoneNumberLabel)
         view.addSubview(passwordLabel)
         view.addSubview(cloudImageView)
         view.addSubview(phoneTextField)
         view.addSubview(singLabel)
         view.addSubview(eyeButton)
         view.addSubview(passwordTextField)
         view.addSubview(loginButton)
         view.addSubview(registrationButton)
         view.addSubview(fastSignInButton)
     }
 }

//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
 /// Экран, который отвечает за вход и регистрацию пользователя
 class LoginViewController: UIViewController {

     let phoneTextField = UITextField()
     let passwordTextField = UITextField()
     let cloudImageView = UIImageView()
     let phoneNumberLabel = UILabel()
     let passwordLabel = UILabel()
     let eyeButton = UIButton()
     let singLabel = UILabel()
     let fastSingInButton = UIButton()
     var passEye = UIImageView()

     var registration = Registration()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .white
         initMethods()
     }

     func initMethods() {
         createLoginButton()
         createPhoneTextField()
         createPassTextField()
         createEyeButton()
         createSignInLabel()
         createCloudImage()
         createNumberLabel()
         createPasswordLabel()
         createRegistrationButton()
         createFastSignInButton()
     }
     
     func createNumberLabel() {
         phoneNumberLabel.frame = CGRect(x: 60, y: 260, width: 100, height: 50)
         phoneNumberLabel.text = "Phone"
         phoneNumberLabel.font = .systemFont(ofSize: 10)
         phoneNumberLabel.textColor = .orange
         
         view.addSubview(phoneNumberLabel)
     }
     
     func createPasswordLabel() {
         passwordLabel.frame = CGRect(x: 60, y: 350, width: 100, height: 50)
         passwordLabel.text = "Password"
         passwordLabel.font = .systemFont(ofSize: 10)
         passwordLabel.textColor = .orange
         
         view.addSubview(passwordLabel)
     }
     
     func createCloudImage() {
         cloudImageView.image = UIImage(named: "pizzaMain.jpeg")
         cloudImageView.frame = CGRect(x: 150, y: 100, width: 110, height: 110)
         
         view.addSubview(cloudImageView)
     }

     func createPhoneTextField() {
         phoneTextField.placeholder = "Телефон..."
         phoneTextField.keyboardType = .phonePad
         phoneTextField.borderStyle = .roundedRect
         phoneTextField.layer.cornerRadius = 5
         phoneTextField.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
         view.addSubview(phoneTextField)

     }

     func createSignInLabel() {
         singLabel.text = "Bringo"
         singLabel.font = .boldSystemFont(ofSize: 30)

         singLabel.frame = CGRect(x: 155, y: 220, width: 150, height: 50)

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
     
     func createLoginButton() {
         let loginButton = UIButton(type: .system)
         
         loginButton.tintColor = .white
         loginButton.layer.cornerRadius = 10
         loginButton.backgroundColor = .orange
         loginButton.setTitle("Войти", for: .normal)
         loginButton.addTarget(self, action: #selector(goToFoodViewControllerAction), for: .touchUpInside)

         loginButton.frame = CGRect(x: 50, y: 480, width: 300, height: 65)

         view.addSubview(loginButton)
     }

     func createRegistrationButton() {
         let registationButton = UIButton(type: .system)
         
         registationButton.tintColor = .white
         registationButton.layer.cornerRadius = 10
         registationButton.backgroundColor = .orange
         registationButton.setTitle("Зарегистрироваться", for: .normal)
         registationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)

         registationButton.frame = CGRect(x: 50, y: 580, width: 300, height: 65)

         view.addSubview(registationButton)
     }
     
     func createFastSignInButton() {
         let fastSignInButton = UIButton(type: .system)
         
         fastSignInButton.tintColor = .white
         fastSignInButton.layer.cornerRadius = 10
         fastSignInButton.backgroundColor = .gray
         fastSignInButton.setTitle("Быстрый вход", for: .normal)
         fastSignInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)

         fastSignInButton.frame = CGRect(x: 120, y: 760, width: 150, height: 40)

         view.addSubview(fastSignInButton)
     }
     
     @objc func signInButtonAction() {
         let foodViewController = FoodViewController()
         navigationController?.pushViewController(foodViewController, animated: true)
     }
     
     @objc func registrationAction() {
         if (phoneTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
             registration.addToMap(name: phoneTextField.text ?? "nil", pass: passwordTextField.text ?? "nil")
         }
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

     @objc func goToFoodViewControllerAction() {
          if (phoneTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
              let loginAndPassInfo = registration.getFromMap()
              let login = phoneTextField.text ?? "nil"
              let pass = passwordTextField.text ?? "nil"
              if loginAndPassInfo.keys.contains(login) {
                  if loginAndPassInfo[login] == pass {
                      let foodViewController = FoodViewController()
                      navigationController?.pushViewController(foodViewController, animated: true)
                  }
              }
          }
     }
 }

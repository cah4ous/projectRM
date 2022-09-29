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
     var passEye = UIImageView()

     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .white
         initMethods()
     }

     func initMethods() {
         createButtonLogin()
         createPhoneTextField()
         createPassTextField()
         createEyeButton()
         createSignInLabel()
         createCloudImage()
         createNumberLabel()
         createPasswordLabel()
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
         cloudImageView.image = UIImage(named: "pizza.jpeg")
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
         singLabel.text = "Pizza Swift"
         singLabel.font = .boldSystemFont(ofSize: 30)

         singLabel.frame = CGRect(x: 120, y: 220, width: 150, height: 50)

         view.addSubview(singLabel)

     }

     func createEyeButton() {
         eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
         eyeButton.tintColor = .lightGray

         eyeButton.frame = CGRect(x: 300, y: 390, width: 50, height: 50)

         view.addSubview(eyeButton)

         eyeButton.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
     }

     @objc func togglePassword() {
         let togglePassword = passwordTextField.isSecureTextEntry
         passwordTextField.isSecureTextEntry = togglePassword ? false : true
         if togglePassword {
             eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
         } else {
             eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
         }
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
         buttonLogin.backgroundColor = .orange
         buttonLogin.setTitle("Войти", for: .normal)
         buttonLogin.addTarget(self, action: #selector(goToFoodViewControllerAction), for: .touchUpInside)

         buttonLogin.frame = CGRect(x: 50, y: 480, width: 300, height: 75)

         view.addSubview(buttonLogin)

     }

     @objc func goToFoodViewControllerAction() {
          if (phoneTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
              let foodViewController = FoodViewController()
              navigationController?.pushViewController(foodViewController, animated: true)
          }
     }
 }

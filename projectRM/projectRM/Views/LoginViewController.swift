//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// LoginViewController
class LoginViewController: UIViewController {
    
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let eyeButton = UIButton()
    let singLabel = UILabel()
    let faceIdSwitch = UISwitch()
    let faceIdLabel = UILabel()
    let birthdayRimenderLabel = UILabel()
    
    var register = Register()
    var passEye = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createButtonLogin()
        createButtonReg()
        createLoginTextField()
        createPassTextField()
        createEyeButton()
        createSignInLabel()
        createFaceIdSwitch()
        createFaceIdLabel()
        createBirthdayRemidnerLabel()
        createUnderline(textField: loginTextField)
        createUnderline(textField: passwordTextField)
    }

    func createBirthdayRemidnerLabel() {
        birthdayRimenderLabel.text = "Birthday Reminder"
        birthdayRimenderLabel.font = .boldSystemFont(ofSize: 15)
        birthdayRimenderLabel.textAlignment = .center
        birthdayRimenderLabel.layer.borderWidth = 5
        
        birthdayRimenderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(birthdayRimenderLabel)
        
        birthdayRimenderLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        birthdayRimenderLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        birthdayRimenderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        birthdayRimenderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
    }

    func createFaceIdSwitch() {
        faceIdSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(faceIdSwitch)
        
        faceIdSwitch.widthAnchor.constraint(equalToConstant: 100).isActive = true
        faceIdSwitch.heightAnchor.constraint(equalToConstant: 50).isActive = true
        faceIdSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
        faceIdSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }

    func createLoginTextField() {
        loginTextField.placeholder = "Логин..."
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(loginTextField)
        
        loginTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
    }

    func createSignInLabel() {
        singLabel.text = "Sign In"
        singLabel.font = .boldSystemFont(ofSize: 30)
        
        singLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(singLabel)
        
        singLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 45).isActive = true
        singLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        singLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        singLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func createFaceIdLabel() {
        faceIdLabel.text = "Вход по FaceID"
 
        faceIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(faceIdLabel)
        
        faceIdLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        faceIdLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        faceIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        faceIdLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
    }

    func createEyeButton() {
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.tintColor = .lightGray
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.view.addSubview(eyeButton)
        
        eyeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eyeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        eyeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120).isActive = true
        eyeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75).isActive = true
        
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

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(passwordTextField)
        
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75).isActive = true
    }

    func createButtonLogin() {
        let buttonLogin = UIButton()
        
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.backgroundColor = .blue
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.addTarget(self, action: #selector(goToBirthdayViewController), for: .touchUpInside)
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(buttonLogin)
        
        buttonLogin.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        
    }

    func createUnderline(textField: UITextField) {
        let line = CALayer()
        line.frame = CGRect(x: 0, y: textField.frame.height + 50, width: 300, height: 2)
        line.backgroundColor = UIColor.lightGray.cgColor
        textField.layer.addSublayer(line)
    }

    func createButtonReg() {
        let buttonReg = UIButton(frame: CGRect(x: self.view.center.x, y: 750, width: 175, height: 50))
        
        buttonReg.layer.cornerRadius = 5
        buttonReg.backgroundColor = .blue
        buttonReg.setTitle("Зарегистрировать", for: .normal)
        buttonReg.addTarget(self, action: #selector(registerAction), for: .touchUpInside)

        buttonReg.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(buttonReg)
        
        buttonReg.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonReg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonReg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonReg.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        
    }

    @objc func registerAction() {
        
        if (loginTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
             register.addToMap(name: loginTextField.text ?? "nil", pass: passwordTextField.text ?? "nil")
         }
    }

    @objc func goToBirthdayViewController() {
        let loginMap = register.getFromMap()
         if (loginTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
             let login = loginTextField.text ?? "nil"
             let passw = passwordTextField.text ?? "nil"
             if loginMap.keys.contains(login) {
                 if loginMap[login] == passw {
                     let birthdayViewController = BirthdayViewController()
                     navigationController?.pushViewController(birthdayViewController, animated: true)
                 }
             }
         }
    }
}

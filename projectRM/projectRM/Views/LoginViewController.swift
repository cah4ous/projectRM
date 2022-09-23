//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// LoginViewController
class LoginViewController: UIViewController {

    @IBOutlet var loginLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    
    var isStatus = true
    var register = Register()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSecondAction(_ sender: Any) {
        let arrayReg = register.getFromMap()
        if (loginLabel.text?.isEmpty == false) && (passwordLabel.text?.isEmpty == false) {
            let login = loginLabel.text ?? "nil"
            let passw = passwordLabel.text ?? "nil"
            if arrayReg.keys.contains(login) {
                if arrayReg[login] == passw {
                    performSegue(withIdentifier: "secondVC", sender: nil)
                }
            }
        }
    }
    
    @IBAction func eyeAction(_ sender: Any) {
        if isStatus == true {
            isStatus = false
            passwordLabel.isSecureTextEntry = true
        } else {
            isStatus = true
            passwordLabel.isSecureTextEntry = false
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if (loginLabel.text?.isEmpty == false) && (passwordLabel.text?.isEmpty == false) {
            register.addToMap(name: loginLabel.text ?? "nil", pass: passwordLabel.text ?? "nil")
        }
    }
}

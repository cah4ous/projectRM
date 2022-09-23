//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// firstVC
class ViewController: UIViewController {

    @IBOutlet var loginLabel: UITextField!
    
    @IBOutlet var passwordLabel: UITextField!
    
    var statusButton = true
    
    var register = Register()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSecondVC(_ sender: Any) {
        let arrayReg = register.getFromArray()
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
        if statusButton == true {
            statusButton = false
            passwordLabel.isSecureTextEntry = true
        } else {
            statusButton = true
            passwordLabel.isSecureTextEntry = false
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if (loginLabel.text?.isEmpty == false) && (passwordLabel.text?.isEmpty == false) {
            register.addToArray(name: loginLabel.text ?? "nil", pass: passwordLabel.text ?? "nil")
        }
    }
}

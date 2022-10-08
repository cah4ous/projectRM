//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// Экран, который отвечает за повтор кода Евгения из ролика
final class RepeatVideoViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        
        myTextField.delegate = self
        
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
    
    func createTextField() {
        let textFieldFrame = CGRect(x: 100, y: 120, width: 200, height: 31)
        
        myTextField.frame = textFieldFrame
        myTextField.borderStyle = .roundedRect

        myTextField.placeholder = "I swift dev"
        view.addSubview(myTextField)
    }
    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }
}

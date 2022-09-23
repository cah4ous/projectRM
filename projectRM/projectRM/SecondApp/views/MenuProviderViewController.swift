//
//  SecondViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import UIKit
/// MenuProviderViewController
class MenuProviderViewController: UIViewController {

    @IBOutlet var secondLabelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alert(title: "Второе приложение", message: "Введите leohl", style: .alert)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Отправить", style: .default) { _ in
            guard let text = alertController.textFields?.first else { return }
            self.secondLabelName.text = text.text
            let needWord = GetWord(word: self.secondLabelName.text ?? "nil")
            self.secondLabelName.text = (needWord.changeWord(word: self.secondLabelName.text ?? "nil"))
            
        }
        
        alertController.addTextField { _ in
        }
    
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

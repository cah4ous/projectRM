//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//
import UIKit
/// MainViewController
class MainViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainSettingsToOutlets()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alert(title: "Введите ваше ФИО.", message: "", style: .alert)
    }
    
    func addMainSettingsToOutlets() {
        self.nameLabel.text = "Ваше ФИО"
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Отправить", style: .default) { _ in
            guard let text = alertController.textFields?.first else { return }
            self.nameLabel.text = text.text
        }
        alertController.addTextField { _ in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func summAlert(title: String, message: String, style: UIAlertController.Style) {
        let summAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let summAction = UIAlertAction(title: "Сложить два числа", style: .default) { _ in
            guard let number = summAlertController.textFields?.first else { return }
            guard let numberTwo = summAlertController.textFields?[1] else { return }
            let intNumber = Int(number.text ?? "0") ?? 0
            let intNumberTwo = Int(numberTwo.text ?? "0") ?? 0
            self.nameLabel.text = String(Int(intNumber) + Int(intNumberTwo))

        }
        
        summAlertController.addTextField { _ in
        }
        
        summAlertController.addTextField { _ in
        }
        
        summAlertController.addAction(summAction)
        self.present(summAlertController, animated: true, completion: nil)
    }
    
    func randomAlert(title: String, message: String, style: UIAlertController.Style) {
        let randomInt = Int.random(in: 1...10)
        let randomAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionRandom = UIAlertAction(title: "Отправить", style: .default) { _ in
            guard let number = randomAlertController.textFields?.first else { return }
            let intNumber = Int(number.text ?? "0")
            if intNumber == randomInt {
                self.nameLabel.text = "Вы угадали число - \(randomInt)"
            } else {
                self.nameLabel.text = "Вы проиграли, загаданное число - \(randomInt)"
            }
            
        }
        randomAlertController.addTextField { _ in
        }
        
        randomAlertController.addAction(actionRandom)
        self.present(randomAlertController, animated: true, completion: nil)
    }
    
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "secondVC", sender: nil)
    }
    
    @IBAction func summAction(_ sender: Any) {
        summAlert(title: "Сложение", message: "Введите два числа", style: .alert)

    }
    
    @IBAction func randomNumber(_ sender: Any) {
        randomAlert(title: "Рандом", message: "Загадайте число от 1 до 10", style: .alert)
    }
}

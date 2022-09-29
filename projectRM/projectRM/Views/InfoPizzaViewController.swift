//
//  InfoPizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за количество колорий в выбранной пользователем пицце по умолчанию
class InfoPizzaViewController: UIViewController {
    
    var namePizzaLabel = UILabel()
    var caloriesLabel = UILabel()
    var pizzaImageView = UIImageView()

    var numberOfPizza = 0
    var pizzas = ["Маргарита", "Пеперони"]
    var calories = ["334", "654"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createNamePizzaLabel()
        createPizzaImageView()
        createPizzaCaloriesLabel()
    }
    
    func createPizzaCaloriesLabel() {
        caloriesLabel.frame = CGRect(x: 50, y: 650, width: 300, height: 50)
        caloriesLabel.text = "\(calories[numberOfPizza]) калорий"
        caloriesLabel.font = .boldSystemFont(ofSize: 25)
        caloriesLabel.textAlignment = .center
        
        view.addSubview(caloriesLabel)
    }
    
    func createPizzaImageView() {
        pizzaImageView.image = UIImage(named: pizzas[numberOfPizza])
        pizzaImageView.frame = CGRect(x: 50, y: 130, width: 300, height: 350)
        
        view.addSubview(pizzaImageView)
    }
    
    func createNamePizzaLabel() {
        namePizzaLabel.frame = CGRect(x: 50, y: 80, width: 300, height: 50)
        namePizzaLabel.text = pizzas[numberOfPizza]
        namePizzaLabel.font = .boldSystemFont(ofSize: 25)
        namePizzaLabel.textAlignment = .center
        
        view.addSubview(namePizzaLabel)
    }
}

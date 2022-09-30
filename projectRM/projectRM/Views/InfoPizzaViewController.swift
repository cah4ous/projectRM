//
//  InfoPizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за количество колорий в выбранной пользователем пицце по умолчанию
final class InfoPizzaViewController: UIViewController {
    
    var namePizzaLabel = UILabel()
    var caloriesLabel = UILabel()
    var pizzaImageView = UIImageView()
    var descriptionPizzaLabel = UILabel()

    var numberOfPizza = 0
    var pizzas = ["Маргарита", "Пеперони"]
    var caloriesPizza = ["649", "789"]
    var weightPizza = ["330", "331"]
    var desctiptionPizza = ["Томатный соус, моцарелла, помидоры, орегано",
                            "Томатный соус, моцарелла, пеперони"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createNamePizzaLabel()
        createPizzaImageView()
        createPizzaCaloriesLabel()
        createDescriptionPizzaLabel()
    }
    
    func createDescriptionPizzaLabel() {
        descriptionPizzaLabel.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        descriptionPizzaLabel.numberOfLines = 0
        descriptionPizzaLabel.text = "\(desctiptionPizza[numberOfPizza])"
        descriptionPizzaLabel.font = .boldSystemFont(ofSize: 15)
        descriptionPizzaLabel.textAlignment = .center
        
        view.addSubview(descriptionPizzaLabel)
    }
    
    func createPizzaCaloriesLabel() {
        caloriesLabel.frame = CGRect(x: 50, y: 500, width: 300, height: 100)
        caloriesLabel.text = "\(caloriesPizza[numberOfPizza]) кк, \(weightPizza[numberOfPizza]) г"
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

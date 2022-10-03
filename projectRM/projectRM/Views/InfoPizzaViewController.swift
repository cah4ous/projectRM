//
//  InfoPizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за количество колорий в выбранной пользователем пицце по умолчанию
final class InfoPizzaViewController: UIViewController {
    
    var numberOfPizza = 0
    var pizzas = ["Маргарита", "Пеперони"]
    var caloriesPizza = ["649", "789"]
    var weightPizza = ["330", "331"]
    var desctiptionPizza = ["Томатный соус, моцарелла, помидоры, орегано",
                            "Томатный соус, моцарелла, пеперони"
    ]
    
    // MARK: - Private Visual Components
    private lazy var namePizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 80, width: 300, height: 50)
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var caloriesLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 500, width: 300, height: 100)
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 130, width: 300, height: 350)
        
        return imageView
    }()
    
    private lazy var descriptionPizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        descriptionPizzaLabel.text = "\(desctiptionPizza[numberOfPizza])"
        view.addSubview(descriptionPizzaLabel)
        
        caloriesLabel.text = "\(caloriesPizza[numberOfPizza]) кк, \(weightPizza[numberOfPizza]) г"
        view.addSubview(caloriesLabel)
        
        pizzaImageView.image = UIImage(named: pizzas[numberOfPizza])
        view.addSubview(pizzaImageView)
        
        namePizzaLabel.text = pizzas[numberOfPizza]
        view.addSubview(namePizzaLabel)
    }
}

//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за оплату и чек
final class CheckViewController: UIViewController {
    private lazy var pizzaSizeSegmentControl: UISegmentedControl = {
        var segmentControl = UISegmentedControl(items: ["Доставка",
                                                        "Самовывоз",
                                                       ])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.frame = CGRect(x: 25, y: 700, width: 350, height: 35)
        
        return segmentControl
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 40, y: 150, width: 100, height: 100)
        
        return imageView
    }()
    
    private lazy var personalOrderLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        label.text = "Ваш заказ: "
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var pizzaNameLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 240, height: 50)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    var mushroomsLabel = UILabel()
    var hamLabel = UILabel()
    var cheeseLabel = UILabel()
    private lazy var descriptionPizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 240, height: 50)
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    private lazy var payButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("Оформить заказ", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 6
        button.frame = CGRect(x: 50, y: 765, width: 300, height: 50)
        button.addTarget(self, action: #selector(selectPayButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    var payCashLabel = UILabel()
    var payCashSwitch = UISwitch()
    var payCardLabel = UILabel()
    var payCardSwitch = UISwitch()
    var priceLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 280, y: 765, width: 50, height: 50)
        label.textColor = .white
        
        return label
    }()
    var detailPizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        label.text = "Детали заказа: "
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .lightGray
        
        return label
    }()
    var promocodeTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Промокод..."
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.frame = CGRect(x: 25, y: 620, width: 350, height: 50)
        
        return textField
    }()
    var pizzas = ["Маргарита", "Пеперони"]
    var desctiptionPizza = ["Томатный соус, моцарелла, помидоры, орегано",
                            "Томатный соус, моцарелла, пеперони"
    ]

    var isCheese = false
    var isHam = false
    var isMushrooms = false
    
    var pizzaName = "nil"
    var height = 350
    var value = 0
    var numberOfPizza = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createPriceLabel()
        createProductLabel()
        createProductImageView()
        createDescriptionProductLabel()
        createCheeseLabel(height: height, isActive: isCheese)
        createHamLabel(height: height, isActive: isHam)
        createMushroomsLabel(height: height, isActive: isMushrooms)
        settingsView()
    }
    
    private func configureViews() {
        view.addSubview(descriptionPizzaLabel)
        view.addSubview(pizzaNameLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(promocodeTextField)
        view.addSubview(pizzaSizeSegmentControl)
        view.addSubview(priceLabel)
        view.addSubview(payButton)
        view.addSubview(detailPizzaLabel)
        view.addSubview(personalOrderLabel)
    }
    
    func createDescriptionProductLabel() {
        print(desctiptionPizza[numberOfPizza])
        print(numberOfPizza)
        descriptionPizzaLabel.text = "\(desctiptionPizza[numberOfPizza])"
        
    }
    
    func createProductLabel() {
        pizzaNameLabel.text = pizzas[numberOfPizza]
        
    }
    
    func createProductImageView() {
        pizzaImageView.image = UIImage(named: "\(pizzas[numberOfPizza]).png")
        
    }
    
    func createPriceLabel() {
        priceLabel.text = "\(value) ₽"
        
    }

    private func settingsView() {
        navigationItem.title = "Оплата"
        navigationItem.hidesBackButton = true
    }
    
    private func createCheeseLabel(height: Int, isActive: Bool) {
           if isActive {
               cheeseLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               cheeseLabel.font = .boldSystemFont(ofSize: 17)
               cheeseLabel.textColor = .gray

               self.height += 60

               cheeseLabel.text = "Сыр моцарелла"

               view.addSubview(cheeseLabel)
           }
       }

    private func createHamLabel(height: Int, isActive: Bool) {
           if isActive {
               hamLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               hamLabel.font = .boldSystemFont(ofSize: 17)
               hamLabel.textColor = .gray

               self.height += 60

               hamLabel.text = "Ветчина"

               view.addSubview(hamLabel)
           }
       }

    private func createMushroomsLabel(height: Int, isActive: Bool) {
           if isActive {
               mushroomsLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               mushroomsLabel.font = .boldSystemFont(ofSize: 17)
               mushroomsLabel.textColor = .gray

               self.height += 60

               mushroomsLabel.text = "Грибы"

               view.addSubview(mushroomsLabel)
           }
       }

    @objc private func selectPayButtonAction() {
        let alertController = UIAlertController(title: "Заказ оплачен!",
                                              message: "Ваш заказ доставят в течение 15 минут. Приятного аппетита",
                                              preferredStyle: .alert)

         let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
             let foodViewController = FoodViewController()
             self.navigationController?.pushViewController(foodViewController, animated: true)
         }
        let actionAlertTwo = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(actionAlert)
        alertController.addAction(actionAlertTwo)
        
        present(alertController, animated: true)
    }
}

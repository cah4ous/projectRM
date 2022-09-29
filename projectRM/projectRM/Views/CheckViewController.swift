//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за оплату и чек
class CheckViewController: UIViewController {
    
    var pizzaImageView = UIImageView()
    var personalOrderLabel = UILabel()
    var pizzaNameLabel = UILabel()
    var mushroomsLabel = UILabel()
    var hamLabel = UILabel()
    var cheeseLabel = UILabel()
    var descriptionPizzaLabel = UILabel()
    var payButton = UIButton(type: .custom)
    var payCashLabel = UILabel()
    var payCashSwitch = UISwitch()
    var payCardLabel = UILabel()
    var payCardSwitch = UISwitch()
    var priceLabel = UILabel()
    var detailPizzaLabel = UILabel()
    var promocodeTextField = UITextField()
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
        createPersonalOrderLabel()
        createPayButton()
        createCheckSegmentControl()
        createPriceLabel()
        createPromoTextField()
        createProductLabel()
        createProductImageView()
        createDescriptionProductLabel()
        createDetailPizza()
        createCheeseLabel(height: height, isActive: isCheese)
        createHamLabel(height: height, isActive: isHam)
        createMushroomsLabel(height: height, isActive: isMushrooms)
        settingsView()
    }
    
    func createDescriptionProductLabel() {
        descriptionPizzaLabel.frame = CGRect(x: 150, y: 200, width: 240, height: 50)
        descriptionPizzaLabel.numberOfLines = 0
        descriptionPizzaLabel.text = "\(desctiptionPizza[numberOfPizza])"
        descriptionPizzaLabel.font = .boldSystemFont(ofSize: 15)
        descriptionPizzaLabel.textAlignment = .center
        
        view.addSubview(descriptionPizzaLabel)
    }
    
    func createProductLabel() {
        pizzaNameLabel.text = pizzas[numberOfPizza]
        pizzaNameLabel.frame = CGRect(x: 150, y: 150, width: 240, height: 50)
        pizzaNameLabel.font = .boldSystemFont(ofSize: 20)
        pizzaNameLabel.textAlignment = .center
        
        view.addSubview(pizzaNameLabel)
    }
    
    func createProductImageView() {
        pizzaImageView.image = UIImage(named: "\(pizzas[numberOfPizza]).png")
        pizzaImageView.frame = CGRect(x: 40, y: 150, width: 100, height: 100)
        
        view.addSubview(pizzaImageView)
    }
    
    func createPromoTextField() {
        promocodeTextField.placeholder = "Промокод..."
        promocodeTextField.borderStyle = .roundedRect
        promocodeTextField.textAlignment = .center
        promocodeTextField.layer.cornerRadius = 5
        promocodeTextField.frame = CGRect(x: 25, y: 620, width: 350, height: 50)

        view.addSubview(promocodeTextField)
    }
    
    func createCheckSegmentControl() {
        let pizzaSizeSegmentControl = UISegmentedControl(items: ["Доставка",
                                                                 "Самовывоз",
        ])
        pizzaSizeSegmentControl.selectedSegmentIndex = 0
        pizzaSizeSegmentControl.frame = CGRect(x: 25, y: 700, width: 350, height: 35)
        
        view.addSubview(pizzaSizeSegmentControl)
    }
    
    func createPriceLabel() {
        priceLabel.frame = CGRect(x: 280, y: 765, width: 50, height: 50)
        priceLabel.text = "\(value) ₽"
        priceLabel.textColor = .white
        
        view.addSubview(priceLabel)
    }
    
    func createPayButton() {
        payButton.setTitle("Оформить заказ", for: .normal)
        payButton.backgroundColor = .orange
        payButton.layer.cornerRadius = 6
        payButton.frame = CGRect(x: 50, y: 765, width: 300, height: 50)
        payButton.addTarget(self, action: #selector(selectPayButtonAction), for: .touchUpInside)
        
        view.addSubview(payButton)
    }
    
    func createDetailPizza() {
        detailPizzaLabel.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        detailPizzaLabel.text = "Детали заказа: "
        detailPizzaLabel.font = .boldSystemFont(ofSize: 20)
        detailPizzaLabel.textColor = .lightGray
        
        view.addSubview(detailPizzaLabel)
    }
    
    func createPersonalOrderLabel() {
        personalOrderLabel.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        personalOrderLabel.text = "Ваш заказ: "
        personalOrderLabel.font = .boldSystemFont(ofSize: 20)
        personalOrderLabel.textColor = .lightGray
        
        view.addSubview(personalOrderLabel)
    }
    
    func settingsView() {
        navigationItem.title = "Оплата"
        navigationItem.hidesBackButton = true
    }
    
    func createCheeseLabel(height: Int, isActive: Bool) {
           if isActive {
               cheeseLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               cheeseLabel.font = .boldSystemFont(ofSize: 17)
               cheeseLabel.textColor = .gray

               self.height += 60

               cheeseLabel.text = "Сыр моцарелла"

               view.addSubview(cheeseLabel)
           }
       }

       func createHamLabel(height: Int, isActive: Bool) {
           if isActive {
               hamLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               hamLabel.font = .boldSystemFont(ofSize: 17)
               hamLabel.textColor = .gray

               self.height += 60

               hamLabel.text = "Ветчина"

               view.addSubview(hamLabel)
           }
       }

       func createMushroomsLabel(height: Int, isActive: Bool) {
           if isActive {
               mushroomsLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
               mushroomsLabel.font = .boldSystemFont(ofSize: 17)
               mushroomsLabel.textColor = .gray

               self.height += 60

               mushroomsLabel.text = "Грибы"

               view.addSubview(mushroomsLabel)
           }
       }

    @objc func selectPayButtonAction() {
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

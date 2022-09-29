//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за оплату и чек
class CheckViewController: UIViewController {
    
    var personalOrderLabel = UILabel()
    var pizzaNameLabel = UILabel()
    var cheeseLabel = UILabel()
    var hamLabel = UILabel()
    var mushroomsLabel = UILabel()
    var olivesLabel = UILabel()
    var payButton = UIButton()
    var payCashLabel = UILabel()
    var payCashSwitch = UISwitch()
    var payCardLabel = UILabel()
    var payCardSwitch = UISwitch()

    var isCheese = false
    var isHam = false
    var isMushrooms = false
    var isOlives = false
    
    var pizzaName = "nil"
    var height = 170
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createPersonalOrderLabel()
        createPizzaNameLabel(height: height)
        createCheeseLabel(height: height, isActive: isCheese)
        createHamLabel(height: height, isActive: isHam)
        createMushroomsLabel(height: height, isActive: isMushrooms)
        createOlivesLabel(height: height, isActive: isOlives)
        createPayCardSwitch()
        createPayCardLabel()
        createPayCashLabel()
        createPayCashSwitch()
        createPayButton()
        settingsView()
    }
    
    func createPayCardSwitch() {
        payCardSwitch.frame = CGRect(x: 280, y: 640, width: 0, height: 0)
        
        view.addSubview(payCardSwitch)
    }
    
    func createPayButton() {
        payButton.setImage(UIImage(named: "applePay.png"), for: .normal)
        payButton.layer.cornerRadius = 6
        payButton.frame = CGRect(x: 50, y: 765, width: 300, height: 50)
        payButton.addTarget(self, action: #selector(selectPayButtonAction), for: .touchUpInside)
        
        view.addSubview(payButton)
    }
    
    func createPayCardLabel() {
        payCardLabel.text = "Оплатка картой"
        payCardLabel.frame = CGRect(x: 0, y: 630, width: 300, height: 50)
        payCardLabel.font = .boldSystemFont(ofSize: 20)
        payCardLabel.textColor = .gray
        payCardLabel.textAlignment = .center
        
        view.addSubview(payCardLabel)
    }
    
    func createPayCashSwitch() {
        payCashSwitch.frame = CGRect(x: 280, y: 710, width: 0, height: 0)
        
        view.addSubview(payCashSwitch)
    }
    
    func createPayCashLabel() {
        payCashLabel.text = "Наличными"
        payCashLabel.frame = CGRect(x: 0, y: 700, width: 300, height: 50)
        payCashLabel.font = .boldSystemFont(ofSize: 20)
        payCashLabel.textColor = .gray
        payCashLabel.textAlignment = .center
        
        view.addSubview(payCashLabel)
    }
    
    func createPizzaNameLabel(height: Int) {
        pizzaNameLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
        pizzaNameLabel.font = .boldSystemFont(ofSize: 25)
        pizzaNameLabel.textColor = .gray
        
        value += 1
        self.height += 90
        
        pizzaNameLabel.text = "\(value). Пицца \(pizzaName)"

        view.addSubview(pizzaNameLabel)
    }
    
    func createCheeseLabel(height: Int, isActive: Bool) {
        if isActive {
            cheeseLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
            cheeseLabel.font = .boldSystemFont(ofSize: 25)
            cheeseLabel.textColor = .gray
            
            value += 1
            self.height += 90
            
            cheeseLabel.text = "\(value). Сыр мацарелла"

            view.addSubview(cheeseLabel)
        }
    }
    
    func createHamLabel(height: Int, isActive: Bool) {
        if isActive {
            hamLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
            hamLabel.font = .boldSystemFont(ofSize: 25)
            hamLabel.textColor = .gray
            
            value += 1
            self.height += 90
            
            hamLabel.text = "\(value). Ветчина"

            view.addSubview(hamLabel)
        }
    }
    
    func createMushroomsLabel(height: Int, isActive: Bool) {
        if isActive {
            mushroomsLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
            mushroomsLabel.font = .boldSystemFont(ofSize: 25)
            mushroomsLabel.textColor = .gray
            
            value += 1
            self.height += 90
            
            mushroomsLabel.text = "\(value). Грибы"

            view.addSubview(mushroomsLabel)
        }
    }
    
    func createOlivesLabel(height: Int, isActive: Bool) {
        if isActive {
            olivesLabel.frame = CGRect(x: 50, y: height, width: 300, height: 50)
            olivesLabel.font = .boldSystemFont(ofSize: 25)
            olivesLabel.textColor = .gray
            
            value += 1
            self.height += 90
            
            olivesLabel.text = "\(value). Маслины"

            view.addSubview(olivesLabel)
        }
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
    
    @objc func selectPayButtonAction() {
        let alertController = UIAlertController(title: "Заказ оплачен!",
                                              message: "Ваш заказ доставят в течение 15 минут. Приятного аппетита",
                                              preferredStyle: .alert)

         let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
             let foodViewController = FoodViewController()
             self.navigationController?.pushViewController(foodViewController, animated: true)
         }

      alertController.addAction(actionAlert)

      present(alertController, animated: true)
    }
}

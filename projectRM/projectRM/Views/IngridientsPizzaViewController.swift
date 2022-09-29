//
//  IngridientsPizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Этот экран отвечает за выбор ингридиентов для пиццы
class IngridientsPizzaViewController: UIViewController {
    
    var pizzaImageView = UIImageView()
    var pizzaSizeSegmentControl = UISegmentedControl(items: ["Диаметр: 25 см",
                                                             "Диаметр: 30 см",
                                                             "Диаметр: 35 см"])
    var cheeseImageView = UIImageView()
    var hamImageView = UIImageView()
    var mushroomsImageView = UIImageView()
    var pizzaLabel = UILabel()
    var cheeseLabel = UILabel()
    var cheeseSwitch = UISwitch()
    var hamLabel = UILabel()
    var hamSwitch = UISwitch()
    var mushroomsLabel = UILabel()
    var mushroomsSwitch = UISwitch()
    var olivesLabel = UILabel()
    var olivesSwitch = UISwitch()
    var selectButton = UIButton()
    var infoPizzaButton = UIButton()
    var priceLabel = UILabel()
    
    var numberOfPizza = 0
    var allPizzaPrice = 543
    var ingridientPizzaPrice = 0
    var pizzas = ["Маргарита", "Пеперони"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()

    }
    
    func initMethods() {
        createPizzaImageView()
        createCheeseSwitch()
        createHamSwitch()
        createMushroomsSwitch()
        createCheeseLabel()
        createHamLabel()
        createMushroomsLabel()
        createPizzaLabel()
        createSelectButton()
        createInfoPizzaButton()
        createPriceLabel()
        createPizzaSizeSegmentControl()
        createCheeseImageView()
        createMushroomsImageView()
        createHamImageView()
        settingsView()
        
    }
    
    func createPizzaSizeSegmentControl() {
        pizzaSizeSegmentControl.selectedSegmentIndex = 0
        pizzaSizeSegmentControl.frame = CGRect(x: 25, y: 700, width: 350, height: 35)
        pizzaSizeSegmentControl.addTarget(self, action: #selector(pizzaSegmentControlAction), for: .valueChanged)
        
        view.addSubview(pizzaSizeSegmentControl)
        
    }
    
    func createInfoPizzaButton() {
        infoPizzaButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoPizzaButton.tintColor = .white
        infoPizzaButton.backgroundColor = .orange
        infoPizzaButton.layer.cornerRadius = 10
        infoPizzaButton.frame = CGRect(x: 330, y: 90, width: 40, height: 40)
        infoPizzaButton.addTarget(self, action: #selector(infoPizzaButtonAction), for: .touchUpInside)
        
        view.addSubview(infoPizzaButton)
    }
    
    func createPriceLabel() {
        priceLabel.frame = CGRect(x: 280, y: 765, width: 50, height: 50)
        priceLabel.text = "565 ₽"
        priceLabel.textColor = .white
        
        view.addSubview(priceLabel)
    }
    
    func createSelectButton() {
        selectButton.backgroundColor = .orange
        selectButton.setTitle("В корзину", for: .normal)
        selectButton.subtitleLabel?.textAlignment = .left
        selectButton.layer.cornerRadius = 6
        selectButton.frame = CGRect(x: 50, y: 765, width: 300, height: 50)
        selectButton.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
        
        view.addSubview(selectButton)
    }
    
    func createPizzaLabel() {
        pizzaLabel.frame = CGRect(x: 50, y: 80, width: 300, height: 50)
        pizzaLabel.text = pizzas[numberOfPizza]
        pizzaLabel.font = .boldSystemFont(ofSize: 25)
        pizzaLabel.textAlignment = .center
        
        view.addSubview(pizzaLabel)
    }
    
    func createCheeseImageView() {
        cheeseImageView.image = UIImage(named: "mozzarella.png")
        cheeseImageView.frame = CGRect(x: 30, y: 480, width: 60, height: 60)
        
        view.addSubview(cheeseImageView)
    }
    
    func createHamImageView() {
        hamImageView.image = UIImage(named: "ham.png")
        hamImageView.frame = CGRect(x: 30, y: 560, width: 60, height: 60)
        
        view.addSubview(hamImageView)
    }
    
    func createMushroomsImageView() {
        mushroomsImageView.image = UIImage(named: "mushrooms.png")
        mushroomsImageView.frame = CGRect(x: 30, y: 630, width: 60, height: 60)
        
        view.addSubview(mushroomsImageView)
    }
    
    func createCheeseLabel() {
        cheeseLabel.text = "Сыр - 30 ₽"
        cheeseLabel.frame = CGRect(x: 110, y: 490, width: 150, height: 50)
        cheeseLabel.font = .boldSystemFont(ofSize: 17)
        cheeseLabel.textAlignment = .center
        
        view.addSubview(cheeseLabel)
    }
    
    func createCheeseSwitch() {
        cheeseSwitch.frame = CGRect(x: 280, y: 500, width: 0, height: 0)
        cheeseSwitch.addTarget(self, action: #selector(cheeseSwitchAction), for: .valueChanged)
        view.addSubview(cheeseSwitch)
    }
    
    func createHamLabel() {
        hamLabel.text = "Ветчина - 50 ₽"
        hamLabel.frame = CGRect(x: 110, y: 560, width: 150, height: 50)
        hamLabel.font = .boldSystemFont(ofSize: 17)
        hamLabel.textAlignment = .center
        
        view.addSubview(hamLabel)
    }
    
    func createHamSwitch() {
        hamSwitch.frame = CGRect(x: 280, y: 570, width: 0, height: 0)
        hamSwitch.addTarget(self, action: #selector(hamSwitchAction), for: .valueChanged)
        
        view.addSubview(hamSwitch)
    }
    
    func createMushroomsLabel() {
        mushroomsLabel.text = "Грибы - 20 ₽"
        mushroomsLabel.frame = CGRect(x: 110, y: 630, width: 150, height: 50)
        mushroomsLabel.font = .boldSystemFont(ofSize: 17)
        mushroomsLabel.textAlignment = .center
        
        view.addSubview(mushroomsLabel)
    }
    
    func createMushroomsSwitch() {
        mushroomsSwitch.frame = CGRect(x: 280, y: 640, width: 0, height: 0)
        mushroomsSwitch.addTarget(self, action: #selector(mushroomsSwitchAction), for: .valueChanged)
        
        view.addSubview(mushroomsSwitch)
    }
    
    func createPizzaImageView() {
        pizzaImageView.image = UIImage(named: pizzas[numberOfPizza])
        pizzaImageView.frame = CGRect(x: 50, y: 130, width: 300, height: 350)
        
        view.addSubview(pizzaImageView)
    }
    
    func settingsView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .plain, target: self, action: #selector(goBackAction))
    }
    
    @objc func cheeseSwitchAction() {
        if cheeseSwitch.isOn {
            ingridientPizzaPrice += 30
        } else {
            ingridientPizzaPrice -= 30
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc func hamSwitchAction() {
        if hamSwitch.isOn {
            ingridientPizzaPrice += 50
        } else {
            ingridientPizzaPrice -= 50
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc func mushroomsSwitchAction() {
        if mushroomsSwitch.isOn {
            ingridientPizzaPrice += 20
        } else {
            ingridientPizzaPrice -= 20
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc func pizzaSegmentControlAction() {
        switch pizzaSizeSegmentControl.selectedSegmentIndex {
        case 0:
            allPizzaPrice = 543
        case 1:
            allPizzaPrice = 650
        case 2:
            allPizzaPrice = 899
        default:
            print(pizzaSizeSegmentControl.selectedSegmentIndex)
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc func goBackAction() {
        let pizzaViewController = PizzaViewController()
         navigationController?.pushViewController(pizzaViewController, animated: true)
    }
    
    @objc func selectButtonAction() {
        let checkViewController = CheckViewController()
        checkViewController.value = allPizzaPrice + ingridientPizzaPrice
        checkViewController.pizzaName = pizzas[numberOfPizza]
        checkViewController.isCheese = cheeseSwitch.isOn
        checkViewController.isHam = hamSwitch.isOn
        checkViewController.isMushrooms = mushroomsSwitch.isOn
        checkViewController.numberOfPizza = numberOfPizza
         navigationController?.pushViewController(checkViewController, animated: true)
    }
    
    @objc func infoPizzaButtonAction() {
        let infoPizzaViewController = InfoPizzaViewController()
        infoPizzaViewController.numberOfPizza = numberOfPizza
        navigationController?.pushViewController(infoPizzaViewController, animated: true)
    }
}

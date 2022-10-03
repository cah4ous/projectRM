//
//  IngridientsPizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Этот экран отвечает за выбор ингридиентов для пиццы
final class IngridientsPizzaViewController: UIViewController {
    
    private lazy var pizzaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 130, width: 300, height: 350)
        
        return imageView
    }()
    
    private lazy var pizzaSizeSegmentControl: UISegmentedControl = {
        var segmentedControl = UISegmentedControl(items: ["Диаметр: 25 см",
                                                    "Диаметр: 30 см",
                                                    "Диаметр: 35 см"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.frame = CGRect(x: 25, y: 700, width: 350, height: 35)
        segmentedControl.addTarget(self, action: #selector(pizzaSegmentControlAction), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private lazy var cheeseImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "mozzarella.png")
        imageView.frame = CGRect(x: 30, y: 480, width: 60, height: 60)
        
        return imageView
    }()
    
    private lazy var hamImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "ham.png")
        imageView.frame = CGRect(x: 30, y: 560, width: 60, height: 60)
        
        return imageView
    }()
    
    private lazy var mushroomsImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "mushrooms.png")
        imageView.frame = CGRect(x: 30, y: 630, width: 60, height: 60)
        
        return imageView
    }()
    
    private lazy var pizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 80, width: 300, height: 50)
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var cheeseLabel: UILabel = {
        var label = UILabel()
        label.text = "Сыр - 30 ₽"
        label.frame = CGRect(x: 110, y: 490, width: 150, height: 50)
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var cheeseSwitch: UISwitch = {
        var cheSwitch = UISwitch()
        cheSwitch.frame = CGRect(x: 280, y: 500, width: 0, height: 0)
        cheSwitch.addTarget(self, action: #selector(cheeseSwitchAction), for: .valueChanged)
        
        return cheSwitch
    }()
    
    private lazy var hamLabel: UILabel = {
        var label = UILabel()
        label.text = "Ветчина - 50 ₽"
        label.frame = CGRect(x: 110, y: 560, width: 150, height: 50)
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var hamSwitch: UISwitch = {
        var hSwitch = UISwitch()
        hSwitch.frame = CGRect(x: 280, y: 570, width: 0, height: 0)
        hSwitch.addTarget(self, action: #selector(hamSwitchAction), for: .valueChanged)
        
        return hSwitch
    }()
    
    private lazy var mushroomsLabel: UILabel = {
        var label = UILabel()
        label.text = "Грибы - 20 ₽"
        label.frame = CGRect(x: 110, y: 630, width: 150, height: 50)
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var mushroomsSwitch: UISwitch = {
        var mushSwitch = UISwitch()
        mushSwitch.frame = CGRect(x: 280, y: 640, width: 0, height: 0)
        mushSwitch.addTarget(self, action: #selector(mushroomsSwitchAction), for: .valueChanged)
        
        return mushSwitch
    }()

    private lazy var selectButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("В корзину", for: .normal)
        button.subtitleLabel?.textAlignment = .left
        button.layer.cornerRadius = 6
        button.frame = CGRect(x: 50, y: 765, width: 300, height: 50)
        button.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var infoPizzaButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 330, y: 90, width: 40, height: 40)
        button.addTarget(self, action: #selector(infoPizzaButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 280, y: 765, width: 50, height: 50)
        label.text = "565 ₽"
        label.textColor = .white
        
        return label
    }()
    
    public var numberOfPizza = 0
    public var allPizzaPrice = 543
    private var ingridientPizzaPrice = 0
    private var pizzas = ["Маргарита", "Пеперони"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()

    }
    
    private func initMethods() {
        createPizzaImageView()
        configureViews()
        createPizzaLabel()
        settingsView()
        
    }
    
    private func configureViews() {
        view.addSubview(pizzaSizeSegmentControl)
        view.addSubview(infoPizzaButton)
        view.addSubview(priceLabel)
        view.addSubview(selectButton)
        view.addSubview(cheeseImageView)
        view.addSubview(hamImageView)
        view.addSubview(mushroomsImageView)
        view.addSubview(cheeseLabel)
        view.addSubview(cheeseSwitch)
        view.addSubview(hamLabel)
        view.addSubview(hamSwitch)
        view.addSubview(mushroomsLabel)
        view.addSubview(mushroomsSwitch)
        
    }

    private func createPizzaLabel() {
        
        pizzaLabel.text = pizzas[numberOfPizza]

        view.addSubview(pizzaLabel)
    }

    private func createPizzaImageView() {
        pizzaImageView.image = UIImage(named: pizzas[numberOfPizza])
        view.addSubview(pizzaImageView)
    }
    
    private func settingsView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .plain, target: self, action: #selector(goBackAction))
    }
    
    @objc private func cheeseSwitchAction() {
        if cheeseSwitch.isOn {
            ingridientPizzaPrice += 30
        } else {
            ingridientPizzaPrice -= 30
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc private func hamSwitchAction() {
        if hamSwitch.isOn {
            ingridientPizzaPrice += 50
        } else {
            ingridientPizzaPrice -= 50
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc private func mushroomsSwitchAction() {
        if mushroomsSwitch.isOn {
            ingridientPizzaPrice += 20
        } else {
            ingridientPizzaPrice -= 20
        }
        priceLabel.text = "\(allPizzaPrice + ingridientPizzaPrice) ₽"
    }
    
    @objc private func pizzaSegmentControlAction() {
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
    
    @objc private func goBackAction() {
        let pizzaViewController = PizzaViewController()
         navigationController?.pushViewController(pizzaViewController, animated: true)
    }
    
    @objc private func selectButtonAction() {
        let checkViewController = CheckViewController()
        checkViewController.value = allPizzaPrice + ingridientPizzaPrice
        checkViewController.pizzaName = pizzas[numberOfPizza]
        checkViewController.isCheese = cheeseSwitch.isOn
        checkViewController.isHam = hamSwitch.isOn
        checkViewController.isMushrooms = mushroomsSwitch.isOn
        checkViewController.numberOfPizza = numberOfPizza
         navigationController?.pushViewController(checkViewController, animated: true)
    }
    
    @objc private func infoPizzaButtonAction() {
        let infoPizzaViewController = InfoPizzaViewController()
        infoPizzaViewController.numberOfPizza = numberOfPizza
        navigationController?.pushViewController(infoPizzaViewController, animated: true)
    }
}

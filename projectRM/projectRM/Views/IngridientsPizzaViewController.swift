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
    
    var numberOfPizza = 0
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
        createOlivesSwitch()
        createCheeseLabel()
        createHamLabel()
        createMushroomsLabel()
        createOlivesLabel()
        createPizzaLabel()
        createSelectButton()
        createInfoPizzaButton()
        settingsView()
        
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
    
    func createSelectButton() {
        selectButton.backgroundColor = .orange
        selectButton.setTitle("Выбрать", for: .normal)
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
    
    func createCheeseLabel() {
        cheeseLabel.text = "Сыр мацарела"
        cheeseLabel.frame = CGRect(x: 110, y: 490, width: 150, height: 50)
        cheeseLabel.font = .boldSystemFont(ofSize: 17)
        cheeseLabel.textAlignment = .center
        
        view.addSubview(cheeseLabel)
    }
    
    func createCheeseSwitch() {
        cheeseSwitch.frame = CGRect(x: 280, y: 500, width: 0, height: 0)
        
        view.addSubview(cheeseSwitch)
    }
    
    func createHamLabel() {
        hamLabel.text = "Ветчина"
        hamLabel.frame = CGRect(x: 110, y: 560, width: 150, height: 50)
        hamLabel.font = .boldSystemFont(ofSize: 17)
        hamLabel.textAlignment = .center
        
        view.addSubview(hamLabel)
    }
    
    func createHamSwitch() {
        hamSwitch.frame = CGRect(x: 280, y: 570, width: 0, height: 0)
        
        view.addSubview(hamSwitch)
    }
    
    func createMushroomsLabel() {
        mushroomsLabel.text = "Грибы"
        mushroomsLabel.frame = CGRect(x: 110, y: 630, width: 150, height: 50)
        mushroomsLabel.font = .boldSystemFont(ofSize: 17)
        mushroomsLabel.textAlignment = .center
        
        view.addSubview(mushroomsLabel)
    }
    
    func createMushroomsSwitch() {
        mushroomsSwitch.frame = CGRect(x: 280, y: 640, width: 0, height: 0)
        
        view.addSubview(mushroomsSwitch)
    }
    
    func createOlivesLabel() {
        olivesLabel.text = "Масливы"
        olivesLabel.frame = CGRect(x: 110, y: 700, width: 150, height: 50)
        olivesLabel.font = .boldSystemFont(ofSize: 17)
        olivesLabel.textAlignment = .center
        
        view.addSubview(olivesLabel)
    }
    
    func createOlivesSwitch() {
        olivesSwitch.frame = CGRect(x: 280, y: 710, width: 0, height: 0)
        
        view.addSubview(olivesSwitch)
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
    
    @objc func goBackAction() {
        let pizzaViewController = PizzaViewController()
         navigationController?.pushViewController(pizzaViewController, animated: true)
    }
    
    @objc func selectButtonAction() {
        let checkViewController = CheckViewController()
        checkViewController.pizzaName = pizzas[numberOfPizza]
        checkViewController.isCheese = cheeseSwitch.isOn
        checkViewController.isHam = hamSwitch.isOn
        checkViewController.isMushrooms = mushroomsSwitch.isOn
        checkViewController.isOlives = olivesSwitch.isOn
        
         navigationController?.pushViewController(checkViewController, animated: true)
    }
    
    @objc func infoPizzaButtonAction() {
        let infoPizzaViewController = InfoPizzaViewController()
        infoPizzaViewController.numberOfPizza = numberOfPizza
        navigationController?.pushViewController(infoPizzaViewController, animated: true)
    }
}

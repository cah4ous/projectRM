//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за оплату и чек
final class CheckViewController: UIViewController {
    
    weak var delegate: PopToRootVC?
    
    public var isCheese = false
    public var isHam = false
    public var isMushrooms = false
    public var pizzaName = "nil"
    public var value = 0
    public var numberOfPizza = 0
    
    private var ingridients = ["Сыр моцарелла", "Ветчина", "Грибы"]
    private var height = 350
    private var pizzas = ["Маргарита", "Пеперони"]
    private var desctiptionPizza = ["Томатный соус, моцарелла, помидоры, орегано",
                            "Томатный соус, моцарелла, пеперони"
    ]
    
    
    // MARK: - Private IBOutlet
    
    private var mushroomsLabel = UILabel()
    private var hamLabel = UILabel()
    private var cheeseLabel = UILabel()
    private var payCashLabel = UILabel()
    private var payCashSwitch = UISwitch()
    private var payCardLabel = UILabel()
    private var payCardSwitch = UISwitch()
    
    // MARK: - Private Visual Components
    private lazy var pizzaSizeSegmentControl: UISegmentedControl = {
        var segmentControl = UISegmentedControl(
            items: ["Доставка", "Самовывоз"]
        )
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
    
    private lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 280, y: 765, width: 50, height: 50)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var detailPizzaLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        label.text = "Детали заказа: "
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var promocodeTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Промокод..."
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.frame = CGRect(x: 25, y: 620, width: 350, height: 50)
        
        return textField
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }

    // MARK: - Private IBAction
    @objc private func selectPayButtonAction() {
        let alertController = UIAlertController(title: "Заказ оплачен!",
                                              message: "Ваш заказ доставят в течение 15 минут. Приятного аппетита",
                                              preferredStyle: .alert)

         let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
             self.view.isHidden = true
             self.dismiss(animated: true)
             self.delegate?.goToBack()
         }
        let actionAlertTwo = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(actionAlert)
        alertController.addAction(actionAlertTwo)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Private Methods
    private func initMethods() {
        createPriceLabel()
        createProductLabel()
        createProductImageView()
        createDescriptionProductLabel()
        createDishLabel(label: cheeseLabel, height: height, isActive: isCheese, text: "Сыр моцарелла")
        createDishLabel(label: hamLabel, height: height, isActive: isHam, text: "Ветчина")
        createDishLabel(label: mushroomsLabel, height: height, isActive: isMushrooms, text: "Грибы")
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
    
    private func createDescriptionProductLabel() {
        print(desctiptionPizza[numberOfPizza])
        print(numberOfPizza)
        descriptionPizzaLabel.text = "\(desctiptionPizza[numberOfPizza])"
        
    }
    
    private func createProductLabel() {
        pizzaNameLabel.text = pizzas[numberOfPizza]
        
    }
    
    private func createProductImageView() {
        pizzaImageView.image = UIImage(named: "\(pizzas[numberOfPizza]).png")
        
    }
    
    private func createPriceLabel() {
        priceLabel.text = "\(value) ₽"
        
    }

    private func settingsView() {
        navigationItem.title = "Оплата"
        navigationItem.hidesBackButton = true
    }
    
    private func createDishLabel(label: UILabel, height: Int, isActive: Bool, text: String) {
        if isActive {
            label.frame = CGRect(x: 50, y: height, width: 300, height: 50)
            label.font = .boldSystemFont(ofSize: 17)
            label.textColor = .gray

            self.height += 60

            label.text = text

            view.addSubview(label)
        }
    }
}

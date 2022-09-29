//
//  FoodViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 28.09.2022.
//

import UIKit
/// Экран food, позволяет выбрать нужное блюдо
class FoodViewController: UIViewController {
    
    var pizzaImageView = UIImageView()
    var sushiImageView = UIImageView()
    var blackLineImageView = UIImageView()
    var pizzaLabel = UILabel()
    var sushiLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        settingsView()
        createPizzaImageView()
        createSushiImageView()
        createBlackLineImageView()
        createPizzaLabel()
        createSushiLabel()
    }
    
    func createPizzaLabel() {
        pizzaLabel.text = "Пицца"
        pizzaLabel.frame = CGRect(x: 150, y: 120, width: 200, height: 50)
        pizzaLabel.font = .boldSystemFont(ofSize: 20)
        pizzaLabel.textAlignment = .center
        
        view.addSubview(pizzaLabel)
    }
    
    func createSushiLabel() {
        sushiLabel.text = "Суши"
        sushiLabel.frame = CGRect(x: 150, y: 270, width: 200, height: 50)
        sushiLabel.font = .boldSystemFont(ofSize: 20)
        sushiLabel.textAlignment = .center
        
        view.addSubview(sushiLabel)
    }
    
    func createBlackLineImageView() {
        blackLineImageView.image = UIImage(named: "grayLine.png")
        blackLineImageView.frame = CGRect(x: 35, y: 220, width: 320, height: 25)
        
        view.addSubview(blackLineImageView)
    }
    
    func createPizzaImageView() {
        pizzaImageView.image = UIImage(named: "Маргарита.png")
        pizzaImageView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTappedAction(tapGestureRecognizer:)))
        pizzaImageView.isUserInteractionEnabled = true
        pizzaImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(pizzaImageView)
    }
    
    func createSushiImageView() {
        sushiImageView.image = UIImage(named: "sushi.png")
        sushiImageView.frame = CGRect(x: 50, y: 250, width: 100, height: 100)
        
        view.addSubview(sushiImageView)
    }
    
    func settingsView() {
        navigationItem.title = "Food"
        navigationItem.hidesBackButton = true
    }
    
    @objc func imageTappedAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let pizzaViewController = PizzaViewController()
        navigationController?.pushViewController(pizzaViewController, animated: true)
    }
}

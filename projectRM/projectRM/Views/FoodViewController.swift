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
    }
    
    func createBlackLineImageView() {
        blackLineImageView.image = UIImage(named: "blackLine.png")
        blackLineImageView.frame = CGRect(x: 0, y: 220, width: 500, height: 25)
        
        view.addSubview(blackLineImageView)
    }
    
    func createPizzaImageView() {
        pizzaImageView.image = UIImage(named: "pizza.png")
        pizzaImageView.frame = CGRect(x: 50, y: 100, width: 300, height: 100)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTappedAction(tapGestureRecognizer:)))
        pizzaImageView.isUserInteractionEnabled = true
        pizzaImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(pizzaImageView)
    }
    
    func createSushiImageView() {
        sushiImageView.image = UIImage(named: "sushi.png")
        sushiImageView.frame = CGRect(x: 50, y: 250, width: 300, height: 75)
        
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

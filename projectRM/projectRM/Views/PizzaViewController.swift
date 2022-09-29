//
//  PizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за выбор пиццы
class PizzaViewController: UIViewController {

    var margaritaImageView = UIImageView()
    var peperoniImageView = UIImageView()
    var margaritaLabel = UILabel()
    var peperoniLabel = UILabel()
    var margaritaButton = UIButton()
    var peperoniButton = UIButton()
    var blackLineImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
        
    }
    
    func initMethods() {
        settingsView()
        createMargaritaImageView()
        createPeperoniImageView()
        createMargaritaLabel()
        createPeperoniLabel()
        createMargaritaButton()
        createPeperoniButton()
        createBlackLineImageView()
    }
    
    func createBlackLineImageView() {
        blackLineImageView.image = UIImage(named: "grayLine.png")
        blackLineImageView.frame = CGRect(x: 35, y: 220, width: 320, height: 25)
        
        view.addSubview(blackLineImageView)
    }
    
    func createMargaritaButton() {
        margaritaButton.setTitle("+", for: .normal)
        margaritaButton.backgroundColor = .orange
        margaritaButton.layer.cornerRadius = 10
        margaritaButton.frame = CGRect(x: 330, y: 125, width: 40, height: 40)
        margaritaButton.addTarget(self, action: #selector(margaritaButtonAction), for: .touchUpInside)
        
        view.addSubview(margaritaButton)
    }
    
    func createPeperoniButton() {
        peperoniButton.setTitle("+", for: .normal)
        peperoniButton.backgroundColor = .orange
        peperoniButton.layer.cornerRadius = 10
        peperoniButton.frame = CGRect(x: 330, y: 275, width: 40, height: 40)
        peperoniButton.addTarget(self, action: #selector(peperoniButtonAction), for: .touchUpInside)
        
        view.addSubview(peperoniButton)
        
    }
    
    func createMargaritaLabel() {
        margaritaLabel.text = "Маргарита"
        margaritaLabel.frame = CGRect(x: 150, y: 120, width: 200, height: 50)
        margaritaLabel.font = .boldSystemFont(ofSize: 20)
        margaritaLabel.textAlignment = .center
        
        view.addSubview(margaritaLabel)
    }
    
    func createPeperoniLabel() {
        peperoniLabel.text = "Пеперони"
        peperoniLabel.frame = CGRect(x: 150, y: 270, width: 200, height: 50)
        peperoniLabel.font = .boldSystemFont(ofSize: 20)
        peperoniLabel.textAlignment = .center
        
        view.addSubview(peperoniLabel)
    }
    
    func createMargaritaImageView() {
        margaritaImageView.image = UIImage(named: "Маргарита.png")
        margaritaImageView.frame = CGRect(x: 40, y: 100, width: 100, height: 100)
        
        view.addSubview(margaritaImageView)
    }
    
    func createPeperoniImageView() {
        peperoniImageView.image = UIImage(named: "Пеперони.png")
        peperoniImageView.frame = CGRect(x: 40, y: 250, width: 100, height: 100)
        
        view.addSubview(peperoniImageView)
    }
    
    func settingsView() {
        navigationItem.title = "Pizza"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .plain, target: self, action: #selector(goBackAction))
    }
    
    @objc func goBackAction() {
        let foodViewController = FoodViewController()
         navigationController?.pushViewController(foodViewController, animated: true)
    }
    
    @objc func margaritaButtonAction() {
        let ingridientsPizzaViewController = IngridientsPizzaViewController()
        ingridientsPizzaViewController.numberOfPizza = 0
        navigationController?.pushViewController(ingridientsPizzaViewController, animated: true)
    }
    
    @objc func peperoniButtonAction() {
        let ingridientsPizzaViewController = IngridientsPizzaViewController()
        ingridientsPizzaViewController.numberOfPizza = 1
        navigationController?.pushViewController(ingridientsPizzaViewController, animated: true)
    }
}

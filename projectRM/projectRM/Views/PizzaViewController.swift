//
//  PizzaViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import UIKit
/// Экран, который отвечает за выбор пиццы
final class PizzaViewController: UIViewController {

    private lazy var margaritaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Маргарита.png")
        imageView.frame = CGRect(x: 40, y: 100, width: 100, height: 100)
        
        return imageView
    }()
    
    private lazy var peperoniImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Пеперони.png")
        imageView.frame = CGRect(x: 40, y: 250, width: 100, height: 100)
        
        return imageView
    }()
    
    private lazy var margaritaLabel: UILabel = {
        var label = UILabel()
        label.text = "Маргарита"
        label.frame = CGRect(x: 150, y: 120, width: 200, height: 50)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    var peperoniLabel: UILabel = {
        var label = UILabel()
        label.text = "Пеперони"
        label.frame = CGRect(x: 150, y: 270, width: 200, height: 50)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    private lazy var margaritaButton: UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 330, y: 125, width: 40, height: 40)
        button.addTarget(self, action: #selector(margaritaButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var peperoniButton: UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 330, y: 275, width: 40, height: 40)
        button.addTarget(self, action: #selector(peperoniButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var blackLineImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "grayLine.png")
        imageView.frame = CGRect(x: 35, y: 220, width: 320, height: 25)
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        
    }

    private func configureViews() {
        view.addSubview(blackLineImageView)
        view.addSubview(margaritaButton)
        view.addSubview(peperoniButton)
        view.addSubview(margaritaLabel)
        view.addSubview(peperoniLabel)
        view.addSubview(margaritaImageView)
        view.addSubview(peperoniImageView)
    }

    private func settingsView() {
        navigationItem.title = "Pizza"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .plain, target: self, action: #selector(goBackAction))
    }
    
    @objc private func goBackAction() {
        let foodViewController = FoodViewController()
         navigationController?.pushViewController(foodViewController, animated: true)
    }
    
    @objc private func margaritaButtonAction() {
        let ingridientsPizzaViewController = IngridientsPizzaViewController()
        ingridientsPizzaViewController.numberOfPizza = 0
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(ingridientsPizzaViewController, animated: true)
    }
    
    @objc func peperoniButtonAction() {
        let ingridientsPizzaViewController = IngridientsPizzaViewController()
        ingridientsPizzaViewController.numberOfPizza = 1
        navigationController?.pushViewController(ingridientsPizzaViewController, animated: true)
    }
}

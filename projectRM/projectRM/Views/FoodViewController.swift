//
//  FoodViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 28.09.2022.
//

import UIKit
/// Экран food, позволяет выбрать нужное блюдо
final class FoodViewController: UIViewController {
    
    private lazy var pizzaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Маргарита.png")
        imageView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTappedAction(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    private lazy var sushiImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sushi.png")
        imageView.frame = CGRect(x: 50, y: 250, width: 100, height: 100)
        
        return imageView
    }()
    
    private lazy var blackLineImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "grayLine.png")
        imageView.frame = CGRect(x: 35, y: 220, width: 320, height: 25)
        
        return imageView
    }()
    
    private lazy var pizzaLabel: UILabel = {
        var label = UILabel()
        label.text = "Пицца"
        label.frame = CGRect(x: 150, y: 120, width: 200, height: 50)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var sushiLabel: UILabel = {
        var label = UILabel()
        label.text = "Суши"
        label.frame = CGRect(x: 150, y: 270, width: 200, height: 50)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
    }
    
    private func configureViews() {
        view.addSubview(pizzaLabel)
        view.addSubview(sushiLabel)
        view.addSubview(blackLineImageView)
        view.addSubview(pizzaImageView)
        view.addSubview(sushiImageView)

    }
    
    private func settingsView() {
        navigationItem.title = "Food"
        navigationItem.hidesBackButton = true
    }
    
    @objc private func imageTappedAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let pizzaViewController = PizzaViewController()
        pizzaViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(pizzaViewController, animated: true)
    }
}

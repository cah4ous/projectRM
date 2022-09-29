//
//  FoodViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 28.09.2022.
//

import UIKit
/// Экран food, позволяет выбрать нужное блюдо
class FoodViewController: UIViewController {

    let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        settingsView()
        createTableView()
    }
    
    func createTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.register(PizzaTableViewCell.self, forCellReuseIdentifier: "PizzaTableViewCell")
        tableView.register(SushiTableViewCell.self, forCellReuseIdentifier: "SushiTableViewCell")

    }
    
    func settingsView() {
        navigationItem.title = "Food"
        navigationItem.hidesBackButton = true
    }

    @objc func saveAction() {
    
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0, 0] {
            let pizzaViewController = PizzaViewController()
             navigationController?.pushViewController(pizzaViewController, animated: true)

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaTableViewCell")
        else { return UITableViewCell() }
        
        switch indexPath {
        case [0, 0]: cell.imageView?.image = UIImage(named: "pizza.jpeg")
            cell.textLabel?.text = "Пицца"
        case [0, 1]: cell.imageView?.image = UIImage(named: "sushi.png")
            cell.textLabel?.text = "Суши"
            cell.selectionStyle = .none
        default:
            break
        }

        return cell
        
    }
}

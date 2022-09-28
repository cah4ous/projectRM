//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 26.09.2022.
//

import UIKit
/// Экран, который отвечает за выдачу чека о покупке пользователю
class CheckViewController: UIViewController {

    var createInfoLabel = UILabel()
    var infoText = "nil"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createPriceLabel()
    }
    
    func createPriceLabel() {
        createInfoLabel.text = infoText
        createInfoLabel.font = .boldSystemFont(ofSize: 20)
        createInfoLabel.numberOfLines = 0
        createInfoLabel.textAlignment = .center
        createInfoLabel.frame = CGRect(x: 50, y: 100, width: 320, height: 100)
        
        view.addSubview(createInfoLabel)
    }
}

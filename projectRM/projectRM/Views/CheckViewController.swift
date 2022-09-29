//
//  CheckViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 26.09.2022.
//

import UIKit
/// Экран, который отвечает за выдачу чека о покупке пользователю
class CheckViewController: UIViewController {

    var infoLabel = UILabel()
    var infoText = "nil"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createPriceLabel()
        createButtonShare()
    }
    
    func createPriceLabel() {
        infoLabel.text = infoText
        infoLabel.font = .boldSystemFont(ofSize: 20)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.frame = CGRect(x: 50, y: 100, width: 320, height: 100)
        
        view.addSubview(infoLabel)
    }
    
    func createButtonShare() {
        let buttonShare = UIButton()

        buttonShare.layer.cornerRadius = 5
        buttonShare.backgroundColor = .blue
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        
        buttonShare.frame = CGRect(x: 50, y: 480, width: 300, height: 75)

        view.addSubview(buttonShare)

    }

    @objc func shareAction() {
        let items = [infoLabel.text ?? "nil"]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}

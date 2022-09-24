//
//  BirthdayViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 24.09.2022.
//

import UIKit
/// BirthdayViewController
class BirthdayViewController: UIViewController {
    
    let nameLabel = UILabel()
    let dayOfBirthdayLabel = UILabel()
    let profileImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        settingsView()
        createNameLabel()
        createProfileImageView()
        createdayOfBirthdayLabel()
    }
    
    func createdayOfBirthdayLabel() {
        dayOfBirthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfBirthdayLabel.textColor = .lightGray
        dayOfBirthdayLabel.text = "10 марта, в среду исполнится 25 лет"
        self.view.addSubview(dayOfBirthdayLabel)
        
        dayOfBirthdayLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 45).isActive = true
        dayOfBirthdayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        dayOfBirthdayLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dayOfBirthdayLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func createProfileImageView() {
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .lightGray
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(profileImageView)
        
        profileImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 45).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func createNameLabel() {
        self.nameLabel.text = "John"
        self.nameLabel.font = .boldSystemFont(ofSize: 30)
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func settingsView() {
        self.navigationItem.title = "Birthday"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                                 target: self,
                                                                 action: #selector(actionAdd))
    }
    
    @objc func actionAdd() {
        let addPersonbirthdayViewController = AddPersonBirthdayViewController()
        navigationController?.pushViewController(addPersonbirthdayViewController, animated: true)
    }
}

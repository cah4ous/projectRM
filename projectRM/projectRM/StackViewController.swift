//
//  StackViewViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 17.10.2022.
//

import UIKit

/// Экран светофора, настроенного через Stack View
 final class StackViewController: UIViewController {

     // MARK: - Private visual components
     private let redView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .red
         
         return view
     }()

     private let yellowView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .yellow
         
         return view
     }()

     private let greenView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .green
         
         return view
     }()

     private lazy var colorStackView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
         stackView.spacing = 10
         stackView.backgroundColor = .black
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .vertical
         stackView.distribution = .fillEqually
         stackView.layoutMargins = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0  )
         stackView.isLayoutMarginsRelativeArrangement = true
         
         return stackView
     }()

     // MARK: - Lifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         initMethods()
     }
     
     // MARK: - Private methods
     private func initMethods() {
         settingsView()
         setConstraintsToStackView()
     }
     
     private func settingsView() {
         view.addSubview(colorStackView)
         view.backgroundColor = .white
     }
     
     private func setConstraintsToStackView() {
         colorStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
         colorStackView.widthAnchor.constraint(equalTo: colorStackView.heightAnchor, multiplier: 1 / 3).isActive = true
         colorStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         colorStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
     }

 }

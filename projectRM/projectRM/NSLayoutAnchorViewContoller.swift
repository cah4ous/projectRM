//
//  NSLayoutAnchorViewContoller.swift
//  projectRM
//
//  Created by Александр Троицкий on 17.10.2022.
//

import UIKit

/// Экран свертофора, настроенного через NSLayoutAnchor
 final class NSLayoutAnchorViewController: UIViewController {

     // MARK: - Private visual components
     private let blackView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .black
         
         return view
     }()

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

     // MARK: - Lifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         initMethods()
     }

     // MARK: - Private methods
     private func initMethods() {
         settingsView()
         setAllConstraints()
     }
     
     private func settingsView() {
         view.addSubview(blackView)
         view.addSubview(redView)
         view.addSubview(yellowView)
         view.addSubview(greenView)
         
         view.backgroundColor = .white
     }

     private func createYellowViewAnchor() {
         yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23).isActive = true
         yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
     }

     private func createRedViewAnchor() {
         redView.centerYAnchor.anchorWithOffset(
             to: yellowView.centerYAnchor).constraint(
                 equalTo: yellowView.heightAnchor,
                 multiplier: 1.1).isActive = true
         redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
         redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
     }

     private func createGreenViewAnchor() {
         greenView.centerYAnchor.anchorWithOffset(
             to: yellowView.centerYAnchor).constraint(
                 equalTo: yellowView.heightAnchor,
                 multiplier: -1.1).isActive = true
         greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
         greenView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
     }

     private func createBlackViewAnchor() {
         blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         blackView.widthAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 1.1).isActive = true
         blackView.heightAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 3).isActive = true
     }
     
     private func setAllConstraints() {
         createYellowViewAnchor()
         createRedViewAnchor()
         createGreenViewAnchor()
         createBlackViewAnchor()
     }
 }

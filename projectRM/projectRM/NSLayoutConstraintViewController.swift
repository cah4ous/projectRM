//
//  NSLayoutConstraintViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 17.10.2022.
//

import UIKit

/// Экран со светофором, настроенным через NSLayoutConstraint
 final class NSLayoutConstraintViewController: UIViewController {

     // MARK: Private property
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
         view.addSubview(yellowView)
         view.addSubview(redView)
         view.addSubview(greenView)
         
         view.backgroundColor = .white
     }

     private func createYellowViewConstraint() {
         NSLayoutConstraint(item: yellowView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: yellowView,
                            attribute: .centerY,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerY,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: yellowView,
                            attribute: .width,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .height,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: yellowView,
                            attribute: .height,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .height,
                            multiplier: 0.23,
                            constant: 0).isActive = true
     }

     private func createRedViewConstraint() {
         NSLayoutConstraint(item: redView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: redView,
                            attribute: .centerY,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerY,
                            multiplier: 0.5,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: redView,
                            attribute: .width,
                            relatedBy: .equal,
                            toItem: redView,
                            attribute: .height,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: redView,
                            attribute: .height,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .height,
                            multiplier: 1,
                            constant: 0).isActive = true
     }

     private func createGreenViewConstraint() {
         NSLayoutConstraint(item: greenView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: greenView,
                            attribute: .centerY,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerY,
                            multiplier: 1.5,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: greenView,
                            attribute: .width,
                            relatedBy: .equal,
                            toItem: greenView,
                            attribute: .height,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: greenView,
                            attribute: .height,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .height,
                            multiplier: 1,
                            constant: 0).isActive = true
     }

     private func createBlackViewConstraint() {
         NSLayoutConstraint(item: blackView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: blackView,
                            attribute: .centerY,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .centerY,
                            multiplier: 1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: blackView,
                            attribute: .width,
                            relatedBy: .equal,
                            toItem: yellowView,
                            attribute: .width,
                            multiplier: 1.1,
                            constant: 0).isActive = true
         NSLayoutConstraint(item: blackView,
                            attribute: .height,
                            relatedBy: .equal,
                            toItem: blackView,
                            attribute: .width,
                            multiplier: 3,
                            constant: 0).isActive = true
     }

     private func setAllConstraints() {
         createBlackViewConstraint()
         createRedViewConstraint()
         createYellowViewConstraint()
         createGreenViewConstraint()
     }
 }

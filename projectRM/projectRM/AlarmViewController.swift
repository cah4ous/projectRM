//
//  AlarmViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 03.10.2022.
//

import UIKit
/// Этот экран отвечает за будильник
class AlarmViewController: UIViewController {
    @IBOutlet var settingsButton: UIButton! {
        didSet {
            settingsButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

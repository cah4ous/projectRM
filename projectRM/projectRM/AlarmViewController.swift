//
//  AlarmViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 03.10.2022.
//

import UIKit
/// Этот экран отвечает за будильник
final class AlarmViewController: UIViewController {
    
    // MARK: - Private IBOutlet
    @IBOutlet private var settingsButton: UIButton! {
        didSet {
            settingsButton.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

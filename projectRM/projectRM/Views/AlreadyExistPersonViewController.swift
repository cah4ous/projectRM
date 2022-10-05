//
//  AlreadyExistPersonViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 04.10.2022.
//

import UIKit
/// Экран, который хз че делает
final class AlreadyExistPersonViewController: UIViewController {

    // MARK: - Private IBOutlet
    @IBOutlet private var buttonSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet private var sliderOutlet: UISlider!
    @IBOutlet private var labelOutlet: UILabel!
    @IBOutlet private var switchOutlet: UISwitch!
    @IBOutlet private var textFieldOutlet: UITextField!
    @IBOutlet private var progressOutlet: UIProgressView!
    @IBOutlet private var buttonLabelOutlet: UIButton!
    @IBOutlet private var buttonSwitchOutlet: UIButton!
    @IBOutlet private var buttonTextFieldOutlet: UIButton!
    @IBOutlet private var buttonProgressOutlet: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSegmentedControlOutlet.addTarget(self, action: #selector(buttonSegmentedControlAction),
                                               for: .valueChanged
        )
        buttonLabelOutlet.addTarget(self, action: #selector(buttonLabelAction), for: .touchUpInside)
        buttonSwitchOutlet.addTarget(self, action: #selector(buttonSwitchAction), for: .touchUpInside)
        buttonTextFieldOutlet.addTarget(self, action: #selector(buttonTextFieldAction), for: .touchUpInside)
        buttonProgressOutlet.addTarget(self, action: #selector(buttonProgressAction), for: .touchUpInside)
        sliderOutlet.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
    }
    
    // MARK: - Private IBAction
    @objc private func sliderAction() {
        buttonSegmentedControlOutlet.frame = CGRect(x: 20.0, y: 777.0, width: Double(sliderOutlet.value), height: 32.0)
    }
    
    @objc private func buttonLabelAction() {
        if labelOutlet.isHidden {
            labelOutlet.isHidden = false
        } else {
            labelOutlet.isHidden = true
        }
    }
    
    @objc private func buttonSwitchAction() {
        if switchOutlet.isHidden {
            switchOutlet.isHidden = false
        } else {
            switchOutlet.isHidden = true
        }
    }
    
    @objc private func buttonTextFieldAction() {
        if textFieldOutlet.isHidden {
            textFieldOutlet.isHidden = false
        } else {
            textFieldOutlet.isHidden = true
        }
    }
    
    @objc private func buttonProgressAction() {
        if progressOutlet.isHidden {
            progressOutlet.isHidden = false
        } else {
            progressOutlet.isHidden = true
        }
    }
    
    @objc private func buttonSegmentedControlAction() {
        switch buttonSegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            buttonSwitchOutlet.isHidden = true
            buttonProgressOutlet.isHidden = true
            buttonTextFieldOutlet.isHidden = true
        case 1:
            buttonSwitchOutlet.isHidden = false
            buttonProgressOutlet.isHidden = true
            buttonTextFieldOutlet.isHidden = true
        case 2:
            buttonSwitchOutlet.isHidden = false
            buttonProgressOutlet.isHidden = false
            buttonTextFieldOutlet.isHidden = true
        case 3:
            buttonSwitchOutlet.isHidden = false
            buttonProgressOutlet.isHidden = false
            buttonTextFieldOutlet.isHidden = false
        default:
            break
        }
    }

}

//
//  AlreadyExistPersonViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 04.10.2022.
//

import UIKit
/// Экран антистресс
final class AlreadyExistPersonViewController: UIViewController {

    // MARK: - Private IBOutlet
    @IBOutlet private var buttonSegmentedControl: UISegmentedControl!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var label: UILabel!
    @IBOutlet private var newSwitch: UISwitch!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var progress: UIProgressView!
    @IBOutlet private var buttonLabel: UIButton!
    @IBOutlet private var buttonSwitch: UIButton!
    @IBOutlet private var buttonTextField: UIButton!
    @IBOutlet private var buttonProgress: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    // MARK: - Private IBAction
    @objc private func sliderAction() {
        buttonSegmentedControl.frame = CGRect(x: 20.0, y: 777.0, width: Double(slider.value), height: 32.0)
    }
    
    @objc private func buttonLabelAction() {
        label.isHidden = !label.isHidden
    }
    
    @objc private func buttonSwitchAction() {
        newSwitch.isHidden = !newSwitch.isHidden
    }
    
    @objc private func buttonTextFieldAction() {
        textField.isHidden = !textField.isHidden
    }
    
    @objc private func buttonProgressAction() {
        progress.isHidden = !progress.isHidden
    }
    
    @objc private func buttonSegmentedControlAction() {
        switch buttonSegmentedControl.selectedSegmentIndex {
        case 0:
            buttonSwitch.isHidden = true
            buttonProgress.isHidden = true
            buttonTextField.isHidden = true
        case 1:
            buttonSwitch.isHidden = false
            buttonProgress.isHidden = true
            buttonTextField.isHidden = true
        case 2:
            buttonSwitch.isHidden = false
            buttonProgress.isHidden = false
            buttonTextField.isHidden = true
        case 3:
            buttonSwitch.isHidden = false
            buttonProgress.isHidden = false
            buttonTextField.isHidden = false
        default:
            break
        }
    }
    
    // MARK: Private Methods
    private func initMethods() {
        addTargetToViews()
    }
    
    private func addTargetToViews() {
        buttonSegmentedControl.addTarget(self, action: #selector(buttonSegmentedControlAction),
                                               for: .valueChanged
        )
        buttonLabel.addTarget(self, action: #selector(buttonLabelAction), for: .touchUpInside)
        buttonSwitch.addTarget(self, action: #selector(buttonSwitchAction), for: .touchUpInside)
        buttonTextField.addTarget(self, action: #selector(buttonTextFieldAction), for: .touchUpInside)
        buttonProgress.addTarget(self, action: #selector(buttonProgressAction), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
    }
}

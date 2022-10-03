//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// Экран, который отвечает за функционал всего приложения
final class TextRedactorViewController: UIViewController {
    
    // MARK: - Private Visual Components
    private lazy var selectLinesLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 600, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Выберите количество строк"
        
        return label
    }()
    
    private lazy var fontTextLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 400, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Выберите размер шрифта"
        
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 50, width: 300, height: 250)
        
        return label
    }()
    
    private lazy var shadowLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 150, y: 700, width: 120, height: 75)
        label.text = "Тень"
        label.shadowColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var shadowSwitch: UISwitch = {
        var shadSwitch = UISwitch()
        shadSwitch.frame = CGRect(x: 280, y: 720, width: 0, height: 0)
        shadSwitch.addTarget(self, action: #selector(shadowSwitchAction), for: .valueChanged)
        
        return shadSwitch
    }()
    
    private lazy var fontSlider: UISlider = {
        var slider = UISlider()
        slider.frame = CGRect(x: 50, y: 330, width: 300, height: 50)
        slider.minimumValue = 1.0
        slider.maximumValue = 100.0
        slider.setValue(17.0, animated: true)
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        
        return slider
    }()
    
    private lazy var linesPickerView: UIPickerView = {
        var pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 230, y: 600, width: 170, height: 100)
        
        pickerView.tag = 0
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
    }()
    
    private lazy var colorPickerView: UIPickerView = {
        var pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 230, y: 400, width: 170, height: 100)
        
        pickerView.tag = 1
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()

    }
    // MARK: - Private IBAction
    private func initMethods() {
        configureViews()
        settingsView()
    }
    
    @objc private func sliderAction() {
        textLabel.font = .systemFont(ofSize: CGFloat(fontSlider.value))
    }
    
    @objc private func shadowSwitchAction() {
        if shadowSwitch.isOn {
            textLabel.shadowColor = .black
            textLabel.shadowOffset = CGSize(width: 1, height: 1)
        } else {
            textLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @objc private func addAction() {
        let alertController = UIAlertController(title: "Введите текст в label.",
                                                 message: "",
                                                 preferredStyle: .alert)
         alertController.addTextField()

         let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
             guard let text = alertController.textFields?.first else { return }
             self.textLabel.text = text.text
         }

         alertController.addAction(actionAlert)

         present(alertController, animated: true)
    }
    
    // MARK: - Private Methods
    private func configureViews() {
        view.addSubview(selectLinesLabel)
        view.addSubview(shadowLabel)
        view.addSubview(shadowSwitch)
        view.addSubview(colorPickerView)
        view.addSubview(fontSlider)
        view.addSubview(linesPickerView)
        view.addSubview(textLabel)
        view.addSubview(colorPickerView)
        view.addSubview(fontTextLabel)
      }

    private func settingsView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(addAction))
        tabBarItem = UITabBarItem(title: "Pencil", image: UIImage(systemName: "pencil"), tag: 0)
        
    }
    
}

// PickerViewDelegate & PickerViewDataSource

extension TextRedactorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return 20
        case 1:
            return 3
        default:
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            switch row {
            case 0:
                return "Черный"
            case 1:
                return "Зеленый"
            case 2:
                return "Красный"
            default:
                return ""
            }
        } else {
            return "\(row)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            textLabel.numberOfLines = row
        case 1:
            switch row {
            case 0:
                textLabel.textColor = .black
            case 1:
                textLabel.textColor = .green
            case 2:
                textLabel.textColor = .red
            default:
                break
            }
        default:
            break
        }
    }
}

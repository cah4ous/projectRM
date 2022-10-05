//
//  RepeatCodeViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// Экран отвечает за чтение какого-то текста и его настройку
final class ReadBookViewController: UIViewController {
    
    // MARK: - Private Visual Components
    public lazy var readingTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 20, y: 100, width: 370,
                                height: 250
        )
        textView.text = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)
        
        return textView
    }()
    
    private lazy var fontTextLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 420, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Размер шрифта"
        
        return label
     }()
    
    private lazy var nightShiftLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 220, y: 650, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Ночной режим"
        
        return label
     }()
    
    private lazy var nightShiftSwitch: UISwitch = {
        var nightSwitch = UISwitch()
        nightSwitch.frame = CGRect(x: 250, y: 720, width: 0, height: 0)
        nightSwitch.addTarget(self, action: #selector(nightSwitchAction), for: .valueChanged)
        
        return nightSwitch
     }()
    
    private lazy var colorCharLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 490, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Цвет букв"

        return label
     }()
    
    private lazy var thicknessLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 560, width: 200, height: 75)
        label.numberOfLines = 0
        label.text = "Толщина букв"

        return label
     }()
    
    private lazy var lowButton: UIButton = {
        var button = UIButton()
        button.setTitle("a", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 160, y: 575, width: 40, height: 40)
        button.layer.borderWidth = 1.0
        
        button.addTarget(self, action: #selector(lowButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var highButton: UIButton = {
        var button = UIButton()
        button.setTitle("A", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 220, y: 575, width: 40, height: 40)
        button.layer.borderWidth = 1.0
        
        button.addTarget(self, action: #selector(highButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var redButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 160, y: 500, width: 40, height: 40)
        button.layer.cornerRadius = 15
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(redButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var greenButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 220, y: 500, width: 40, height: 40)
        button.layer.cornerRadius = 15
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(greenButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var blackButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 280, y: 500, width: 40, height: 40)
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(blackButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var blueButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 340, y: 500, width: 40, height: 40)
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(blueButtonAction), for: .touchUpInside)

        return button
     }()
    
    private lazy var fontSlider: UISlider = {
          var slider = UISlider()
          slider.frame = CGRect(x: 230, y: 430, width: 150, height: 50)
          slider.minimumValue = 1.0
          slider.maximumValue = 100.0
          slider.setValue(17.0, animated: true)
          slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)

          return slider
      }()
    
    private lazy var fontPickerView: UIPickerView = {
        var pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 20, y: 620, width: 150, height: 123)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        return pickerView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()

    }
    
    // MARK: - Private IBAction
    @objc private func redButtonAction() {
        readingTextView.textColor = .red
    }
    
    @objc private func greenButtonAction() {
        readingTextView.textColor = .green
    }
    
    @objc private func blackButtonAction() {
        readingTextView.textColor = .black
    }
    
    @objc private func blueButtonAction() {
        readingTextView.textColor = .blue
    }
    
    @objc private func sliderAction() {
          readingTextView.font = .systemFont(ofSize: CGFloat(fontSlider.value))
      }
    
    @objc private func lowButtonAction() {
        readingTextView.font = readingTextView.font
    }
    
    @objc private func highButtonAction() {
        readingTextView.font = .boldSystemFont(ofSize: CGFloat(fontSlider.value))
    }
    
    @objc private func nightSwitchAction() {
        if nightShiftSwitch.isOn {
            readingTextView.backgroundColor = .lightGray
        } else {
            readingTextView.backgroundColor = .white
        }
    }
    
    // MARK: - Private Methods
    private func initMethods() {
        configureViews()
    }
    private func configureViews() {
        view.backgroundColor = .white
        view.addSubview(readingTextView)
        view.addSubview(fontSlider)
        view.addSubview(fontTextLabel)
        view.addSubview(redButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        view.addSubview(blackButton)
        view.addSubview(colorCharLabel)
        view.addSubview(thicknessLabel)
        view.addSubview(lowButton)
        view.addSubview(highButton)
        view.addSubview(fontPickerView)
        view.addSubview(nightShiftLabel)
        view.addSubview(nightShiftSwitch)
       }
}

/// UIPickerViewDelegate & UIPickerViewDataSource
extension ReadBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return 3
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         switch row {
         case 0:
             return "Helvetica"
         case 1:
             return "Kailasa"
         case 2:
             return "Kefa"
         default:
             return ""
         }
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch row {
         case 0:
             readingTextView.font = UIFont(name: "Helvetica", size: CGFloat(fontSlider.value))
         case 1:
             readingTextView.font = UIFont(name: "Kailasa", size: CGFloat(fontSlider.value))
         case 2:
             readingTextView.font = UIFont(name: "Kefa", size: CGFloat(fontSlider.value))
         default:
             break
         }
     }
 }

//
//  EquipmentViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 26.09.2022.
//

import UIKit
/// Экран,  который позволяет выбрать комплектацию телефона для покупки
class EquipmentViewController: UIViewController {

    var numberOfProduct = 0
    var valueColor = 0
    var valueMemory = 0
    var phoneNumber = "0"
    
    var phoneNameLabel = UILabel()
    var priceLabel = UILabel()
    var createButton = UIButton()
    var imageView = UIImageView()
    var colorTextField = UITextField()
    var memorySizeTextField = UITextField()
    var colorPickerView = UIPickerView()
    var memorySizePickerView = UIPickerView()
    
    var colorOfProduct = ["Белый", "Черный", "Зеленый", "Cиний"]
    var memorySizeProduct = ["128", "256", "512", "1024"]
    var phones = ["iPhone 14", "iPhone 12", "iPhone 13"]
    var mapPrice = [0: "100000", 1: "40000", 2: "60000"]
    var images = [UIImage(named: "iphoneOne.jpeg"),
                      UIImage(named: "iphoneTwo.jpeg"),
                      UIImage(named: "iphoneThree.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()
    }
    
    func initMethods() {
        createColorTextField()
        createUnderline(textField: colorTextField)
        createColorPickerView()
        createMemorySizePickerView()
        createMemorySizeTextField()
        createUnderline(textField: memorySizeTextField)
        createPriceLabel()
        createImageView()
        createAddButton()
        createPhoneLabel()
    }
    
    func createPhoneLabel() {
        phoneNameLabel.text = phones[numberOfProduct]
        phoneNameLabel.font = .boldSystemFont(ofSize: 30)
        phoneNameLabel.frame = CGRect(x: 125, y: 50, width: 200, height: 50)
        
        view.addSubview(phoneNameLabel)
    }
    
    func createImageView() {
        imageView.frame = CGRect(x: 100, y: 400, width: 200, height: 290)
        imageView.image = images[numberOfProduct]
        view.addSubview(imageView)
    }
    
    func createMemorySizePickerView() {
        memorySizePickerView.tag = 1
        
        memorySizePickerView.delegate = self
        memorySizePickerView.dataSource = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        
        memorySizeTextField.inputView = memorySizePickerView
        memorySizeTextField.inputAccessoryView = toolbar
    }
    
    func createColorPickerView() {
        colorPickerView.tag = 0
        
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        
        colorTextField.inputView = colorPickerView
        colorTextField.inputAccessoryView = toolbar
    }
    
    func createPriceLabel() {
        priceLabel.text = mapPrice[numberOfProduct]
        priceLabel.font = .boldSystemFont(ofSize: 20)
        priceLabel.frame = CGRect(x: 150, y: 100, width: 200, height: 50)
        
        view.addSubview(priceLabel)
    }
    
    func createMemorySizeTextField() {
        memorySizeTextField.placeholder = "Выберите объем памяти..."
        memorySizeTextField.textAlignment = .center
        memorySizeTextField.frame = CGRect(x: 50, y: 300, width: 300, height: 30)
        memorySizeTextField.addTarget(self, action: #selector(newMemorySizeAction), for: .allEditingEvents)
        view.addSubview(memorySizeTextField)
    }
    
    func goToCheckViewController() {
        let checkViewController = CheckViewController()
        checkViewController.infoText = "\(phoneNameLabel.text ?? "0"), personal price is \(priceLabel.text ?? "0")"
        navigationController?.pushViewController(checkViewController, animated: true)
    }
    
    func createColorTextField() {
        colorTextField.placeholder = "Выберите цвет..."
        colorTextField.textAlignment = .center
        colorTextField.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        colorTextField.addTarget(self, action: #selector(newColorAction), for: .allEditingEvents)
        view.addSubview(colorTextField)
    }
    
    func createUnderline(textField: UITextField) {
        let line = CALayer()
        line.frame = CGRect(x: 0, y: textField.frame.height + 15, width: 300, height: 2)
        line.backgroundColor = UIColor.lightGray.cgColor
        textField.layer.addSublayer(line)
    }
    
    @objc func createSocialMediaAlertAction() {
        let alertController = UIAlertController(title: "Введите номер телефона для связи...",
                                             message: "",
                                             preferredStyle: .alert)
        alertController.addTextField()

        let actionAlert = UIAlertAction(title: "Готово", style: .default) { _ in
            guard let text = alertController.textFields?.first else { return }
            self.phoneNumber = text.text ?? "0"
            self.goToCheckViewController()
        }

     alertController.addAction(actionAlert)

     present(alertController, animated: true)
 }
    
    @objc func newColorAction() {
        let color = colorTextField.text
        switch color {
        case "Белый": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 5000 + valueMemory)
            valueColor = 5000
        case "Черный": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 5000 + valueMemory)
            valueColor = 5000
        case "Зеленый": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 8000 + valueMemory)
            valueColor = 8000
        case "Cиний": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 7000 + valueMemory)
            valueColor = 7000
        default: break
        }
    }
    
    @objc func newMemorySizeAction() {
        let memory = memorySizeTextField.text
        switch memory {
        case "128": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 5000 + valueColor)
            valueMemory = 0
        case "256": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 5000 +  valueColor)
            valueMemory = 15000
        case "512": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 8000 + valueColor)
            valueMemory = 30000
        case "1024": priceLabel.text = String((Int(mapPrice[numberOfProduct] ?? "0") ?? 0) + 7000 + valueColor)
            valueMemory = 50000
        default: break
        }
    }
    
    @objc func doneAction() {
        view.endEditing(true)
    }
}

extension EquipmentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         switch pickerView.tag {
         case 0: return colorOfProduct.count
         case 1: return memorySizeProduct.count
         default: return 1
         }
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         switch pickerView.tag {
         case 0: return colorOfProduct[row]
         case 1: return memorySizeProduct[row]
         default: return "0"
         }
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch pickerView.tag {
         case 0: colorTextField.text = colorOfProduct[row]
         case 1: memorySizeTextField.text = memorySizeProduct[row]
         default: break
         }
         
     }
    
    func createAddButton() {
        createButton.setTitle("Купить", for: .normal)
        createButton.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        createButton.backgroundColor = .blue
        createButton.addTarget(self, action: #selector(createSocialMediaAlertAction), for: .touchUpInside)
        view.addSubview(createButton)
    }
    
 }

//
//  AddBirthdayPersonViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 24.09.2022.
//

import UIKit
/// AddPersonBirthdayViewController
class AddPersonBirthdayViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let nameTextField = UITextField()
    let dateTextField = UITextField()
    let ageTextField = UITextField()
    let genderTextField = UITextField()
    let socialMediaTextField = UITextField()
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    
    let gender = ["Мужской", "Женский"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initMethods()

    }
    
    func initMethods() {
        createNameTextField()
        createDatePickerTextField()
        createAgePickerTextField()
        createGenderTextField()
        createPicker()
        createSocialMediaTextField()
        createProfileImageView()
        settingsView()
    }
    
    func createProfileImageView() {
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .lightGray
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(profileImageView)
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func createSocialMediaTextField() {
        socialMediaTextField.placeholder = "Введите никнейм от инст..."
        socialMediaTextField.layer.cornerRadius = 2
        socialMediaTextField.layer.borderColor = UIColor.lightGray.cgColor
        socialMediaTextField.layer.borderWidth = 1
        socialMediaTextField.contentHorizontalAlignment = .center
        socialMediaTextField.textAlignment = .center
        
        socialMediaTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(socialMediaTextField)
        
        socialMediaTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        socialMediaTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        socialMediaTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        socialMediaTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive = true
        
        socialMediaTextField.addTarget(self, action: #selector(createSocialMediaAlert), for: .allEditingEvents)
    }
    
    @objc func createSocialMediaAlert() {
        let alertController = UIAlertController(title: "Введите никнейм...",
                                                message: "",
                                                preferredStyle: .alert)
        alertController.addTextField()
        
        let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alertController.textFields?.first else { return }
            text.placeholder = "Сыр"
            self.socialMediaTextField.text = text.text
        }
        
        alertController.addAction(actionAlert)
        
        present(alertController, animated: true)
    }
    
    func createNameTextField() {
        nameTextField.placeholder = "Введите имя..."
        nameTextField.layer.cornerRadius = 2
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.contentHorizontalAlignment = .center
        nameTextField.textAlignment = .center
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(nameTextField)
        
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
    }
    
    func createDatePickerTextField() {
        dateTextField.placeholder = "Введите дату..."
        dateTextField.layer.cornerRadius = 2
        dateTextField.layer.borderColor = UIColor.lightGray.cgColor
        dateTextField.layer.borderWidth = 1
        dateTextField.contentHorizontalAlignment = .center
        dateTextField.textAlignment = .center
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(dateTextField)
        
        dateTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90).isActive = true
        
        createDatePicker()
    }
    
    func createAgePickerTextField() {
        ageTextField.placeholder = "Введите возраст..."
        ageTextField.layer.cornerRadius = 2
        ageTextField.layer.borderColor = UIColor.lightGray.cgColor
        ageTextField.layer.borderWidth = 1
        ageTextField.contentHorizontalAlignment = .center
        ageTextField.textAlignment = .center
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(ageTextField)
        
        ageTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ageTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
    }
    
    func createGenderTextField() {
        genderTextField.placeholder = "Введите пол..."
        genderTextField.layer.cornerRadius = 2
        genderTextField.layer.borderColor = UIColor.lightGray.cgColor
        genderTextField.layer.borderWidth = 1
        genderTextField.contentHorizontalAlignment = .center
        genderTextField.textAlignment = .center
        
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(genderTextField)
        
        genderTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        genderTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genderTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
    }
    
    func createPicker() {
        agePicker.tag = 1
        genderPicker.tag = 2
        
        agePicker.dataSource = self
        agePicker.delegate = self
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(donePickerAction))
        toolbar.setItems([doneButton], animated: true)
        
        ageTextField.inputView = agePicker
        genderTextField.inputView = genderPicker
        
        ageTextField.inputAccessoryView = toolbar
        genderTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func donePickerAction() {
        view.endEditing(true)
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .init(identifier: "Russian")
        datePicker.datePickerMode = .date
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneDatePickerAction))
        toolBar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
        
    }
    
    @objc func doneDatePickerAction() {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        format.locale = .init(identifier: "Russian")
        
        dateTextField.text = format.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
}

extension AddPersonBirthdayViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return 100
        case 2: return gender.count
        default: return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return "\(row)"
        case 2: return "\(gender[row])"
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1: ageTextField.text = "\(row)"
        case 2: genderTextField.text = "\(gender[row])"
        default: break
        }
    }
    
    func settingsView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                                 target: self,
                                                                 action: #selector(actionSave))
    }
    
    @objc func actionSave() {
        let birthdayViewController = BirthdayViewController()
        navigationController?.pushViewController(birthdayViewController, animated: true)
    }
}

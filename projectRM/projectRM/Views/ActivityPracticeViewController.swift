//
//  ActivityPracticeViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 28.09.2022.
//

import UIKit
/// Практика по активити вью контроллеру
class ActivityPracticeViewController: UIViewController {
    
    @IBOutlet var testImageView: UIImageView!
    @IBOutlet var textFieldOutlet: UITextField!
    
    var testPickerView = UIPickerView()
    var testPickerArray = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    func initMethods() {
        textFieldOutlet.addTarget(self, action: #selector(textFieldAction), for: .editingDidBegin)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:))
        )
        testImageView.isUserInteractionEnabled = true
        testImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func textFieldAction(_ sender: Any) {
        testPickerView.delegate = self
        testPickerView.dataSource = self

         let toolbar = UIToolbar()
         toolbar.sizeToFit()

         let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
         toolbar.setItems([doneButton], animated: true)

         textFieldOutlet.inputView = testPickerView
         textFieldOutlet.inputAccessoryView = toolbar
    }
    
    @objc func doneAction() {
         view.endEditing(true)
     }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let items = [URL(string: "https://www.youtube.com/watch?v=4LfJnj66HVQ")]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    @IBAction func faceBookAction(_ sender: Any) {
        let items = [URL(string: "https://www.facebook.com")]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    @IBAction func firstPracticeButtonTest(_ sender: Any) {
        let items = [URL(string: "https://www.youtube.com/watch?v=4LfJnj66HVQ")]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}

extension ActivityPracticeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }

      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return 3
      }

      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return testPickerArray[row]
      }

      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          if row == 2 {
              let items = [URL(string: "https://www.youtube.com/watch?v=4LfJnj66HVQ")]
              let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
              present(activityViewController, animated: true)
          } else {
              textFieldOutlet.text = "\(row + 1)"
          }
      }
  }

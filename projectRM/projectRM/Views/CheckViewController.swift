//
//  SecondViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import UIKit
/// CheckViewController
class CheckViewController: UIViewController {

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var countGuestLabel: UITextField!
    @IBOutlet var numberOfTableLable: UITextField!
    @IBOutlet var bookTable: UISwitch!
    @IBOutlet var prepaymentSwitch: UISwitch!
    @IBOutlet var vipPlaceSwitch: UISwitch!
    
    var bookGuests = BookGuest(name: "alex",
                               countGuest: "2",
                               numberOfTable: "4",
                               bookTable: true,
                               prepayment: true,
                               vipPlace: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func checkAlert() {
        
        let alert = UIAlertController(title: "Чек", message: "Выставить счет", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.bookGuests.addGuest(name: self.nameLabel.text ?? "alex",
                                countGuest: self.countGuestLabel.text ?? "4",
                                numberOfTable: self.numberOfTableLable.text ?? "4",
                                bookTable: self.bookTable.isOn,
                                prepayment: self.prepaymentSwitch.isOn,
                                vipPlace: self.vipPlaceSwitch.isOn)
            print(self.bookGuests.getInfoGuest())
            self.performSegue(withIdentifier: "thirdVC", sender: nil)
        })
        alert.addAction(UIAlertAction(title: "No", style: .default) { _ in
            print("Nothing")
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func bookCheck(_ sender: Any) {
        checkAlert()
    }
}

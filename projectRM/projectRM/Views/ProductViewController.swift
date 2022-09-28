//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// Экран, который позволяет выбрать себе модель телефона через сегмент контрол для покупки и перехода на экран дополнительных условий покупки
class ProductViewController: UIViewController {

    var nameOfProductLabel = UILabel()
    var segmentControl = UISegmentedControl()
    var menuArray = ["iPhone 14", "iPhone 12", "iPhone 13"]
    var imageView = UIImageView()
    var selectButton = UIButton()
    
    var imageArray = [UIImage(named: "iphoneOne.jpeg"),
                      UIImage(named: "iphoneTwo.jpeg"),
                      UIImage(named: "iphoneThree.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initMethods()

    }
    
    func initMethods() {
        createImageView()
        createSegmentControl()
        createSelectButton()
        createNameOfProduct()
    }
    
    func createNameOfProduct() {
        nameOfProductLabel.text = menuArray[0]
        nameOfProductLabel.font = .boldSystemFont(ofSize: 30)
        nameOfProductLabel.frame = CGRect(x: 130, y: 150, width: 200, height: 80)
        
        view.addSubview(nameOfProductLabel)
    }
    
    func createSelectButton() {
        selectButton.frame = CGRect(x: 100, y: 670, width: 200, height: 50)
        selectButton.layer.cornerRadius = 5
        selectButton.backgroundColor = .blue
        selectButton.setTitle("Выбрать", for: .normal)
        selectButton.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
        view.addSubview(selectButton)
    }
    
    func createImageView() {
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = self.view.center
        imageView.image = imageArray[0]
        view.addSubview(imageView)
    }
    
    func createSegmentControl() {
        segmentControl.selectedSegmentIndex = 0
        segmentControl = UISegmentedControl(items: menuArray)
        segmentControl.frame = CGRect(x: 50, y: 600, width: 300, height: 30)
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = imageArray[segmentIndex]
            nameOfProductLabel.text = menuArray[segmentIndex]
            _ = target.titleForSegment(at: segmentIndex)
            
        }
    }
    
    @objc func selectButtonAction() {
        let equipmentViewController = EquipmentViewController()
        equipmentViewController.numberOfProduct = segmentControl.selectedSegmentIndex
        navigationController?.pushViewController(equipmentViewController, animated: true)
    }
    
}

//
//  TimerViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 03.10.2022.
//

import UIKit
/// Экран, который отвечает за секундомер
class TimerViewController: UIViewController {
    
    @IBOutlet var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var cancelButton: UIButton! {
        didSet {
            cancelButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var labelTime: UILabel!
    
    private lazy var timePicker: UIPickerView = {
        var pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        pickerView.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
        
        return pickerView
    }()
    
    var hour = 0
    var minutes = 0
    var seconds = 0
    var second = 0
    var timer = Timer()
    var isTimeRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        
    }
    
    @IBAction private func startButtonAction(_ sender: Any) {
        if isTimeRunning == false {
            minutes = timePicker.selectedRow(inComponent: 1)
            hour = timePicker.selectedRow(inComponent: 0)
            second = timePicker.selectedRow(inComponent: 2)
            
            seconds = second + minutes * 60 + hour * 3600
            
            timePicker.isHidden = true
            labelTime.isHidden = false
            
            runTimer()
         }
    }

    @IBAction private func cancelButtonAction(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        labelTime.text = timeString(time: TimeInterval(seconds))
        
        isTimeRunning = false
        timePicker.isHidden = false
        labelTime.isHidden = true
    }
    
    private func initSettings() {
        labelTime.isHidden = true
        view.addSubview(timePicker)
    }
    
    private func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                      selector: #selector(updateTimer),
                                      userInfo: nil,
                                      repeats: true)
    }
    
    private func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @objc private func updateTimer() {
        if seconds < 1 {
             timer.invalidate()
        } else {
             seconds -= 1
             labelTime.text = timeString(time: TimeInterval(seconds))
        }
    }
    
}

/// UIPickerDelegate, UIPickerViewDataSource

extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Minute"
        case 2:
            return "\(row) Second"
        default:
            return ""
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
    }
    
}

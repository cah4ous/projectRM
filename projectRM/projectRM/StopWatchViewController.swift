//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//

import UIKit
/// Экран, который отвечает за секундомер
final class StopWatchViewController: UIViewController {
    private enum Constants {
        static var isStart = false
        static var timer = Timer()
        static var seconds = 0
        
        static let start = "Start"
        static let pause = "Pause"
        static let format = "%02i:%02i:%02i"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var timeLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Private IBAction
    @IBAction private func startAndPauseButtonAction(_ sender: Any) {
        if Constants.isStart {
            startButton.setTitle(Constants.start, for: .normal)
            Constants.isStart = false
            runTimer()
            
        } else {
            startButton.setTitle(Constants.pause, for: .normal)
            Constants.isStart = true
            Constants.timer.invalidate()
        }
    }
    
    @IBAction private func cancelButtonAction(_ sender: Any) {
        Constants.isStart = true
        Constants.timer.invalidate()
        Constants.seconds = 0
        startButton.setTitle(Constants.start, for: .normal)
        
    }
    
    // MARK: - Private Methods
    @objc private func updateTimer() {
         Constants.seconds += 1
         timeLabel.text = timeString(time: TimeInterval(Constants.seconds))
    }
    
    private func runTimer() {
        Constants.timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                       selector: #selector(updateTimer),
                                       userInfo: nil,
                                       repeats: true)
     }
    
    private func timeString(time: TimeInterval) -> String {
         let hours = Int(time) / 3600
         let minutes = Int(time) / 60 % 60
         let seconds = Int(time) % 60
        return String(format: Constants.format, hours, minutes, seconds)
     }
    
}

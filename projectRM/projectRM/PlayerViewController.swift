//
//  ViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 21.09.2022.
//
import AVFoundation
import UIKit
/// PlayerViewController
class PlayerViewController: UIViewController {
    
    @IBOutlet var timeStartLabel: UILabel!
    @IBOutlet var timeEndLabel: UILabel!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playerSlider: UISlider!
    @IBOutlet var songImageView: UIImageView!
    @IBOutlet var nameOfSongLabel: UILabel!
    @IBOutlet var endOfSongLabel: UILabel!
    @IBOutlet var playAndStopButton: UIButton!
    
    var player = AVAudioPlayer()
    var timer: Timer?
    var numberOfSong = 0
    
    var arraySongs = ["Трактор", "Gucci Gang"]

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSettings()
    }
    
    func defaultSettings() {
        playerSlider.minimumValue = 0.0
        playerSlider.maximumValue = 100.0
        
        volumeSlider.minimumValue = 0.0
        volumeSlider.maximumValue = 100.0
        
        createAudioPlayer(nameOfSong: arraySongs[numberOfSong])
        
        playerSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    @IBAction func volumeSliderAction(_ sender: Any) {
        self.player.volume = volumeSlider.value
    }
    
    @objc func updateTime() {
        self.playerSlider.value = Float(player.currentTime)
        
        let time = player.currentTime
        let minutes = Int(time / 60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        timeStartLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
        
        let endTime = player.currentTime - player.duration
        let endMunutes = Int(endTime / 60)
        let endSeconds = Int(-endTime.truncatingRemainder(dividingBy: 60))
        endOfSongLabel.text = NSString(format: "%02d:%02d", endMunutes, endSeconds) as String
    }
    
    @IBAction func burgerAction(_ sender: Any) {
        switch numberOfSong {
        case 0:
            let items = [URL(string: "https://www.youtube.com/watch?v=LbOve_UZZ54")]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        case 1:
            let items = [URL(string: "https://www.youtube.com/watch?v=4LfJnj66HVQ")]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        default:
            break
        }
    }
    
    @IBAction func playAndPauseButtonAction(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playAndStopButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            player.play()
            playAndStopButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @objc func changeSlider() {
        self.player.currentTime = TimeInterval(playerSlider.value)
    }
    
    @IBAction func backSongAction(_ sender: Any) {
        if numberOfSong == 0 {
            createAudioPlayer(nameOfSong: arraySongs[1])
            numberOfSong = 1
        } else {
            createAudioPlayer(nameOfSong: arraySongs[0])
            numberOfSong = 0
        }
    }
    
    @IBAction func nextSongAction(_ sender: Any) {
        if numberOfSong == 0 {
            createAudioPlayer(nameOfSong: arraySongs[1])
            numberOfSong = 1
        } else {
            createAudioPlayer(nameOfSong: arraySongs[0])
            numberOfSong = 0
        }
    }
    
    func createAudioPlayer(nameOfSong: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: nameOfSong, ofType: "mp3") {
                songImageView.image = UIImage(named: nameOfSong)
                nameOfSongLabel.text = nameOfSong
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("error")
        }
    }
}

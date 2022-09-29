//
//  StartAlbomViewController.swift
//  projectRM
//
//  Created by Александр Троицкий on 25.09.2022.
//

import UIKit
/// Экран, который несет в себе список песен, доступных к прослушиванию в плеере
class StartAlbomViewController: UIViewController {

    var number = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PlayerVC",
              let destination = segue.destination as? PlayerViewController else { return }
        destination.numberOfSong = number
     }
    
    @IBAction func tractorSongAction(_ sender: Any) {
        number = 0
        performSegue(withIdentifier: "PlayerVC", sender: nil)
    }
    
    @IBAction func gucciGangSongAction(_ sender: Any) {
        number = 1
        performSegue(withIdentifier: "PlayerVC", sender: nil)
    }
    
}

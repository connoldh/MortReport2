//
//  SplashScreenViewController.swift
//  MortReport2
//
//  Created by John Connolly on 4/28/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var mortyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let yAtLoad = mortyImageView.frame.origin.y
        playSound(soundName: "Rick-and-morty-theme", audioPlayer: &audioPlayer)
        mortyImageView.frame.origin.y = view.frame.height
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {self.mortyImageView.frame.origin.y = yAtLoad})
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("error: data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("Error: could not find the sound file \(soundName)")
        }
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        audioPlayer.stop()
        performSegue(withIdentifier: "ShowCharacterTableView", sender: nil)
        
    }
    

}

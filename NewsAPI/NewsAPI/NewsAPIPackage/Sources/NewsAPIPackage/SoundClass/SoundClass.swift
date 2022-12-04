//
//  SoundClass.swift
//  
//
//  Created by Марк Киричко on 04.12.2022.
//

import Foundation
import AVFoundation

class SoundClass {
    
    var player: AVAudioPlayer?
    
    func PlaySound(resource: String) {
        
        guard let url = Bundle.module.url(forResource: resource, withExtension: nil) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}



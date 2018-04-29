//
//  AudioPlayer.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/16/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    
    static let shared = AudioPlayer()
    
    var wavesEffect: AVAudioPlayer?
    let audioPath = Bundle.main.path(forResource: "Waves.m4a", ofType: nil)!
    
    func playWaveSound () {
        do{
            wavesEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath), fileTypeHint: AVFileType.m4a.rawValue)
            wavesEffect?.play()}
        catch let error as NSError {
            print(error.description)
        }
    }
    
    func stopPlaying(){
        wavesEffect?.stop()
    }
    
}

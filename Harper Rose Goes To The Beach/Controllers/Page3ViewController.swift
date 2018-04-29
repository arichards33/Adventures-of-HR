//
//  Page3ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit
import AVFoundation

class Page3ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var page3Image: UIImageView!
    @IBOutlet weak var page3Text: UILabel!
    let wavesEffect = AudioPlayer.shared
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page3Text!)
        }
        
        defaults.set(2, forKey: "pageLocation")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Button Actions
    @IBAction func playWaves(_ sender: UIButton) {
        wavesEffect.playWaveSound()
    }

    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page3Text!)
        }
    }

}

//
//  Page4ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class Page4ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var page4Image: UIImageView!
    @IBOutlet weak var page4Text: UILabel!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page4Text!)
        }
        
        defaults.set(3, forKey: "pageLocation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page4Text!)
        }
    }

}

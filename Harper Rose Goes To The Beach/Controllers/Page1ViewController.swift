//
//  Page1ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit


class Page1ViewController: UIViewController {

    @IBOutlet weak var home1Button: UIButton!
    @IBOutlet weak var page1Image: UIImageView!
    @IBOutlet weak var page1Text: UILabel!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page1Text!)
        }
        
        defaults.set(0, forKey: "pageLocation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page1Text!)
        }
    }


}

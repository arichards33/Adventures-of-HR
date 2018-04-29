//
//  Page8ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/13/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class Page8ViewController: UIViewController {

    @IBOutlet weak var page8Image: UIImageView!
    @IBOutlet weak var page8Text: UILabel!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page8Text!)
        }
        
        defaults.set(7, forKey: "pageLocation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

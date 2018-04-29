//
//  AboutPageViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/15/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class AboutPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneReading(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    

}

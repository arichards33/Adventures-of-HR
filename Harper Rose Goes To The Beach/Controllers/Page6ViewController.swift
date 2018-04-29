//
//  Page6ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class Page6ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var page6Image: UIImageView!
    @IBOutlet weak var page6Text: UILabel!
    var animator: UIViewPropertyAnimator!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    var crab: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page6Text!)
        }
        
        defaults.set(5, forKey: "pageLocation")
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.tag = 2
        
        crab = UIImageView(frame: CGRect(x: 20, y: view.frame.maxY - 200, width: 100, height: 100))
        crab.image = #imageLiteral(resourceName: "crab")
        crab.tag = 1
        view.addSubview(crab)
        
        
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) { [unowned self, crab] in
            crab?.center.x = self.view.frame.width
        }
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let viewTag = view.viewWithTag(1)
        viewTag?.removeFromSuperview()
        let sliderTag = view.viewWithTag(2)
        sliderTag?.removeFromSuperview()
    }
    
    // MARK: - UIViewAnimator
    @objc func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }

    //MARK: - Button Actions
    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page6Text!)
        }
    }
    
   

}

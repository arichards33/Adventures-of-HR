//
//  Page5ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class Page5ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var gesture1: UIPanGestureRecognizer!
    @IBOutlet weak var cakeTop: UIView!
    @IBOutlet weak var candle1: UIImageView!
    @IBOutlet weak var candle2: UIImageView!
    @IBOutlet weak var candle3: UIImageView!
    @IBOutlet weak var page5Image: UIImageView!
    @IBOutlet weak var page5Text: UILabel!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page5Text!)
        }
        
        defaults.set(4, forKey: "pageLocation")
        candle1.addGestureRecognizer(gesture1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -UIPanGesture
    func removeGesture(piece: UIImageView){
        piece.gestureRecognizers?.forEach(piece.removeGestureRecognizer)
    }
    
    @IBAction func moveCandle(_ sender: UIPanGestureRecognizer){
        
        let movement = sender.translation(in: self.view)

        if let candle = sender.view {
            candle.center = CGPoint(x:candle.center.x + movement.x, y:candle.center.y + movement.y)
            if sender.state == .ended {
                if candle.frame.minX > cakeTop.frame.minX  && candle.frame.minX < (cakeTop.frame.minX + cakeTop.frame.width) && candle.frame.minY > cakeTop.frame.minY && candle.frame.minY < (cakeTop.frame.minY + cakeTop.frame.height){
                    
                    removeGesture(piece: candle as! UIImageView)
                }
            }
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    //MARK: - Button Actions
    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page5Text!)
        }
    }



}

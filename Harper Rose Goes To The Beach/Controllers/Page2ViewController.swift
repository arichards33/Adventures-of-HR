//
//  Page2ViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var page2Image: UIImageView!
    @IBOutlet weak var page2Label: UILabel!
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    var defaults: UserDefaults = UserDefaults()
    var readToMe: Bool!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewWillAppear(_ animated: Bool) {
        readToMe = defaults.bool(forKey: "rPreference")
        
        if readToMe {
            synthesizer.readToMe(text: page2Label!)
        }
        
        defaults.set(1, forKey: "pageLocation")
        gravityEffect()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let viewTag = view.viewWithTag(1)
        viewTag?.removeFromSuperview()
    }
    
    @IBAction func tapToRead(_ sender: UIButton) {
        if defaults.bool(forKey: "rTapOn"){
            synthesizer.readToMe(text: page2Label!)
        }
    }
    
    //MARK: - UIDynamics; Gravity
    func gravityEffect(){
        
        let thoughtBubble = UIImageView(frame: CGRect(x: 100, y: 50, width: 227, height: 226))
        thoughtBubble.image = #imageLiteral(resourceName: "page2thought")
        thoughtBubble.tag = 1
        
        view.addSubview(thoughtBubble)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        gravity = UIGravityBehavior(items: [thoughtBubble])
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [thoughtBubble])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision)
        
        let barrier = UIView(frame: CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: 5))
        barrier.alpha = 0.0
        self.view.addSubview(barrier)
        
        let endPoint = CGPoint(x: barrier.frame.origin.x + barrier.frame.width, y: barrier.frame.origin.y + barrier.frame.height)
        
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, from: barrier.frame.origin, to: endPoint)
        
    }
   
    


}

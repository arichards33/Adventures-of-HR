//
//  HomeViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    var defaults: UserDefaults = UserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
        backgroundImage.image = #imageLiteral(resourceName: "Intro")
        
        
        authorButton.frame = CGRect(x: view.frame.minX + 40, y: view.frame.maxY - 240, width: 200, height: 60)
        authorButton.layer.cornerRadius = 10
        authorButton.clipsToBounds = true
        readButton.frame = CGRect(x: view.frame.minX + 40, y: view.frame.maxY - 170, width: 150, height: 60)
        readButton.layer.cornerRadius = 10
        readButton.clipsToBounds = true
        resumeButton.frame = CGRect(x: view.frame.minX + 40, y: view.frame.maxY - 100, width: 150, height: 60)
        resumeButton.layer.cornerRadius = 10
        resumeButton.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Actions
    
    @IBAction func aboutAuthor(_ sender: UIButton) {
        let vc = AboutAuthorViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func resumeReading(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookRoot")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func readBook(_ sender: UIButton) {
        defaults.set(0, forKey: "pageLocation")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookRoot")
        self.present(vc, animated: true, completion: nil)
    }


}

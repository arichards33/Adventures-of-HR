//
//  ModelController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit


class ModelController: NSObject, UIPageViewControllerDataSource {
    let synthesizer = ReaderSynthesizer.sharedSynthesizer
    let soundEffect = AudioPlayer.shared
    lazy var pages: [UIViewController] = {
        return [self.loadViewController(withIdentifier: "Page1ViewController"),
                self.loadViewController(withIdentifier: "Page2ViewController"),
                self.loadViewController(withIdentifier: "Page3ViewController"),
                self.loadViewController(withIdentifier: "Page4ViewController"),
                self.loadViewController(withIdentifier: "Page5ViewController"),
                self.loadViewController(withIdentifier: "Page6ViewController"),
                self.loadViewController(withIdentifier: "Page7ViewController"),
                self.loadViewController(withIdentifier: "Page8ViewController"),
                ]
    }()
    func loadViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    
    override init() {
        super.init()
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.pages.count == 0) || (index >= self.pages.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        //        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        //        dataViewController.dataObject = self.pageData[index]
        return pages[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pages.index(of: viewController) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        synthesizer.stopSpeaking()
        soundEffect.stopPlaying()
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pages.count {
            return nil
        }
        synthesizer.stopSpeaking()
        soundEffect.stopPlaying()
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    
    
}




//
//  ModelController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {
    
    lazy var pages: [UIViewController] = {
        return [self.loadViewController(withIdentifier: "Page1ViewController"),
                self.loadViewController(withIdentifier: "Page2ViewController"),
                self.loadViewController(withIdentifier: "Page3ViewController"),
                self.loadViewController(withIdentifier: "Page4ViewController"),
                self.loadViewController(withIdentifier: "Page5ViewController"),
                self.loadViewController(withIdentifier: "Page6ViewController"),
                self.loadViewController(withIdentifier: "Page7ViewController"),
    ]
}()
    func loadViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    
    override init() {
        super.init()
        // Create the data model.
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
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}



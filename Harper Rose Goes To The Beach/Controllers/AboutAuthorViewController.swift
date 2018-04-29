//
//  AboutAuthorViewController.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {

    let num1 = arc4random_uniform(UInt32(30))
    let num2 = arc4random_uniform(UInt32(30))
    let num3 = arc4random_uniform(UInt32(30))
    let num4 = arc4random_uniform(UInt32(30))
    var answer: Int!
    var rightAnswer: Int!
    var randomizeAnswers: [Int] = []
    
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var harperPic: UIImageView!
    
    var lastPoint = CGPoint.zero
    var firstPoint = CGPoint.zero
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var drawing = false
    var points = [CGPoint]()
    
    @IBOutlet weak var answerChoices: UIImageView!
    var chosenAnswer: Int!
    var chosenLabel: UILabel!
    
    enum WrongAnswer: Error {
        case wrong
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMath()
        
        question.text = "\(num1) + \(num2) = ???"
        answer1.text = String("\(randomizeAnswers[0])")
        answer2.text = String("\(randomizeAnswers[1])")
        answer3.text = String("\(randomizeAnswers[2])")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnHome(_ sender: Any) {
          self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    
    // MARK: - Set up the math question
    
    func setMath(){
        answer = Int(num1 + num2)
        getRandomNum()
    }
    
    func getRandomNum(){
        var numbers: [Int] = [answer, Int(num3), Int(num4)]
        print(numbers)
        while numbers.count > 0 {
            let num = Int(arc4random_uniform(UInt32(numbers.count)))
            randomizeAnswers.append(numbers[num])
            if numbers[num] == answer {
                rightAnswer = randomizeAnswers.count
            }
            numbers.remove(at: num)
        }
    }
    
    // MARK: - Draw Circle
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // Create the canvas
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        answerChoices.image?.draw(in: CGRect(x: 0, y: 0,
                                             width: view.frame.size.width,
                                             height: view.frame.size.height))
        
        // Create line segment
        context!.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context!.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        // Set the `pen`
        context!.setLineCap(.round)
        context!.setLineWidth(brushWidth)
        context!.setStrokeColor(UIColor.black.cgColor)
        context!.setBlendMode(.normal)
        
        // Stroke the path with the pen
        context!.strokePath()
        
        // Copy the canvas on the imageview
        answerChoices.image = UIGraphicsGetImageFromCurrentImageContext()
        answerChoices.alpha = opacity
        UIGraphicsEndImageContext()
        
    }

    // MARK:  - Determine if answered correctly
    
    func checkAnswer(){
        print("right: \(rightAnswer)")
        findLabelAnswer(answer: rightAnswer)
        do {
            let correct = try circledAnswer(start: firstPoint, end: lastPoint)
            print(correct)
            if correct{
                print("CORRECT!")
                answerChoices.image = nil
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Info")
                self.present(vc, animated: true, completion: nil)
            }
        } catch {
            wrongAlert()
            answerChoices.image = nil
        }
    }
    
    func circledAnswer(start: CGPoint, end: CGPoint) throws -> Bool {
        if start.x >= chosenLabel.frame.minX && start.x <= chosenLabel.frame.maxX && end.x >= chosenLabel.frame.minX && end.x <= chosenLabel.frame.maxX && start.y >= chosenLabel.frame.minY && start.y <= chosenLabel.frame.maxY && end.y >= chosenLabel.frame.minY && end.y <= chosenLabel.frame.maxY {
            return true
        }
        else {
            throw WrongAnswer.wrong
        }
    }
    
    func findLabelAnswer(answer: Int) {
        if answer == 1 {
            chosenLabel = answer1
        }
        else if answer == 2 {
            chosenLabel = answer2
        }
        else if answer == 3 {
            chosenLabel = answer3
        }
        print(answer)
    }
    
    // MARK: - Create Wrong Alert
    
    func wrongAlert(){
        let wrongAlert = UIAlertController(title: "Try Again", message: "That is not the right answer", preferredStyle: .alert)
        wrongAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.presentingViewController?.dismiss(animated: false, completion:nil)
        }))
        self.present(wrongAlert, animated: true, completion: nil)
    }
    
    
    
    //
    // MARK: - Touches
    //
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
        drawing = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
            firstPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Moved")
        
        drawing = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            
            lastPoint = currentPoint
            print(currentPoint)
        }
    }
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
        if !drawing {
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        // once the circle is complete check if the right answer is chosen
        checkAnswer()
    }
    

}

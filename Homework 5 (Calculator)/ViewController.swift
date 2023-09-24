//
//  ViewController.swift
//  Homework 5 (Calculator)
//
//  Created by Samet  Doğan on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum: String = ""
    var operation: String = ""
    var secondNum: String = ""
    var haveResults: Bool = false
    var resultsNumber: String = ""
    var numAfterResults: String = ""
    
    
    @IBOutlet weak var numOnScreen: UILabel!
    @IBOutlet var calcButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
            
        }
        
        
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == ""{
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
            
        }
        else if  operation != "" && !haveResults {
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveResults {
            numAfterResults += String(sender.tag)
            numOnScreen.text = numAfterResults
        }
        
    }
    
    @IBAction func clear(_ sender: Any) {
        
        firstNum = ""
        operation = ""
        secondNum = ""
        haveResults = false
        resultsNumber = ""
        numAfterResults = ""
        numOnScreen.text = "0"
    }
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    @IBAction func equals(_ sender: Any) {
        resultsNumber = String(doOperation())
        let numArray = resultsNumber.components(separatedBy: ".")
        print(numArray)
        if numArray[1] == "0" {
            numOnScreen.text = numArray[0]
        }
        else {
            numOnScreen.text = resultsNumber
        }
        numAfterResults = ""
        
    }
    
    func doOperation() -> Double {
        if operation == "+" {
            if !haveResults {
                haveResults = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else {
                return Double(resultsNumber)! + Double(numAfterResults)!
            }
        }
        else if operation == "-" {
            if !haveResults {
                haveResults = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else{
                return Double(resultsNumber)! - Double(numAfterResults)!
            }
        }
        
        else if operation == "x" {
            if !haveResults {
                haveResults = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else{
                return Double(resultsNumber)! * Double(numAfterResults)!
            }
        }
        else if operation == "/" {
            if !haveResults {
                haveResults = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else{
                return Double(resultsNumber)! / Double(numAfterResults)!
            }
        }
        return 0
    }
}

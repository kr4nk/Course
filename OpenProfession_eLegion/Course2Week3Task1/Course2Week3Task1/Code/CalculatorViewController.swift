//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {

    var firstValue: Double = 1
    var secondValue: Double = 1
    
    @IBOutlet weak var firstLabel: UILabel! {
       didSet {
            firstLabel.text = "\(firstValue)"
        }
    }
    
    @IBOutlet weak var secondLabel: UILabel! {
        didSet {
            secondLabel.text = "\(secondValue)"
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func convertDouble(input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 4
        numberFormatter.maximumFractionDigits = 4
        
        return numberFormatter.string(from: NSNumber(value: input))!
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        firstLabel.text = convertDouble(input: sender.value)
        firstValue = Double(sender.value)
    }
    
    @IBAction func slider(_ sender: UISlider) {
        secondLabel.text = convertDouble(input: Double(sender.value))
        secondValue = Double(sender.value)
    }
    
    func concat(firstValue: Double, secondValue: Double) -> Double {
        let result = firstValue * secondValue
        return result
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        resultLabel.text = convertDouble(input: concat(firstValue: firstValue, secondValue: secondValue))
        
    }
    
}

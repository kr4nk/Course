//
//  ViewController.swift
//  BHD-INR
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, ConversionContainerViewDelegate {
    
    private var container: ConversionContainerView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container = ConversionContainerView(firstCurrency: Const.firstCurrency,
                                            secondCurrency: Const.secondCurrency)
        container.delegate = self
        
        view.addSubview(container)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        container.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.frame.width,
                                 height: Const.containerHeight)
    }
    
    // MARK: - Private

    func calculate(_ amountString: String) {
        let currentRate: Double
        let currentFirstCurrency: String
        let currentSecondCurrency: String
        if container.currentConversionDirection == .straight {
            currentRate = Const.straightRate
            currentFirstCurrency = Const.firstCurrency
            currentSecondCurrency = Const.secondCurrency
        } else {
            currentRate = Const.reverseRate
            currentFirstCurrency = Const.secondCurrency
            currentSecondCurrency = Const.firstCurrency
        }
        
        let result: String
        if let amount = Double(amountString) {
            result = """
            \(amount) \(currentFirstCurrency)
            равняется
            \(currentRate * amount) \(currentSecondCurrency)
            """
        } else {
            result = "Ошибка!\nНекорректная сумма"
        }
        
        container.setCurrentConversionResult(result)
    }
    
    // MARK: - ConversionContainerViewDelegate
    
    func conversionContainerView(_ container: ConversionContainerView,
                                 didPressCalculateButtonWith amountString: String) {
        
        calculate(amountString)
    }
}

extension ConversionViewController {
    
    private enum Const {
        static let straightRate = 168.668
        static let reverseRate = 0.00593
        
        static let firstCurrency = "BHD"
        static let secondCurrency = "INR"
        
        static let containerHeight: CGFloat = 250.0
    }
}

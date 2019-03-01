//
//  ConversionView.swift
//  BHD-INR
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

protocol ConversionViewDelegate: class {
    func conversionView(_ conversionView: ConversionView,
                        didPressCalculateButtonWith state: ConversionViewState)
}

struct ConversionViewState {
    var amountString: String?
    var resultString: String?
}

class ConversionView: UIView {

    @IBOutlet private weak var conversionResultLabel: UILabel!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var calculateButton: UIButton!
    
    weak var delegate: ConversionViewDelegate?
    var conversionViewState: ConversionViewState {
        get {
            return ConversionViewState(amountString: amountTextField.text,
                                       resultString: conversionResultLabel.text)
        }
        set {
            amountTextField.text = newValue.amountString
            conversionResultLabel.text = newValue.resultString
        }
    }

    // MARK: - Actions
    
    @IBAction private func calculateButtonPressed(_ sender: UIButton) {
        delegate?.conversionView(self,
                                 didPressCalculateButtonWith: conversionViewState)
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = CGSize(width: bounds.width - Const.elementsOffset * 2,
                          height: bounds.height - Const.elementsOffset * 2)
        
        let heightOfConversionResultLabel = size.height - Const.elementsOffset - calculateButton.frame.height
        conversionResultLabel.frame = CGRect(x: Const.elementsOffset,
                                             y: Const.elementsOffset,
                                             width: size.width,
                                             height: heightOfConversionResultLabel)
        
        let calculateButtonX = bounds.size.width - Const.elementsOffset - calculateButton.frame.size.width
        calculateButton.frame.origin = CGPoint(x: calculateButtonX,
                                               y: conversionResultLabel.frame.maxY + Const.elementsOffset)
        
        let amountTextFieldY = calculateButton.frame.midY - amountTextField.frame.size.height / 2
        amountTextField.frame.origin = CGPoint(x: Const.elementsOffset,
                                               y: amountTextFieldY)
        amountTextField.frame.size.width = size.width - calculateButton.frame.size.width - Const.elementsOffset
    }
}

extension ConversionView {
    private enum Const {
        static let elementsOffset: CGFloat = 16.0
    }
}

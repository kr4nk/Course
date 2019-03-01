//
//  ConversionContainerView.swift
//  BHD-INR
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

protocol ConversionContainerViewDelegate: class {
    func conversionContainerView(_ container: ConversionContainerView,
                                 didPressCalculateButtonWith amountString: String)
}

class ConversionContainerView: UIView, ConversionViewDelegate {
    
    enum ConversionDirection {
        case straight
        case reverse
    }

    private var directionSegmentedControl: UISegmentedControl
    private var conversionView: ConversionView
    private var savedConversionViewState = ConversionViewState(amountString: nil,
                                                                 resultString: nil)
    
    weak var delegate: ConversionContainerViewDelegate?
    var currentConversionDirection = ConversionDirection.straight
    
    // MARK: - Initialization
    
    init(firstCurrency: String, secondCurrency: String) {
        let leftTitle = firstCurrency + "->" + secondCurrency
        let rightTitle = secondCurrency + "->" + firstCurrency
        
        directionSegmentedControl = UISegmentedControl(items: [leftTitle, rightTitle])
        directionSegmentedControl.selectedSegmentIndex = Const.straightSelectorIndex
        
        let conversionViewXib = UINib(nibName: "ConversionView", bundle: nil)
        
        conversionView = conversionViewXib.instantiate(withOwner: nil, options: nil).first as! ConversionView
        
        directionSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        conversionView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: .zero)
        
        conversionView.delegate = self
        
        directionSegmentedControl.addTarget(self,
                                     action: #selector(directionSelectorChanged(_:)),
                                     for: .valueChanged)
        
        addSubview(directionSegmentedControl)
        addSubview(conversionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func directionSelectorChanged(_ sender: UISegmentedControl) {
        let currentIndex = currentConversionDirection == .straight ? Const.straightSelectorIndex : Const.reverseSelectorIndex
        guard sender.selectedSegmentIndex != currentIndex else {
            return
        }
        currentConversionDirection = sender.selectedSegmentIndex == Const.straightSelectorIndex ? .straight : .reverse
        
        let tempState = conversionView.conversionViewState
        conversionView.conversionViewState = savedConversionViewState
        savedConversionViewState = tempState
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        directionSegmentedControl.frame.origin.x = bounds.width / 2 - directionSegmentedControl.frame.size.width / 2
        directionSegmentedControl.frame.origin.y = Const.topOffset
        
        conversionView.frame = CGRect(x: 0,
                                              y: directionSegmentedControl.frame.maxY,
                                              width: bounds.size.width,
                                              height: bounds.size.height - directionSegmentedControl.frame.maxY)
    }
    
    // MARK: - Public
    
    func setCurrentConversionResult(_ conversionResut: String) {
        conversionView.conversionViewState.resultString = conversionResut
    }
    
    // MARK: - ConversionViewDelegate
    
    func conversionView(_ conversionView: ConversionView,
                        didPressCalculateButtonWith state: ConversionViewState) {

        delegate?.conversionContainerView(self, didPressCalculateButtonWith: state.amountString ?? "")
    }
}

extension ConversionContainerView {
    
    private enum Const {
        static let straightSelectorIndex = 0
        static let reverseSelectorIndex = 1
        
        static let topOffset: CGFloat = 32.0
    }
}

//
//  SimpleView.swift
//  UIViewLifeCycle
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class SimpleView: UIView {
    
    var isReversed = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    private let greenSubview: UIView = UIView(frame: .zero)
    private let tintSubview: UIView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        isHidden = false
        alpha = 1.0
        clipsToBounds = true
        
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
        isExclusiveTouch = true
        
        let anotherView = UIView(frame: .zero)
        insertSubview(anotherView, at: 0)
        bringSubview(toFront: anotherView)
        
        anotherView.removeFromSuperview()
        
        greenSubview.backgroundColor = .green
        tintSubview.backgroundColor = tintColor
        
        greenSubview.frame = CGRect(x: 5.0, y: 5.0, width: 10.0, height: 7.0)
        tintSubview.frame = CGRect(x: 15.0, y: 15.0, width: 5.0, height: 15.0)
        
        addSubview(greenSubview)
        addSubview(tintSubview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        print("awakeFromNib()")
        super.awakeFromNib()
    }
    
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print("willMove(toSuperview:)")
        super.willMove(toSuperview: newSuperview)
    }
    
    override func didMoveToSuperview() {
        print("didMoveToSuperview()")
        super.didMoveToSuperview()
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("willMove(toWindow:)")
        super.willMove(toWindow: newWindow)
    }
    
    override func didMoveToWindow() {
        print("didMoveToWindow()")
        super.didMoveToWindow()
    }
    
    override func removeFromSuperview() {
        print("removeFromSuperview()")
        super.removeFromSuperview()
    }
    
    
    
    override func setNeedsLayout() {
        print("setNeedsLayout()")
        super.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        print("layoutSubviews()")
        super.layoutSubviews()
        
        if isReversed {
            greenSubview.frame = CGRect(x: 5.0, y: 5.0, width: 10.0, height: 7.0)
            tintSubview.frame = CGRect(x: 15.0, y: 15.0, width: 5.0, height: 15.0)
        } else {
            tintSubview.frame = CGRect(x: 5.0, y: 5.0, width: 10.0, height: 7.0)
            greenSubview.frame = CGRect(x: 15.0, y: 15.0, width: 5.0, height: 15.0)
        }
    }
    
    override func layoutIfNeeded() {
        print("layoutIfNeeded()")
        super.layoutIfNeeded()
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        print("draw()")
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.red.cgColor)
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(4.0)
            context.addEllipse(in: CGRect(x: 100.0, y: 2.0, width: 20.0, height: 30.0))
            context.drawPath(using: .fillStroke)
        }
    }

    override func setNeedsDisplay() {
        print("setNeedsDisplay()")
        super.setNeedsDisplay()
    }

    override func setNeedsDisplay(_ rect: CGRect) {
        print("setNeedsDisplay(_ rect:)")
        super.setNeedsDisplay(rect)
    }
    
    override func tintColorDidChange() {
        print("tintColorDidChange()")
        super.tintColorDidChange()
        
        tintSubview.backgroundColor = tintColor
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hitTest()")
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("point()")
        return super.point(inside: point, with: event)
    }
}

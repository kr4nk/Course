//
//  ViewController.swift
//  UIViewLifeCycle
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let simpleView: SimpleView = {
        let view = SimpleView(frame: CGRect(x: 50.0, y: 100.0, width: 150.0, height: 70.0))
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    @IBAction func reverseButtonPressed(_ sender: UIButton) {
        simpleView.isReversed = !simpleView.isReversed
    }
    
    @IBAction func changeTintColorButtonPressed(_ sender: UIButton) {
        if view.tintColor == .red {
            view.tintColor = .yellow
        } else {
            view.tintColor = .red
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.view.addSubview(simpleView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        simpleView.center = CGPoint(x: UIScreen.main.bounds.midX,
                                    y: UIScreen.main.bounds.midY)
        
        simpleView.transform = CGAffineTransform(rotationAngle: 0.5).concatenating(CGAffineTransform(scaleX: 0.1, y: 0.1))
        simpleView.transform = CGAffineTransform.identity
    }
}

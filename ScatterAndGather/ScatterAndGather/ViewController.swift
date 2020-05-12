//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Dahna on 5/12/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    var letterArray: [UILabel] = []
    var isScattered: Bool = false
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        print(isScattered)
        
        if isScattered {
            fadeLogoOut()
            randomAnimations()
        } else {
            fadeLogoIn()
            returnToIdentity()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fadeLogoOut() {
        UIView.animate(withDuration: 2.0) {
            self.lambdaLogo.alpha = 0
        }
    }
    
    func fadeLogoIn() {
        UIView.animate(withDuration: 2.0) {
            self.lambdaLogo.alpha = 1
        }
    }
    
    func randomizedBlockAnimation(label: UILabel) {
        let label = label
        
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.001) {
            label.center = label.center
        }
        UIView.transition(with: label, duration: 0.5, options: .transitionCrossDissolve, animations: {
          label.textColor = .random()
        }, completion: nil)
        
        UIView.transition(with: label, duration: 0.5, options: .transitionCrossDissolve, animations: {
          label.backgroundColor = .random()
        }, completion: nil)
        
        UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 2.0) {
            label.transform = CGAffineTransform(rotationAngle: .pi/CGFloat.random(in: -10...10))
        }
        UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 2.0) {
            label.transform = CGAffineTransform(translationX: (CGFloat.random(in: -200...200)),
                                                y: (CGFloat.random(in: -100...300)))
        }
    }
    
    func randomizedLabels() {
        letterArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        for letter in letterArray {
            randomizedBlockAnimation(label: letter)
        }
    }
    
    func randomAnimations() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: randomizedLabels, completion: nil)
    }
    
    func normalBlock(label: UILabel) {
        UIView.transition(with: label, duration: 1.5, options: [], animations: {
                label.textColor = .black
            }, completion: nil)
        UIView.transition(with: label, duration: 1.5, options: [], animations: {
                label.backgroundColor = .white
            }, completion: nil)
        UIView.transition(with: label, duration: 2.5, options: [], animations: {
                label.transform = .identity
            }, completion: nil)
        }
    
    func originalLabelBlock() {
        
        letterArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        for letter in letterArray {
            normalBlock(label: letter)
        }
    }
    
    func returnToIdentity() {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: originalLabelBlock, completion: nil)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1)
    }
}


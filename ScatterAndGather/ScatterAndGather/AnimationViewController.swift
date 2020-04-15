//
//  AnimationViewController.swift
//  ScatterAndGather
//
//  Created by Dahna on 4/14/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var isScattered: Bool = false
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaImage: UIImageView!
    
    var letterArray: [UILabel] = []
    
    @IBAction func toggleButton(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        print(isScattered)
        
        if isScattered == true {
            fadeImageOut()
            randomAnimations()
            
        } else {
            fadeImageIn()
            returnToIdentity()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // Lambda Image Fades
    func fadeImageOut() {
        UIView.animate(withDuration: 2.5) {
            self.lambdaImage.alpha = 0
        }
    }
    func fadeImageIn() {
        UIView.animate(withDuration: 2.5) {
            self.lambdaImage.alpha = 1
        }
        
    }
    
    func randomBlock(label: UILabel) {
        
        let label = label
        
        
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.001) {
            label.center = label.center
        }
        UIView.transition(with: label, duration: 0.00001, options: .transitionCrossDissolve, animations: {
            label.textColor = .random()
        }, completion: nil)
        UIView.transition(with: label, duration: 0.0001, options: .transitionCrossDissolve, animations: {
            label.backgroundColor = .random()
        }, completion: nil)
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.5) {
            label.transform = CGAffineTransform(rotationAngle: -1 * .pi/CGFloat.random(in: -10...10))
        }
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.5) {
            label.transform = CGAffineTransform(translationX: (CGFloat.random(in: -200...200)),
                                                y: (CGFloat.random(in: -100...300)))
        }
        
        
    }
    
    
    func randomLabelBlock() {
        letterArray = [lLabel, aLabel, mLabel, bLabel, dLabel, secondALabel]
        
        for letter in letterArray {
            randomBlock(label: letter)
        }
    }
    
    func randomAnimations() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: randomLabelBlock, completion: nil)
    }
    
    func normalBlock(label: UILabel) {
        
        UIView.transition(with: label, duration: 0.01, options: .transitionCrossDissolve, animations: {
            label.textColor = .black
        }, completion: nil)
        UIView.transition(with: label, duration: 0.01, options: .transitionCrossDissolve, animations: {
            label.backgroundColor = .white
        }, completion: nil)
        UIView.transition(with: label, duration: 2, options: .transitionCrossDissolve, animations: {
            label.transform = .identity
        }, completion: nil)
    }
    
    func normalLabelBlock() {
        for letter in letterArray {
            normalBlock(label: letter)
        }
        
    }
    
    func returnToIdentity() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: normalLabelBlock, completion: nil)
    }
    
    
    
    

    
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() ->UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}

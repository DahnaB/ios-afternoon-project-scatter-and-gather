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
        UIView.animate(withDuration: 2) {
            self.lambdaImage.alpha = 0
        }
    }
    func fadeImageIn() {
        UIView.animate(withDuration: 2) {
            self.lambdaImage.alpha = 1
        }
        
    }
    
    func randomAnimations() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: randomLabelBlock, completion: nil)
    }
    
    func originalStateAnimations() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: returnToIdentity, completion: nil)
    }
    
    func randomLabelBlock() {
        let letterArray: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dLabel, secondALabel]
        
        for letter in letterArray {
//            letter.textColor = getRandomColor()
            letter.backgroundColor = getRandomColor()
            rotateLabel(label: letter)
            moveLabel(label: letter)
            randomTextColor(label: letter)
        }
    }
    
    
    func getRandomColor() -> UIColor {
        let randomColor = UIColor(red: (CGFloat.random(in: 1...255)),
                                  green: (CGFloat.random(in: 1...255)),
                                  blue: CGFloat.random(in: 1...255),
                                  alpha: 1)
        return randomColor
    }
    
    func rotateLabel(label: UILabel) {
        let label = label
        UIView.animate(withDuration: 2.0, animations: {
            label.transform = CGAffineTransform(rotationAngle: -1 * .pi/(CGFloat.random(in: 2...6)))
        })
    }
    
    func originalRotation(label: UILabel) {
        let label = label
        UIView.animate(withDuration: 2.0) {
            label.transform = .identity
        }
    }
    
    func randomTextColor(label: UILabel) {
        let label = label
        UIView.animate(withDuration: 2.0) {
            label.textColor = self.getRandomColor()
        }
    }

    
    func moveLabel(label: UILabel) {
        let label = label
       
        UIView.animate(withDuration: 2.0) {
            label.transform = CGAffineTransform(translationX: (CGFloat.random(in: 1...100)), y: (CGFloat.random(in: -100...100)))
        }
    }
    
    func returnToIdentity() {
        let letterArray: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dLabel, secondALabel]
        
        for letter in letterArray {
            letter.textColor = .black
            letter.backgroundColor = .white
            originalRotation(label: letter)
            
        }
    }

  
    // MARK: - Navigation


}

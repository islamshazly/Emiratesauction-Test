//
//  UIButtonExtension.swift


import UIKit


extension UIButton {
    
    @IBInspectable var centerTextAndImage: CGFloat {
        get {
            return 0
        }
        set {
            var insetAmount = newValue / 2
            if Language.language == .arabic {
                insetAmount = insetAmount * -1
            }
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
        }
    }
    
    func disable() {
        self.isEnabled = false
        self.alpha = 0.5
    }
    
    func enable() {
        self.isEnabled = true
        self.alpha = 1.0
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
    
}


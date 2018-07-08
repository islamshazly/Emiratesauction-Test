import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return self.shadowColor
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    public func circulerContent() {
        layer.masksToBounds = true
        self.clipsToBounds = true
        self.cornerRadius = self.bounds.height / 2
    }
    
    func fadeIn(withDuration duration : Double) {
        
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    
    func fadeOut(withDuration duration : Double) {
        
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
    }
    
    
    
    enum Shape {
        case rectangle
        case rounded(CGFloat)
        case circular
    }
    
    func setShadow(color: UIColor = .black, radius: CGFloat = 2, opacity: Float = 0.15, offset: CGSize = CGSize(width: 0, height: 1)) {
        shadowColor = color
        shadowRadius = radius
        shadowOpacity = opacity
        shadowOffset = offset
    }
    
    func shadowView(color: UIColor, radius: CGFloat, opacity: Float, offset: CGSize = CGSize(width: 0 , height: 0), shape: Shape) -> UIView {
        switch shape {
        case .circular:
            self.circulerContent()
        case .rounded(let cornerRadius):
            self.cornerRadius = cornerRadius
        default:
            self.cornerRadius = 0
        }
        let shadowView = UIView()
        shadowView.frame = self.frame
        shadowView.layer.shadowColor = color.cgColor
        shadowView.layer.shadowOffset = offset
        shadowView.layer.shadowRadius = radius
        shadowView.layer.shadowOpacity = opacity
        switch shape {
        case .rectangle:
            shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
        case .circular:
            shadowView.layer.shadowPath = UIBezierPath(ovalIn: shadowView.bounds).cgPath
        case .rounded(let cornerRadius):
            shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: cornerRadius).cgPath
        }
        shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
        return shadowView
    }
    
    func roundedShadow() {
        self.layer.cornerRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0 , height: 0)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 3
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = false
    }
    
    func shadowAndRoundedCorner (withImage contentView : UIImageView) {
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func roundedCornerWithShadow() {
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 3
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func createGradientLayer(isVertical: Bool) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.Eorange.cgColor,UIColor.Ered.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.frame.size = self.bounds.size
        gradientLayer.endPoint = isVertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}

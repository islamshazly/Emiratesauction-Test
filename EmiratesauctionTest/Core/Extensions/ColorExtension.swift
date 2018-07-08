//
//  ColorExtension.swift

//

import UIKit

extension UIColor {
    
        
    open class var Ered: UIColor { return UIColor(red: 238 / 255.0, green: 70 / 255.0, blue: 79 / 255.0, alpha: 1) }
    
    open class var Eorange: UIColor { return UIColor(red: 238 / 255.0, green: 106 / 255.0, blue: 75 / 255.0, alpha: 1) }

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

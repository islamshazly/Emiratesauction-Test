//
//  DateFormatterExtension.swift
//  Ostazi Profile
//
//  Created by Islam Elshazly on 4/14/18.
//  Copyright © 2018 Karshless. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    open class var ETestDisplayFormat: DateFormatter {
        
        let dateFormatter  = DateFormatter()
        dateFormatter.dateStyle = .long
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: Language.language.rawValue)
        return dateFormatter
    }

    
    open class var EtestAPIFormat: DateFormatter {
        
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "dd MM hh:mm a"
        dateFormatter.defaultDate = Date()
        dateFormatter.locale = Locale(identifier: Language.english.rawValue)

        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter
    }
    
    
}

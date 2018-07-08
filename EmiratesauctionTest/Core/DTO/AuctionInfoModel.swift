//
//  AuctionInfoModel.swift
//  EmiratesauctionTest
//
//  Created by Islam Elshazly on 7/7/18.
//  Copyright © 2018 Islam Elshazly. All rights reserved.
//

import UIKit
import ObjectMapper
import DateToolsSwift

final class AuctionInfoModel: BaseModel {
    
    var bids: Int = 0
    var endDateEn: Date = Date()
    var endDateAr: String = ""
    var currencyEn: String = ""
    var currencyAr: String = ""
    var currentPrice: Double = 0
    var minIncrement: Int = 0
    var lot: Double = 0
    var priority: Double = 0
    var VATPercent: Int = 0
    var isModified: Bool = false
    var itemid: Double = 0
    var iCarId: Int = 0
    var iVinNumber: Int = 0
    var test = Date()

    // not from model
    var remmainingTime: TimeChunk {
        let now = Date()
        return now.chunkBetween(date: endDateEn)
    }

    var currency: String {
        get {
            return Language.language == .arabic ? currencyAr : currencyEn
        }
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        bids <- map["bids"]
        endDateEn <- (map["endDateEn"], DateFormatterTransform(dateFormatter: DateFormatter.EtestAPIFormat))
        endDateAr <- map["endDateAr"]
        currencyEn <- map["currencyEn"]
        currencyAr <- map["currencyAr"]
        currentPrice <- map["currentPrice"]
        minIncrement <- map["minIncrement"]
        lot <- map["lot"]
        priority <- map["priority"]
        VATPercent <- map["VATPercent"]
        isModified <- map["isModified"]
        itemid <- map["itemid"]
        iCarId <- map["iCarId"]
        iVinNumber <- map["iVinNumber"]
        
    }
}

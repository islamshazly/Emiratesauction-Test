//
//  CarModel.swift
//  EmiratesauctionTest
//
//  Created by Islam Elshazly on 7/7/18.
//  Copyright © 2018 Islam Elshazly. All rights reserved.
//

import UIKit
import ObjectMapper

final class CarModel: BaseModel {

    var carID: Double = 0
    var image: String = ""
    var descriptionAr: String = ""
    var descriptionEn: String = ""
    var imgCount: Int = 0
    var sharingLink: String = ""
    var sharingMsgEn: String = ""
    var sharingMsgAr: String = ""
    var mileage: Double = 0
    var makeID: Int = 0
    var modelID: Int = 0
    var bodyId: Int = 0
    var year: Int = 0
    var makeEn: String = ""
    var makeAr: String = ""
    var bodyEn: String = ""
    var bodyAr: String = ""
    var modelAr: String = ""
    var modelEn: String = ""
    var auctionInfo: AuctionInfoModel = AuctionInfoModel()
    
    var name: String {
        get {
            return Language.language == .arabic ? makeAr + " " + modelAr + " " + bodyAr + " \(year)" : makeEn + " " + modelEn + " " + bodyEn + " \(year)"
        }
    }
    
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        carID <- map["carID"]
        image <- map["image"]
        descriptionAr <- map["descriptionAr"]
        descriptionEn <- map["descriptionEn"]
        imgCount <- map["imgCount"]
        sharingLink <- map["sharingLink"]
        sharingMsgEn <- map["sharingMsgEn"]
        sharingMsgAr <- map["sharingMsgAr"]
        mileage <- map["mileage"]
        makeID <- map["makeID"]
        modelID <- map["modelID"]
        bodyId <- map["bodyId"]
        year <- map["year"]
        makeEn <- map["makeEn"]
        makeAr <- map["makeAr"]
        bodyEn <- map["bodyEn"]
        bodyAr <- map["bodyAr"]
        bodyAr <- map["bodyAr"]
        auctionInfo <- map["AuctionInfo"]
        modelAr <- map["modelAr"]
        modelEn <- map["modelEn"]
        
        image = image.replacingOccurrences(of: "[w]", with: "0")
        image = image.replacingOccurrences(of: "[h]", with: "0")
    }
}

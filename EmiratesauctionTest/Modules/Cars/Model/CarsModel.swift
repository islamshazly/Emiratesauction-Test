//
//  CarsModel.swift
//  EmiratesauctionTest
//
//  Created by Islam Elshazly on 7/7/18.
//  Copyright © 2018 Islam Elshazly. All rights reserved.
//

import UIKit
import ObjectMapper

final class CarsModel: BaseModel {
    
    var cars: [CarModel] = [CarModel]()
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        cars <- map["Cars"]
    }
    
    //MARK: Buss  Logic
    
    func sortDescByEndDate() {
        // desc
        // erliest is in top  8/7 - 11/7
        cars = cars.sorted(by: { $0.endDateInterval > $1.endDateInterval })
    }
    
    func sortDescByYear() {
         // desc
        // 2018 - 2017
        cars = cars.sorted(by: { $0.year > $1.year })
    }

    func sortDescByPrice() {
        // desc
        //3000 - 2000
        cars = cars.sorted(by: { $0.auctionInfo.currentPrice > $1.auctionInfo.currentPrice })
    }
    
    //MARK: Api calls
    
    func requestCars(withSuccessClouser success : @escaping SuccessClosure, faliure : @escaping FailureClosure) {
        
        // RequestConfiguraton insert base url as defualt

        let request = RequestConfiguraton(WithRequestMethod: .get,Path: Constants.cars, modelClass: self, parameters: nil, Headers: nil)
        self.startApiRequest(withRequestConfiguration: request, successClouser: { (model) in
            success(model)
            self.delegate?.didReceiveDataSuccessfully(data: model!, identifier: Constants.cars)
        }) { (error) in
            faliure(error)
            self.delegate?.didFailToReceiveData(error: error!, identifer: Constants.cars)
        }
    }
}

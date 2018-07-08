//
//  BaseModel.swift

//

import UIKit
import ObjectMapper

typealias SuccessClosure = (Any?) -> Void
typealias FailureClosure = (TError?) -> Void

protocol ServiceDelegate : class {
    func didReceiveDataSuccessfully(data: Any, identifier: String)
    func didFailToReceiveData(error: TError, identifer: String)
}

class BaseModel: Mappable {

    weak var delegate : ServiceDelegate?
    
    
    // if back end send code and message
    var code: Int = 0
    var message: String = ""
    var RefreshInterval : Double = 0
    var alertEn : String = ""
    var alertAr : String = ""
    var Ticks: String = ""
    var count: Int = 0
    var endDateInterval: Double = 0
    var sortOption: String = ""
    var sortDirection: String = ""
    
    //MARK: - Initializers
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    convenience init(delegate : ServiceDelegate) {
        
        self.init()
        self.delegate = delegate
        
    }
    
     func mapping(map: Map) {
        
        
        RefreshInterval <- map["RefreshInterval"]
        alertEn <- map["alertEn"]
        alertAr <- map["alertAr"]
        Ticks <- map["Ticks"]
        count <- map["count"]
        endDateInterval <- map["endDate"]
        sortOption <- map["sortOption"]
        sortDirection <- map["sortDirection"]
        
    }
    
    //Mark: - Base Methods
    func startApiRequest(withRequestConfiguration request: RequestConfiguraton , successClouser : @escaping SuccessClosure , failureClouser : @escaping FailureClosure) {
        
        NetworkManager.startRequest(withRequestConfiguration: request, withMappingObject: request.modelClass, successClouser: { (model) in
            successClouser(model)
        }) { (error) in
            failureClouser(error)
        }
    }

}



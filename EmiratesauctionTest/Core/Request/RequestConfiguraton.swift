//
//  RequestConfiguraton.swift

import UIKit
import Alamofire



class RequestConfiguraton: NSObject {

    //MARK: - Properties 
    
    var successClouser : NetworkSuccessClosure?
    var failureClouser : NetworkFailureClosure?
    
    
    var requestMethod: HTTPMethod
//    var baseURL: String!
    var path: String!
    var parameters: [String : Any]? = nil
    var headers: [String : String]? = nil
    var modelClass: BaseModel? = nil
    
    var CompleteURL : String {
        let fullURL =  self.path
        return fullURL!
    }
    
    
    //MARK: Initiazlizers 


    
    init(withRequest request : RequestConfiguraton) {
        
        self.requestMethod = request.requestMethod
        self.parameters = request.parameters
        self.headers = request.headers
        self.path = baseURL + path
        self.modelClass = request.modelClass
        
        
    }
    
    init(WithRequestMethod requestMethod: HTTPMethod,
         Path path: String,
         modelClass : BaseModel,
         parameters: [String : Any]?,
         Headers headers: [String: String]?){
        
        self.requestMethod = requestMethod
        self.parameters = parameters
        self.path = baseURL + path
        self.modelClass = modelClass
    }
  
  init(WithRequestMethod requestMethod: HTTPMethod,
       fullURL url: String,
       modelClass : BaseModel,
       parameters: [String : Any]?,
       Headers headers: [String: String]?){
    
    self.requestMethod = requestMethod
    self.parameters = parameters
    self.headers = headers
    self.path = url
    self.modelClass = modelClass
  }
  

  
    //MARK: - helpingMethods
  
    class func createRequestConfiguration( requestMethod: HTTPMethod,
                                           path: String,
                                           modelClass : BaseModel,
                                           parameters: [String : Any]?,
                                           headers: [String: String]?) -> RequestConfiguraton{
     
        let request = RequestConfiguraton(WithRequestMethod: requestMethod,
                                              Path: path,
                                              modelClass : modelClass,
                                              parameters: parameters,
                                              Headers: headers)
        
        return request
    }
    
}

//
//  LastRequest.swift
import UIKit

final class LastRequest: NSObject {
    
    static var request = LastRequest()
    
    var lastRequests : [RequestConfiguraton] = [RequestConfiguraton]()
    

}

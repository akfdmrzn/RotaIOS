//
//  CalendarAsyncRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 27.05.2021.
//

import Foundation
import ObjectMapper

public class CalendarAsyncRequestModel: Mappable{
    
    public var checkMyTripId: String!
    
    
    public required init?(map: Map) {
        
    }
    
    public init(checkMyTripId: String) {
        self.checkMyTripId = checkMyTripId
    }
    
    public func mapping(map: Map) {
        checkMyTripId <- map["CheckMyTripId"]
    }
    
}

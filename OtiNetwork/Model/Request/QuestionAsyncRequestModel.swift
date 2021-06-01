//
//  QuestionAsyncRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 1.06.2021.
//

import Foundation
import ObjectMapper

public class QuestionAsyncRequestModel: Mappable{
    
    public var checkMyTripId: String!
    public var reservationTypeName: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(checkMyTripId: String,reservationTypeName : String) {
        self.checkMyTripId = checkMyTripId
        self.reservationTypeName = reservationTypeName
    }
    
    public func mapping(map: Map) {
        checkMyTripId <- map["CheckMyTripId"]
        reservationTypeName <- map["ReservationTypeName"]
    }
}

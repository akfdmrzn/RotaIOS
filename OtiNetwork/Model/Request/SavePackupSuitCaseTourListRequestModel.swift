//
//  SavePackupSuitCaseTourListRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 25.03.2021.
//

import Foundation
import ObjectMapper

public class SavePackupSuitCaseTourListRequestModel: Mappable{
    
    public var customerId:Int!
    public var tourId:String!
    public var status:Int!
                
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int,tourId : String,status : Int) {
        self.customerId = customerId
        self.tourId = tourId
        self.status = status
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        status <- map["Status"]
    }
}

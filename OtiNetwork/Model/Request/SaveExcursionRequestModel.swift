//
//  SaveExcursionRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 18.08.2021.
//

import Foundation
import ObjectMapper

public class SaveExcursionRequestModel: Mappable{
    
    public var destinationId: Int?
    public var customerId: Int?
    public var excursionId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(destinationId: Int,customerId: Int,excursionId : Int) {
        self.destinationId = destinationId
        self.customerId = customerId
        self.excursionId = excursionId
    }
    
    public func mapping(map: Map) {
        destinationId <- map["DestinationId"]
        customerId <- map["CustomerId"]
        excursionId <- map["ExcursionId"]
    }
}

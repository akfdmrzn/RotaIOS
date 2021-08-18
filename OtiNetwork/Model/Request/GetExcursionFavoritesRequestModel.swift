//
//  GetExcursionFavoritesRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 18.08.2021.
//

import Foundation
import ObjectMapper

public class GetExcursionFavoritesRequestModel: Mappable{
    
    public var customerId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int) {
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
    }
}

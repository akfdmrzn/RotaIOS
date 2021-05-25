//
//  GetDetailRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 20.05.2021.
//

import Foundation
import ObjectMapper

public class GetDetailRequestModel: Mappable{
    
    public var countryId: Int!
    public var excursionId: Int!
    public var userId: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int, excursionId: Int, userId: Int) {
        self.countryId = countryId
        self.excursionId = excursionId
        self.userId = userId
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        excursionId <- map["ExcursionId"]
        excursionId <- map["UserId"]
    }
    
}

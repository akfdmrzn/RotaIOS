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
    public var countryName: String!
    public var excursionId: Int!
    public var userId: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int, countryName: String, excursionId: Int, userId: Int) {
        self.countryId = countryId
        self.countryName = countryName
        self.excursionId = excursionId
        self.userId = userId
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        countryName <- map["CountryName"]
        excursionId <- map["ExcursionId"]
        excursionId <- map["UserId"]
    }
    
}

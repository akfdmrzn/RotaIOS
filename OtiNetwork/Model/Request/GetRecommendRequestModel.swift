//
//  GetRecommendRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.05.2021.
//

import Foundation
import ObjectMapper

public class GetRecommendRequestModel: Mappable{
    
    public var countryId:Int!
    public var countryName:String!
    public var userId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int,countryName : String,userId : Int) {
        self.countryId = countryId
        self.countryName = countryName
        self.userId = userId
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        countryName <- map["CountryName"]
        userId <- map["UserId"]
    }
    
}

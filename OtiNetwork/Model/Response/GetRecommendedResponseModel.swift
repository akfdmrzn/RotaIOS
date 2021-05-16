//
//  GetRecommendedResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 16.05.2021.
//

import Foundation
import ObjectMapper

public class GetRecommendedResponseModel: Mappable {
    
    public var operatorId: Int!
    public var countryId: Int!
    public var bestSellerList: ExcursionSeller!
    public var recommendedList: ExcursionSeller!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        operatorId <- map["operatorId"]
        countryId <- map["countryId"]
        bestSellerList <- map["bestSeller"]
        recommendedList <- map["recommended"]
        
    }
    
}


public class ExcursionSeller: Mappable {
    
    public var excursionName: String!
    public var imageLink: String!
    public var priceType: String!
    public var priceInfo: Double!
    public var currency: String!
    public var excursionId: Int!
    public var totalCount: Int!
    public var durationId: Int!
    public var durationName: String!
    public var isFavourite: Bool!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        excursionName <- map["excursionName"]
        imageLink <- map["imageLink"]
        priceType <- map["priceType"]
        priceInfo <- map["priceInfo"]
        currency <- map["Currency"]
        excursionId <- map["excursionId"]
        totalCount <- map["totalCount"]
        durationId <- map["durationId"]
        durationName <- map["durationName"]
        isFavourite <- map["IsFavorite"]
        
    }
}

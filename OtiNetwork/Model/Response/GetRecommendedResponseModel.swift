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
    public var bestSellerList: [ExcursionSeller]!
    public var recommendedList: [ExcursionSeller]!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        operatorId <- map["OperatorId"]
        countryId <- map["CountryId"]
        bestSellerList <- map["BestSeller"]
        recommendedList <- map["Recommended"]
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
    public var isBestSeller: Bool!
    public var isRecommended: Bool!
    public var isNew: Bool!
    public var id_: Int!
    public var isVandable: Int!
    public var durationImageLink: String!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        excursionName <- map["Name"]
        imageLink <- map["ImageUrl"]
        priceType <- map["PriceType"]
        priceInfo <- map["Price"]
        currency <- map["PriceCurrency"]
        excursionId <- map["excursionId"]
        totalCount <- map["totalCount"]
        durationId <- map["durationId"]
        durationName <- map["durationName"]
        isFavourite <- map["IsFavorite"]
        isBestSeller <- map["IsBestSeller"]
        isRecommended <- map["IsRecommended"]
        isNew <- map["IsNew"]
        id_ <- map["Id"]
        isVandable <- map["IsVendable"]
        durationImageLink <- map["DurationImageLink"]
    }
}

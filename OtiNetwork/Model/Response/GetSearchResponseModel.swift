//
//  GetSearchResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.05.2021.
//


import Foundation
import ObjectMapper

public class GetSearchResponseModel: Mappable {
    
    public var id_: Int!
    public var day: String!
    public var name: String!
    public var dayString: String!
    public var priceType: String!
    public var price: Double!
    public var priceCurrency: String!
    public var imageUrl: String!
    public var isRecommended: Bool!
    public var isNew: Bool!
    public var isBestSeller: Bool!
    public var passportRequired: Bool!
    public var isVendable: Bool!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id_ <- map["Id"]
        day <- map["Day"]
        name <- map["Name"]
        dayString <- map["DayString"]
        priceType <- map["PriceType"]
        priceCurrency <- map["PriceCurrency"]
        imageUrl <- map["ImageUrl"]
        isRecommended <- map["IsRecommended"]
        isNew <- map["IsNew"]
        isBestSeller <- map["IsBestSeller"]
        passportRequired <- map["PassportRequired"]
        isVendable <- map["IsVendable"]
        
    }
}

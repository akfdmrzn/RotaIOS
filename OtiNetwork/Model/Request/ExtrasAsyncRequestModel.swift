//
//  ExtrasAsyncRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.06.2021.
//

import Foundation
import ObjectMapper

public class ExtrasAsyncRequestModel: Mappable{
    
    public var countryId: Int!
    public var excursionId: Int!
    public var hotelId: Int!
    public var excursionDate: String!
    public var saleDate: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int,excursionId : Int,hotelId : Int,excursionDate : String,saleDate : String) {
        self.countryId = countryId
        self.excursionId = excursionId
        self.hotelId = hotelId
        self.excursionDate = excursionDate
        self.saleDate = saleDate
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        excursionId <- map["ExcursionId"]
        hotelId <- map["HotelId"]
        excursionDate <- map["ExcursionDate"]
        saleDate <- map["SaleDate"]
    }
}

//
//  GetSearchRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.05.2021.
//

import Foundation
import ObjectMapper

public class GetSearchRequestModel: Mappable{
    
    public var countryId:Int!
    public var hotelId:Int!
    public var areaIds:[Int]!
    public var durationIds:[Int]!
    public var typeIds:[Int]!
    public var startDate:String!
    public var endDate:String!
    public var priceMin:Int!
    public var priceMax:Int!
    public var allowedChild:Bool!
    public var allowedTdl:Bool!
    public var allowedInf:Bool!
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int,hotelId : Int,areaIds : [Int],durationIds : [Int],typeIds: [Int],startDate : String,endDate : String,priceMin : Int,priceMax : Int,allowedChild : Bool ,allowedTdl : Bool, allowedInf : Bool) {
        self.countryId = countryId
        self.hotelId = hotelId
        self.areaIds = areaIds
        self.durationIds = durationIds
        self.typeIds = typeIds
        self.startDate = startDate
        self.endDate = endDate
        self.priceMin = priceMin
        self.priceMax = priceMax
        self.allowedChild = allowedChild
        self.allowedTdl = allowedTdl
        self.allowedInf = allowedInf
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        hotelId <- map["HotelId"]
        areaIds <- map["AreaIds"]
        durationIds <- map["DurationIds"]
        typeIds <- map["TypeIds"]
        startDate <- map["StartDate"]
        endDate <- map["EndDate"]
        priceMin <- map["priceMin"]
        priceMax <- map["priceMax"]
        allowedChild <- map["AllowedChild"]
        allowedTdl <- map["AllowedTdl"]
        allowedInf <- map["AllowedInf"]
    }
    
}

//
//  GetPackupSuitCaseTourListResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 22.03.2021.
//

import Foundation
import ObjectMapper

public class GetPackupSuitCaseTourListResponseModel : Mappable {
    public var customerId : String!
    public var tourId : String!
    public var tourName : String!
    public var hotelName : String!
    public var imgUrl : String!
    public var tourBeginDate : String!
    public var tourEndDate : String!

    public required init?(map: Map){
        
    }

    public func mapping(map: Map) {

        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        tourName <- map["TourName"]
        hotelName <- map["HotelName"]
        imgUrl <- map["ImgUrl"]
        tourBeginDate <- map["TourBeginDate"]
        tourEndDate <- map["TourEndDate"]
    }

}

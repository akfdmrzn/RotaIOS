//
//  GetActualTripResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetActualTripResponseModel: Mappable {
    
    public var iD: String = ""
    public var surveyStatus = false
    public var voucher = 0
    public var tourBeginDate = ""
    public var tourBeginDateString = ""
    public var tourEnDate = ""
    public var tourEnDateString = ""
    public var reservationDate = ""
    public var reservationDateString = ""
    public var reservationType = ""
    public var countryName = ""
    public var toArea = ""
    public var tourName = ""
    public var hotelName = ""
    public var rate = 0
    public var hotelImageUrl = ""
    public var touristId = 0
    public var incomingId = 0
    public var excursionActivedStatus = false
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        surveyStatus <- map["SurveyStatus"]
        voucher <- map["Voucher"]
        tourBeginDate <- map["TourBeginDate"]
        tourBeginDateString <- map["TourBeginDateString"]
        tourEnDate <- map["TourEnDate"]
        tourEnDateString <- map["TourEnDateString"]
        reservationDate <- map["ReservationDate"]
        reservationDateString <- map["ReservationDateString"]
        reservationType <- map["ReservationType"]
        countryName <- map["CountryName"]
        toArea <- map["ToArea"]
        tourName <- map["TourName"]
        hotelName <- map["HotelName"]
        rate <- map["Rate"]
        hotelImageUrl <- map["ImageUrl"]
        touristId <- map["TouristId"]
        incomingId <- map["IncomingId"]
        excursionActivedStatus <- map["ExcursionActivedStatus"]
    }
}



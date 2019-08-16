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
    
    var iD: String = ""
    var surveyStatus = false
    var voucher = 0
    var tourBeginDate = ""
    var tourBeginDateString = ""
    var tourEnDate = ""
    var tourEnDateString = ""
    var reservationDate = ""
    var reservationDateString = ""
    var reservationType = ""
    var countryName = ""
    var toArea = ""
    var tourName = ""
    var hotelName = ""
    var rate = 0
    var hotelImageUrl = ""
    var touristId = 0
    var incomingId = 0
    
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
    }
}



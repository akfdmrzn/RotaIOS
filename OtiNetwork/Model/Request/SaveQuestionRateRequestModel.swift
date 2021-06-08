//
//  SaveQuestionRateRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 1.06.2021.
//

import UIKit
import ObjectMapper

public class SaveQuestionRateRequestModel: Mappable,Decodable,Encodable{
    
    public var incomingId: Int!
    public var touristId: Int!
    public var customerId: Int!
    public var tourId: String!
    public var hotelId: Int!
    public var surveyList: [SurveyResponses]!
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int,touristId : Int,customerId : Int,tourId : String,hotelId : Int,surveyList : [SurveyResponses]) {
        self.incomingId = incomingId
        self.touristId = touristId
        self.customerId = customerId
        self.tourId = tourId
        self.hotelId = hotelId
        self.surveyList = surveyList
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        touristId <- map["TouristId"]
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        hotelId <- map["HotelId"]
        surveyList <- map["SurveyResponses"]
    }
}

public class SurveyResponses: Mappable,Decodable,Encodable{
    
    public var questionId: Int!
    public var value: String!
    public var surveyId: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(questionId: Int,value : String,surveyId : Int) {
        self.questionId = questionId
        self.value = value
        self.surveyId = surveyId
    }
    
    public func mapping(map: Map) {
        questionId <- map["questionId"]
        value <- map["value"]
        surveyId <- map["surveyId"]
    }
}

//
//  GetWeatherResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 17.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetWeatherResponseModel : Mappable {
    
    
    public var weatherDate : String = ""
    public var country : String = ""
    public var city : String = ""
    public var weatherList : [Weather] = []
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        weatherDate <- map["weaterDate"]
        country <- map["Country"]
        city <- map["City"]
        weatherList <- map["Weater"]
       
    }
    
}

public class Weather : Mappable {
    
    
    public var id : Int = 0
    public var dayAndNightStatus : Int = 0
    public var dayOfWeek : String = ""
    public var expirationTimeUtc : Int = 0
    public var moonPhase : String = ""
    public var moonPhaseCode : String = ""
    public var moonPhaseDay : Int = 0
    public var moonriseTimeLocal : String = ""
    public var moonriseTimeUtc : Int = 0
    public var moonsetTimeLocal : String = ""
    public var moonsetTimeUtc : Int = 0
    public var narrative : String = ""
    public var qpf : Double = 0.0
    public var qpfSnow : Double = 0.0
    public var sunriseTimeLocal : String = ""
    public var sunriseTimeUtc : Int = 0
    public var sunsetTimeLocal : String = ""
    public var sunsetTimeUtc : Int = 0
    public var temperatureMax : Int = 0
    public var temperatureMin : Int = 0
    public var validTimeLocal : String = ""
    public var validTimeUtc : Int = 0
    public var cloudCover : String = ""
    public var dayOrNight : String = ""
    public var daypartName : String = ""
    public var iconCode : String = ""
    public var iconCodeExtend : String = ""
    public var daypartnarrative : String = ""
    public var precipChance : String = ""
    public var precipType : String = ""
    public var daypartqpf : String = ""
    public var daypartqpfSnow : String = ""
    public var imageUrl : String = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
       
        id <- map["Id"]
        dayAndNightStatus <- map["DayAndNightStatus"]
        dayOfWeek <- map["dayOfWeek"]
        expirationTimeUtc <- map["expirationTimeUtc"]
        moonPhase <- map["moonPhase"]
        moonPhaseCode <- map["moonPhaseCode"]
        moonPhaseDay <- map["moonPhaseDay"]
        moonriseTimeLocal <- map["moonriseTimeLocal"]
        moonriseTimeUtc <- map["moonriseTimeUtc"]
        narrative <- map["narrative"]
        qpf <- map["qpf"]
        qpfSnow <- map["qpfSnow"]
        sunriseTimeLocal <- map["sunriseTimeLocal"]
        sunriseTimeUtc <- map["sunriseTimeUtc"]
        sunsetTimeLocal <- map["sunsetTimeLocal"]
        sunsetTimeUtc <- map["sunsetTimeUtc"]
        temperatureMax <- map["temperatureMax"]
        temperatureMin <- map["temperatureMin"]
        validTimeLocal <- map["validTimeLocal"]
        validTimeUtc <- map["validTimeUtc"]
        cloudCover <- map["cloudCover"]
        dayOrNight <- map["dayOrNight"]
        daypartName <- map["daypartName"]
        iconCode <- map["iconCode"]
        iconCodeExtend <- map["iconCodeExtend"]
        daypartnarrative <- map["daypartnarrative"]
        precipChance <- map["precipChance"]
        precipType <- map["precipType"]
        daypartqpf <- map["daypartqpf"]
        daypartqpfSnow <- map["daypartqpfSnow"]
        imageUrl <- map["ImageUrl"]
        
    }
    
}

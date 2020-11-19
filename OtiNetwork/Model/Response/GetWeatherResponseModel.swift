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
    public var cloudCover : Int = 0
    public var dayOrNight : String = ""
    public var daypartName : String = ""
    public var iconCode : String = ""
    public var iconCodeExtend : Int = 0
    public var daypartnarrative : String = ""
    public var precipChance : Int = 0
    public var precipType : String = ""
    public var daypartqpf : Double = 0.0
    public var daypartqpfSnow : Double = 0.0
    public var relativeHumidity : Int = 0
    public var snowRange : String = ""
    public var temperature : Int = 0
    public var temperatureHeatIndex : Int = 0
    public var temperatureWindChill : Int = 0
    public var thunderIndex : Int = 0
    public var uvDescription : String = ""
    public var uvIndex : Int = 0
    public var windDirection : Int = 0
    public var windDirectionCardinal : String = ""
    public var windPhrase : String = ""
    public var windSpeed : Int = 0
    public var wxPhraseLong : String = ""
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
        relativeHumidity <- map["daypartqpfSnow"]
        snowRange <- map["snowRange"]
        temperature <- map["temperature"]
        temperatureHeatIndex <- map["temperatureHeatIndex"]
        temperatureWindChill <- map["temperatureWindChill"]
        thunderIndex <- map["thunderIndex"]
        uvDescription <- map["uvDescription"]
        uvIndex <- map["uvIndex"]
        windDirection <- map["windDirection"]
        windDirectionCardinal <- map["windDirectionCardinal"]
        windPhrase <- map["windPhrase"]
        windSpeed <- map["windSpeed"]
        wxPhraseLong <- map["wxPhraseLong"]
        imageUrl <- map["ImageUrl"]
        
    }
    
}

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
    public var maxForecast : String = ""
    public var minForecast : Int = 0
    public var status : String = ""
    public var wind : String = ""
    public var feelsLike : Int = 0
    public var visibility : String = ""
    public var humidity : Int = 0
    public var dewPoint : Int = 0
    public var isFuture : Bool = false
    public var imageLink : String = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        weatherDate <- map["WeatherDate"]
        country <- map["Country"]
        city <- map["City"]
        maxForecast <- map["MaxForecast"]
        minForecast <- map["MinForecast"]
        status <- map["Status"]
        wind <- map["Wind"]
        feelsLike <- map["FeelsLike"]
        visibility <- map["Visibility"]
        humidity <- map["Humidity"]
        dewPoint <- map["DewPoint"]
        isFuture <- map["IsFuture"]
        imageLink <- map["ImageLink"]
        
    }
    
}


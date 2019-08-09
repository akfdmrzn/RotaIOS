//
//  GetWeatherResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 17.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetWeatherResponseModel : Mappable {
    var weatherDate : String = ""
    var country : String = ""
    var city : String = ""
    var maxForecast : String = ""
    var minForecast : Int = 0
    var status : String = ""
    var wind : String = ""
    var feelsLike : Int = 0
    var visibility : String = ""
    var humidity : Int = 0
    var dewPoint : Int = 0
    var isFuture : Bool = false
    var imageLink : String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
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


//
//  GetWeatherRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 17.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetWeatherRequestModel:Mappable{
    
    public var weatherDateStart:String!
    public var weatherDateEnd:String!
    public var country:String!
    public var city:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(weatherDateStart: String, weatherDateEnd: String, country: String,city : String) {
        self.weatherDateStart = weatherDateStart
        self.weatherDateEnd = weatherDateEnd
        self.country = country
        self.city = city
    }
    
    public func mapping(map: Map) {
        weatherDateStart <- map["WeatherDateStart"]
        weatherDateEnd <- map["WeatherDateEnd"]
        country <- map["Country"]
        city <- map["City"]
    }
}

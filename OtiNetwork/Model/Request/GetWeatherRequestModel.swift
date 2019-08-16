//
//  GetWeatherRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 17.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetWeatherRequestModel: Mappable {
   
    public var weatherDateStart:String!
    public var weatherDateEnd:String!
    public var city:String!
    public var country:String!
    public var languageId:String!
    
    public required init?(map: Map) {
        
    }
    public init(weatherDateStart:String,weatherDateEnd:String,city :String,country : String,languageId : String) {
        self.weatherDateStart = weatherDateStart
        self.weatherDateEnd = weatherDateEnd
        self.city = city
        self.country = country
        self.languageId = languageId
    }
    public func mapping(map: Map) {
        
    }
    public func toParameterStringArray() ->[String] {
        var arrayString :[String] = []
        arrayString.append(self.weatherDateStart) 
        arrayString.append(self.weatherDateEnd)
        arrayString.append(self.city)
        arrayString.append(self.country)
        arrayString.append(self.languageId)
        
        return arrayString
    }
}

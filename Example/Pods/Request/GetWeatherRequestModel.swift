//
//  GetWeatherRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 17.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetWeatherRequestModel: Mappable {
   
    var weatherDateStart:String!
    var weatherDateEnd:String!
    var city:String!
    var country:String!
    var languageId:String!
    
    required init?(map: Map) {
        
    }
    init(weatherDateStart:String,weatherDateEnd:String,city :String,country : String,languageId : String) {
        self.weatherDateStart = weatherDateStart
        self.weatherDateEnd = weatherDateEnd
        self.city = city
        self.country = country
        self.languageId = languageId
    }
    func mapping(map: Map) {
        
    }
    func toParameterStringArray() ->[String] {
        var arrayString :[String] = []
        arrayString.append(self.weatherDateStart) 
        arrayString.append(self.weatherDateEnd)
        arrayString.append(self.city)
        arrayString.append(self.country)
        arrayString.append(self.languageId)
        
        return arrayString
    }
}

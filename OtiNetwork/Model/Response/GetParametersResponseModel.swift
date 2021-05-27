//
//  GetParametersResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 4.05.2021.
//

import UIKit
import ObjectMapper

public class GetParametersResponseModel: Mappable {
    public var countryList: [ParametersModel]?
    public var typeList: [ParametersModel]?
    public var durationsList: [ParametersModel]?
    public var areaList: [ParametersModel]?
    
    public init() {
        
    }
    
    public required init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        countryList <- map["Countrys"]
        durationsList <- map["Durations"]
        typeList <- map["Types"]
        areaList <- map["Areas"]
        
    }
}
    
    public class ParametersModel: Mappable{
        public var id: Int!
        public var languageCode: String!
        public var name: String!
        public var status: Int!
        public var gksId: Int!
        public var countryGksId: Int!
        public var isOdeon: Int!
        public var isSelected: Bool = false
        
        public init() {
            
        }
        
        public required init?(map: Map){
        }
        
        public func mapping(map: Map) {
            id <- map["id"]
            languageCode <- map["languageCode"]
            name <- map["name"]
            status <- map["status"]
            gksId <- map["gksId"]
            countryGksId <- map["countryGksId"]
            isOdeon <- map["isOdeon"]
        }
    }

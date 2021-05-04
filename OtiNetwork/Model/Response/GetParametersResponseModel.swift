//
//  GetParametersResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 4.05.2021.
//

import UIKit
import ObjectMapper

public class GetParametersResponseModel: Mappable {
    public var countryList: Parameters?
    public var typeList: Parameters?
    public var durationsList: Parameters?
    public var areaList: Parameters?
    
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
    
    public class Parameters: Mappable{
        public var id: Int!
        public var languageCode: String!
        public var name: String!
        public var status: Int!
        public var gksId: Int!
        public var countryGksId: Int!
        
        
        public init() {
            
        }
        
        public required init?(map: Map){
        }
        
        public func mapping(map: Map) {
            id <- map["ID"]
            languageCode <- map["languageCode"]
            name <- map["name"]
            status <- map["status"]
            gksId <- map["gksId"]
            countryGksId <- map["countryGksId"]
        }
    }

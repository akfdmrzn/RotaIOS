//
//  GetAreaRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 4.05.2021.
//

import Foundation
import ObjectMapper

public class GetAreaRequestModel: Mappable{
    
    public var countryId:Int!
                
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int) {
        self.countryId = countryId
    }
    
    public func mapping(map: Map) {
        countryId <- map["CountryId"]
    }
}
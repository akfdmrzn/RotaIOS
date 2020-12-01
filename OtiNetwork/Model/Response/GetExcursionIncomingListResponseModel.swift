//
//  GetExcursionIncomingListResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 1.12.2020.
//

import Foundation
import ObjectMapper

public class GetExcursionIncomingListResponseModel: Mappable {
    
    public var  id = 0
    public var  countryId = 0
    public var  countryName = ""
    
    public required init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        countryId <- map["CountryId"]
        countryName <- map["CountryName"]
        
    }
    
}

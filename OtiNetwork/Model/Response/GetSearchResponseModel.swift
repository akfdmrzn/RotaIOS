//
//  GetSearchResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.05.2021.
//


import Foundation
import ObjectMapper

public class GetSearchResponseModel: Mappable {
    
    public var url: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(url: String) {
        self.url = url
    }
    
    public func mapping(map: Map) {
        url <- map["Url"]
        
    }
    
}

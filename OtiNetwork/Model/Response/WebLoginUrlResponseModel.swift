//
//  WebLoginUrlResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 11.05.2021.
//

import Foundation
import ObjectMapper

public class WebLoginUrlResponseModel: Mappable {
    
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

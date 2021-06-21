//
//  ReceivePaymentResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 21.06.2021.
//

import UIKit
import ObjectMapper

public class ReceivePaymentResponseModel: Mappable {
    
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

//
//  GetBonusLoyaltyResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.10.2020.
//

import Foundation
import ObjectMapper

public class GetBonusLoyaltyResponseModel: Mappable {
    
    public var status: Bool!
    public var message: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(status: Bool,message : String) {
        self.status = status
        self.message = message
    }
    
    public func mapping(map: Map) {
        status <- map["Status"]
        message <- map["Message"]
        
    }
    
}

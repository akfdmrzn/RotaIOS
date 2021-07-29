//
//  GetUserPaymentsRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.07.2021.
//

import Foundation
import ObjectMapper

public class GetUserPaymentsRequestModel: Mappable{
    
    public var userId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(userId: Int) {
        self.userId = userId
    }
    
    public func mapping(map: Map) {
        userId <- map["UserId"]
    }
}

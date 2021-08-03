//
//  CalculateRefundRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 3.08.2021.
//

import Foundation
import ObjectMapper

public class CalculateRefundRequestModel: Mappable{
    
    public var userId: Int?
    public var threadGuid: String?
    
    public required init?(map: Map) {
        
    }
    
    public init(userId: Int,threadGuid : String) {
        self.userId = userId
        self.threadGuid = threadGuid
    }
    
    public func mapping(map: Map) {
        userId <- map["UserId"]
        threadGuid <- map["ThreadGuid"]
    }
}

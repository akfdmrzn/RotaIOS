//
//  GetStatusRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 8.07.2021.
//

import Foundation
import ObjectMapper

public class GetStatusRequestModel: Mappable{
    
    public var threadGuid: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(threadGuid: String) {
        self.threadGuid = threadGuid
    }
    
    public func mapping(map: Map) {
        threadGuid <- map["ThreadGuid"]
    }
}

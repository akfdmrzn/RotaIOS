//
//  GetTransferTypeListResponseModel.swift
//  OtiNetwork
//
//  Created by Cüneyt AYVAZ on 3.10.2019.
//

import Foundation
import ObjectMapper

public class GetTransferTypeListResponseModel: Mappable {
    
    public var id: Int!
    public var name: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        name <- map["Name"]
        
    }
    
}

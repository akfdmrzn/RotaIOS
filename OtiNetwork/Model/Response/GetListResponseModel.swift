//
//  GetListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetListResponseModel: Mappable,Decodable,Encodable {
    
    public var id = 0
    public var partnerNumber = 0
    public var name = ""
    public var value = ""
    public var type = ""
    public var subItemState = false
    public var subItems: [SubItem] = []
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        value <- map["Value"]
        type <- map["Type"]
        subItemState <- map["SubItemState"]
        subItems <- map["SubItems"]
    }
}

public class SubItem: Mappable,Decodable,Encodable {
    public var id = 0
    public var partnerNumber = 0
    public var name = ""
    public var type = ""
    public var value = false
    
    public init() {
        id = 0
        partnerNumber = 0
        name = "cnyt"
        type = ""
        value = true
    }
    
    public required init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        value <- map["Value"]
        type <- map["Type"]
    }
}



//
//  GetListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetListResponseModel: Mappable {
    
    var id = 0
    var partnerNumber = 0
    var name = ""
    var value = ""
    var type = ""
    var subItemState = false
    var subItems: [SubItem] = []
    
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

public class SubItem: Mappable {
    var id = 0
    var partnerNumber = 0
    var name = ""
    var type = ""
    var value = false
    
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



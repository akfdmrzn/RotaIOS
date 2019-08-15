//
//  GetListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetListResponseModel: Mappable {
    
    var id = 0
    var partnerNumber = 0
    var name = ""
    var value = ""
    var type = ""
    var subItemState = false
    var subItems: [SubItem] = []
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        value <- map["Value"]
        type <- map["Type"]
        subItemState <- map["SubItemState"]
        subItems <- map["SubItems"]
    }
}

class SubItem: Mappable {
    var id = 0
    var partnerNumber = 0
    var name = ""
    var type = ""
    var value = false
    
    init() {
        id = 0
        partnerNumber = 0
        name = "cnyt"
        type = ""
        value = true
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        value <- map["Value"]
        type <- map["Type"]
    }
}



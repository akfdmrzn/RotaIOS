//
//  GetTourDefinationListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTourDefinationListResponseModel : Mappable {
    
    var name: String?
    var typeName: String?
    var typeId: Int?
    var concept: String?
    var duration: String = "0"
    var allotment: String?
    var incomingId: Int?
    var excursionId: Int?
    var imageUrl: String = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        name <- map["Name"]
        typeName <- map["TypeName"]
        typeId <- map["TypeId"]
        concept <- map["Concept"]
        duration <- map["Duration"]
        allotment <- map["Allotment"]
        incomingId <- map["IncomingId"]
        excursionId <- map["ExcursionId"]
        imageUrl <- map["ImageUrl"]
    }
    
}


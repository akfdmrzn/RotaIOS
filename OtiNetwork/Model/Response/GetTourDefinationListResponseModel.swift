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
    
    public var name: String?
    public var typeName: String?
    public var typeId: Int?
    public var concept: String?
    public var duration: String = "0"
    public var allotment: String?
    public var incomingId: Int?
    public var excursionId: Int?
    public var imageUrl: String = ""
    
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


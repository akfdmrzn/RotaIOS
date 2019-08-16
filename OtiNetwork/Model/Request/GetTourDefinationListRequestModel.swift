//
//  GetTourDefinationListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTourDefinationListRequestModel : Mappable {
    public var excursionNameLike : String?
    public var excursionType : Int?
    public var incomingId : Int?
    public var coralTouristId : Int?
    
    
    public required init?(map: Map) {
        
    }
    
    public init(excursionNameLike: String?, excursionType: Int?, incomingId: Int?, coralTouristId : Int?) {
        self.excursionNameLike = excursionNameLike
        self.excursionType = excursionType
        self.incomingId = incomingId
        self.coralTouristId = coralTouristId
    }
    
    public func mapping(map: Map) {
        excursionNameLike <- map["ExcursionNameLike"]
        excursionType <- map["ExcursionType"]
        incomingId <- map["IncomingId"]
        coralTouristId <- map["CoralTouristId"]
    }
    
}

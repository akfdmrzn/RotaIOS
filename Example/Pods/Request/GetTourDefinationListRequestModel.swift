//
//  GetTourDefinationListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetTourDefinationListRequestModel : Mappable {
    var excursionNameLike : String?
    var excursionType : Int?
    var incomingId : Int?
    var coralTouristId : Int?
    
    
    required init?(map: Map) {
        
    }
    
    init(excursionNameLike: String?, excursionType: Int?, incomingId: Int?, coralTouristId : Int?) {
        self.excursionNameLike = excursionNameLike
        self.excursionType = excursionType
        self.incomingId = incomingId
        self.coralTouristId = coralTouristId
    }
    
    func mapping(map: Map) {
        excursionNameLike <- map["ExcursionNameLike"]
        excursionType <- map["ExcursionType"]
        incomingId <- map["IncomingId"]
        coralTouristId <- map["CoralTouristId"]
    }
    
}

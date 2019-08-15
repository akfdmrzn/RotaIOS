//
//  GetGuideInfoOfTouristRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetGuideInfoOfTouristRequestModel:Mappable{
    
    var coralTouristId:Int!
    var incomingId:Int!
    
    required init?(map: Map) {
        
    }
    
    init(coralTouristId:Int, incomingId : Int) {
        self.coralTouristId = coralTouristId
        self.incomingId = incomingId
    }
    
    
    func mapping(map: Map) {
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
    }
}

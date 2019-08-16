//
//  GetGuideInfoOfTouristRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetGuideInfoOfTouristRequestModel:Mappable{
    
    var coralTouristId:Int!
    var incomingId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(coralTouristId:Int, incomingId : Int) {
        self.coralTouristId = coralTouristId
        self.incomingId = incomingId
    }
    
    
    public func mapping(map: Map) {
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
    }
}

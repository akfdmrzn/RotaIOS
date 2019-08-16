//
//  GetSaledExcursionInfoRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 19.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetSaledExcursionInfoRequestModel: Mappable {
    
    var incomingId: Int?
    var touristId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int?, touristId: Int?) {
        self.incomingId = incomingId
        self.touristId = touristId
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        touristId <- map["TouristId"]
    }
    
}



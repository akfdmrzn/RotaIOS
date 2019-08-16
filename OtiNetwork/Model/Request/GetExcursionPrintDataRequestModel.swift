//
//  GetExcursionPrintDataRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetExcursionPrintDataRequestModel: Mappable {
    
    var incomingId: Int?
    var tourSaleId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int?, tourSaleId: Int?) {
        self.incomingId = incomingId
        self.tourSaleId = tourSaleId
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        tourSaleId <- map["TourSaleId"]
    }
    
}

//
//  GetExcursionPrintDataRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetExcursionPrintDataRequestModel: Mappable {
    
    var incomingId: Int?
    var tourSaleId: Int?
    
    required init?(map: Map) {
        
    }
    
    init(incomingId: Int?, tourSaleId: Int?) {
        self.incomingId = incomingId
        self.tourSaleId = tourSaleId
    }
    
    func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        tourSaleId <- map["TourSaleId"]
    }
    
}

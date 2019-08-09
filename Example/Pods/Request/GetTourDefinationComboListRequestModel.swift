//
//  GetTourDefinationComboListRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 11.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation

import ObjectMapper

class GetTourDefinationComboListRequestModel : Mappable {
    
    var incomingId : Int?
    
    required init?(map: Map) {
        
    }
    
    init(incomingId: Int?) {
        self.incomingId = incomingId
    }
    
    func mapping(map: Map) {
        incomingId <- map["IncomingId"]
    }
    
}

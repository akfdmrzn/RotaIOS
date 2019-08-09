//
//  GetNotificationReadRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetNotificationReadRequestModel: Mappable {
    
    var Id:Int!
    
    required init?(map: Map) {
        
    }
    
    init(Id:Int) {
        self.Id = Id
    }
    
    func mapping(map: Map) {
        Id <- map["Id"]
    }
    
}

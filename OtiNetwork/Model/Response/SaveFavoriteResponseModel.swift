//
//  SaveFavoriteResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class SaveFavoriteResponseModel: Mappable {
    
    var value = false
    var message = ""
    var operationStatus = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        value <- map["Value"]
        message <- map["Message"]
        operationStatus <- map["OperationStatus"]
    }
}

//
//  GetTourDefinationComboListResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 11.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetTourDefinationComboListResponseModel : Mappable {
    
    var value: Int?
    var text: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        value <- map["Value"]
        text <- map["Text"]
    }
    
}


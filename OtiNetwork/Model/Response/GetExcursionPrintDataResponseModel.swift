//
//  GetExcursionPrintDataResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetExcursionPrintDataResponseModel: Mappable {
    
    var data: String?
    
    required init?(map: Map) {
        
    }
    
    init(data: String?) {
        self.data = data
    }
    
    func mapping(map: Map) {
        data <- map["Data"]
    }
    
}

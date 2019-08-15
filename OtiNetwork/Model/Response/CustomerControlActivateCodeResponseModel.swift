//
//  CustomerControlActivateCodeResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerControlActivateCodeResponseModel: Mappable {
    
    var status = ""
    var message = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["Status"]
        message <- map["Message"]
    }
}


//
//  CustomerChangePasswordResponse.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerChangePasswordResponseModel: Mappable {
    
    var status = ""
    var message = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["Status"]
        message <- map["Message"]
    }
}


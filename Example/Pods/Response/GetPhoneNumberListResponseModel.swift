//
//  GetPhoneNumberListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetPhoneNumberListResponseModel: Mappable {
    
    var  name = ""
    var  phoneNumber = ""
    var  type = 0
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["Name"]
        phoneNumber <- map["PhoneNumber"]
        type <- map["Type"]
        
    }
}


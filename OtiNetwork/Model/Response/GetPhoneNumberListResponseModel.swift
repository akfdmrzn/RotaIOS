//
//  GetPhoneNumberListResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetPhoneNumberListResponseModel: Mappable {
    
    var  name = ""
    var  phoneNumber = ""
    var  type = 0
    
    public required init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        name <- map["Name"]
        phoneNumber <- map["PhoneNumber"]
        type <- map["Type"]
        
    }
}


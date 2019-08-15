//
//  CheckMyTripRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CheckMyTripRequestModel:Mappable{
    
    var voucherNumber:Int!
    var passportNumber:String!
    
    required init?(map: Map) {
        
    }
    
    init(voucherNumber:Int,passportNumber:String) {
        self.voucherNumber = voucherNumber
        self.passportNumber = passportNumber
    }
    
    
    func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        passportNumber <- map["PassportNumber"]
    }
    
}

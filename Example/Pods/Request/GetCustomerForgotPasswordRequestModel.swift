
//
//  GetCustomerForgotPasswordRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 30.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetCustomerForgotPasswordRequestModel: Mappable {
    
    var email: String?
    var companyId: Int?
    
    required init?(map: Map) {
        
    }
    
    init(email: String?, companyId: Int?) {
        self.email = email
        self.companyId = companyId
    }
    
    func mapping(map: Map) {
        email <- map["Email"]
        companyId <- map["CompanyId"]
    }
    
}

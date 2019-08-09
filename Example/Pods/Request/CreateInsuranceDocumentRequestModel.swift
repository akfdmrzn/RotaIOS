//
//  CreateInsuranceDocumentRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class CreateInsuranceDocumentRequestModel: Mappable {
    
    var voucherNumber: Int?
    var voucherInsuranceDetailNumber: Int?
    
    required init?(map: Map) {
        
    }
    
    init(voucherNumber: Int,voucherInsuranceDetailNumber: Int) {
        self.voucherNumber = voucherNumber
        self.voucherInsuranceDetailNumber = voucherInsuranceDetailNumber
    }
    
    func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        voucherInsuranceDetailNumber <- map["VoucherInsuranceDetailIDs"]
    }
    
}

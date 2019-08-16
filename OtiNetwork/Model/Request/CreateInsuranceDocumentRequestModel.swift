//
//  CreateInsuranceDocumentRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreateInsuranceDocumentRequestModel: Mappable {
    
    var voucherNumber: Int?
    var voucherInsuranceDetailNumber: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int,voucherInsuranceDetailNumber: Int) {
        self.voucherNumber = voucherNumber
        self.voucherInsuranceDetailNumber = voucherInsuranceDetailNumber
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        voucherInsuranceDetailNumber <- map["VoucherInsuranceDetailIDs"]
    }
    
}

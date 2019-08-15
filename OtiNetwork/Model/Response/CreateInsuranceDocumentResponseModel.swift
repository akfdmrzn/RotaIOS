//
//  CreateInsuranceDocumentResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class CreateInsuranceDocumentResponseModel: Mappable {
    
    var voucherInsuranceDetailIDs: Int?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    init(voucherInsuranceDetailIDs: Int?, url: String?) {
        self.voucherInsuranceDetailIDs = voucherInsuranceDetailIDs
        self.url = url
    }
    
    func mapping(map: Map) {
        voucherInsuranceDetailIDs <- map["VoucherInsuranceDetailIDs"]
        url <- map["Url"]
    }
    
}

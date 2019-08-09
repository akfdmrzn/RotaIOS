//
//  CreateVoucherDocumentRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class CreateVoucherDocumentRequestModel: Mappable {
    
    var voucherNumber: Int?
    
    required init?(map: Map) {
        
    }
    
    init(voucherNumber: Int?) {
        self.voucherNumber = voucherNumber
    }
    
    func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
    }
    
}

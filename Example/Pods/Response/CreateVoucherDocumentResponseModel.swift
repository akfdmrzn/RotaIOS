//
//  CreateVoucherDocumentResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class CreateVoucherDocumentResponseModel: Mappable {
    
    var voucherNumber: Int?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    init(voucherNumber: Int?, url: String?) {
        self.voucherNumber = voucherNumber
        self.url = url
    }
    
    func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        url <- map["Url"]
    }
    
}

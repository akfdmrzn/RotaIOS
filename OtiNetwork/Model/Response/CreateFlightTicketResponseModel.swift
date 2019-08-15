//
//  CreateFlightTicketResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class CreateFlightTicketResponseModel: Mappable {
    
    var voucherFlightDetailNumber: Int?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    init(voucherFlightDetailNumber: Int?, url: String?) {
        self.voucherFlightDetailNumber = voucherFlightDetailNumber
        self.url = url
    }
    
    func mapping(map: Map) {
        voucherFlightDetailNumber <- map["VoucherFlightDetailNumber"]
        url <- map["Url"]
    }
    
}

//
//  CreateFlightTicketRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreateFlightTicketRequestModel: Mappable {
    
    var voucherNumber: Int?
    var touristNumber: Int?
    var voucherFlightDetailNumber: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int,touristNumber: Int,voucherFlightDetailNumber: Int) {
        self.voucherNumber = voucherNumber
        self.touristNumber = touristNumber
        self.voucherFlightDetailNumber = voucherFlightDetailNumber
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        touristNumber <- map["TouristNumber"]
        voucherFlightDetailNumber <- map["VoucherFlightDetailNumber"]
    }
    
}

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
    
    public var voucherNumber: Int?
    public var touristNumber: Int?
    public var voucherFlightDetailNumber: Int?
    public var agencyStaff: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int,touristNumber: Int,voucherFlightDetailNumber: Int,agencyStaff : Int) {
        self.voucherNumber = voucherNumber
        self.touristNumber = touristNumber
        self.voucherFlightDetailNumber = voucherFlightDetailNumber
        self.agencyStaff = agencyStaff
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        touristNumber <- map["TouristNumber"]
        voucherFlightDetailNumber <- map["VoucherFlightDetailNumber"]
        agencyStaff <- map["AgencyStaff"]
    }
}

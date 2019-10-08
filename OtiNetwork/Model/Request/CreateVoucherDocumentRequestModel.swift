//
//  CreateVoucherDocumentRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreateVoucherDocumentRequestModel: Mappable {
    
    public var voucherNumber: Int?
    public var agencyStaff: Int?

    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int?,agencyStaff : Int?) {
        self.voucherNumber = voucherNumber
        self.agencyStaff = agencyStaff
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        agencyStaff <- map["AgencyStaff"]
    }
    
}

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
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int?) {
        self.voucherNumber = voucherNumber
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
    }
    
}

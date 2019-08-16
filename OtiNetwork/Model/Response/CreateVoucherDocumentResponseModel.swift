//
//  CreateVoucherDocumentResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 5.08.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreateVoucherDocumentResponseModel: Mappable {
    
    public var voucherNumber: Int?
    public var url: String?
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber: Int?, url: String?) {
        self.voucherNumber = voucherNumber
        self.url = url
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        url <- map["Url"]
    }
    
}

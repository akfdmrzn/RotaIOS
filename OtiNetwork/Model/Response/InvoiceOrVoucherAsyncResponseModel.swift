//
//  InvoiceOrVoucherAsyncResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.06.2021.
//

import UIKit
import ObjectMapper

public class InvoiceOrVoucherAsyncResponseModel: Mappable {
    
    public var url : String?
    public var message : String?
    public var isApproved : Bool?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        url <- map["Url"]
        message <- map["Message"]
        isApproved <- map["IsApproved"]
    }
}

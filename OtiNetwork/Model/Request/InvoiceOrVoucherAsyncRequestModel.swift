//
//  InvoiceOrVoucherAsyncRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.06.2021.
//

import Foundation
import ObjectMapper

public class InvoiceOrVoucherAsyncRequestModel: Mappable{
    
    public var typeId: Int!
    public var email: String!
    public var threadGuid: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(typeId: Int,email : String,threadGuid : String) {
        self.typeId = typeId
        self.email = email
        self.threadGuid = threadGuid
    }
    
    public func mapping(map: Map) {
        typeId <- map["TypeId"]
        email <- map["Email"]
        threadGuid <- map["ThreadGuid"]
    }
}

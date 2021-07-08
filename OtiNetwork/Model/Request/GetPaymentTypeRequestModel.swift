//
//  GetPaymentTypeRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 8.07.2021.
//

import Foundation
import ObjectMapper

public class GetPaymentTypeRequestModel: Mappable{
    
    public var startDate: String!
    public var endDate: String!
    public var saleDate: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(startDate: String,endDate : String,saleDate : String) {
        self.startDate = startDate
        self.endDate = endDate
        self.saleDate = saleDate
    }
    
    public func mapping(map: Map) {
        startDate <- map["StartDate"]
        endDate <- map["EndDate"]
        saleDate <- map["SaleDate"]
    }
}

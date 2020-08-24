//
//  GetBarcodeRequestModel.swift
//  Alamofire
//
//  Created by Akif Demirezen on 24.08.2020.
//

import Foundation
import ObjectMapper

public class GetBarcodeRequestModel: Mappable{
    
    public var companyCode:Int!
    public var voucherNumber:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(companyCode: Int,voucherNumber : Int) {
        self.companyCode = companyCode
        self.voucherNumber = voucherNumber
    }
    
    public func mapping(map: Map) {
        companyCode <- map["CompanyCode"]
        voucherNumber <- map["VoucherNumber"]
    }
    
}

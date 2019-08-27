//
//  GetPDFRequestModel.swift
//  Alamofire
//
//  Created by Akif Demirezen on 27.08.2019.
//

import Foundation
import ObjectMapper

public class GetPDFRequestModel: Mappable {
    
    public var incomingId:Int!
    public var saleId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId:Int,saleId :Int){
        self.incomingId = incomingId
        self.saleId = saleId
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        saleId <- map["SaleId"]
    }
    
}

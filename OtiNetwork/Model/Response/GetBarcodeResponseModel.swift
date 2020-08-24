//
//  GetBarcodeResponseModel.swift
//  Alamofire
//
//  Created by Akif Demirezen on 24.08.2020.
//

import Foundation
import ObjectMapper

public class GetBarcodeResponseModel: Mappable {
    
    public var barcodeUrl: String!
    
    public required init?(map: Map) {
        
    }
    
    public init(barcodeUrl: String) {
        self.barcodeUrl = barcodeUrl
    }
    
    public func mapping(map: Map) {
        barcodeUrl <- map["BarcodeUrl"]
        
    }
    
}

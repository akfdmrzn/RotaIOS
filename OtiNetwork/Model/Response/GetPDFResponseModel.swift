//
//  GetPDFResponseModel.swift
//  Alamofire
//
//  Created by Akif Demirezen on 27.08.2019.
//

import Foundation
import ObjectMapper

public class GetPDFResponseModel : Mappable {
    public var link : String = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        link <- map["Link"]
        
    }
    
}

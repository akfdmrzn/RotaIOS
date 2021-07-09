//
//  GetPaymentTypeResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 8.07.2021.
//

import UIKit
import ObjectMapper

public class GetPaymentTypeResponseModel: Mappable {
    
    public var id : Int?
    public var name : String?
    public var image : String?
    public var isSelected : Bool?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        id <- map["PayId"]
        name <- map["Name"]
        image <- map["Image"]
    }
}

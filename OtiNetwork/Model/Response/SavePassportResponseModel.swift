//
//  SavePassportResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 24.06.2021.
//

import UIKit
import ObjectMapper

public class SavePassportResponseModel: Mappable {
    
    public var idList: [Int]?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        idList <- map[""]
    }
}

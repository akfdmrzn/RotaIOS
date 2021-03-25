//
//  DeleteCustomSuitcaseRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 25.03.2021.
//

import Foundation
import ObjectMapper

public class DeleteCustomSuitcaseRequestModel: Mappable{
    
    public var packUpId:Int!
                
    public required init?(map: Map) {
        
    }
    
    public init(packUpId: Int) {
        self.packUpId = packUpId
    }
    
    public func mapping(map: Map) {
        packUpId <- map["PackupId"]
    }
    
}

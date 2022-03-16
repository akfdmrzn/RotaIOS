//
//  GetTourEventDetailRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import Foundation
import ObjectMapper

public class GetTourEventDetailRequestModel : Mappable {
    public var ids: String = ""
    public var typeInt: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(ids : String, typeInt: String) {
        self.ids = ids
        self.typeInt = typeInt
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?ids=\(self.ids)&typeInt=\(self.typeInt)"
    }
}

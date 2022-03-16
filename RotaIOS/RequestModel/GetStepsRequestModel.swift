//
//  GetStepsRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepsRequestModel : Mappable {
    public var ids: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(ids : String) {
        self.ids = ids
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?ids=\(self.ids)"
    }
}

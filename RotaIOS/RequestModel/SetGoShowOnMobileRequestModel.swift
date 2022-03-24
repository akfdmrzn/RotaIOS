//
//  SetGoShowOnMobileRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import Foundation
import ObjectMapper

public class SetGoShowOnMobileRequestModel : Mappable {
    public var planId: String = ""
    public var voucherId: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(planId : String, voucherId: String) {
        self.planId = planId
        self.voucherId = voucherId
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?planId=\(self.planId)&voucherId=\(self.voucherId)"
    }
}

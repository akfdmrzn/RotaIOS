//
//  GetInfoPaxesRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetInfoPaxesRequestModel : Mappable{
    public var infoPlanId : String!
    
    public required init?(map: Map) {
        
    }
    
    public init( infoPlanId : String) {
        self.infoPlanId = infoPlanId
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?infoPlanId=\(self.infoPlanId ?? "")"
    }
}

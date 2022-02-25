//
//  GetArrAndDepHotelListForMobileRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 27.12.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetArrAndDepHotelListForMobileRequestModel : Mappable{
    public var planId : String!
    public var typeInt : String!
    
    public required init?(map: Map) {
        
    }
    
    public init( planId : String, typeInt : String) {
        self.planId = planId
        self.typeInt = typeInt
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?planId=\(self.planId ?? "")&typeInt=\(self.typeInt ?? "")"
    }
}

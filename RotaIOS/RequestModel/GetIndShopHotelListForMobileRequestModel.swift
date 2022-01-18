//
//  GetIndShopHotelListForMobileRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetIndShopHotelListForMobileRequestModel : Mappable{
    public var planIds : String!
    public var typeInt : String!
    
    public required init?(map: Map) {
        
    }
    
    public init( planIds : String, typeInt : String) {
        self.planIds = planIds
        self.typeInt = typeInt
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?planIds=\(self.planIds ?? "")&typeInt=\(self.typeInt ?? "")"
    }
}

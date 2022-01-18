//
//  GetIndShopPaxesRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetIndShopPaxesRequestModel : Mappable{
    public var planId : String!
    public var hotelId : String!
    public var typeInt: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(planId : String, hotelId : String, typeInt: Int) {
        self.planId = planId
        self.hotelId = hotelId
        self.typeInt = typeInt
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?planId=\(self.planId ?? "")&hotelId=\(self.hotelId ?? "")&typeInt=\(self.typeInt ?? 0)"
    }
}

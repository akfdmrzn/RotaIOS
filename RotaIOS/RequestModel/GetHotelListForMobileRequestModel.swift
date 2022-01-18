//
//  GetHotelListForMobileRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 27.12.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetHotelListForMobileRequestModel : Mappable{
    public var guideId : String!
    public var ids : String!
    public var typeInt: String!
    
    public required init?(map: Map) {
        
    }
    
    public init( guideId : String, ids : String, typeInt: String) {
        self.guideId = guideId
        self.ids = ids
        self.typeInt = typeInt
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?guideId=\(self.guideId ?? "")&ids=\(self.ids ?? "")&typeInt=\(self.typeInt ?? "")"
    }
}

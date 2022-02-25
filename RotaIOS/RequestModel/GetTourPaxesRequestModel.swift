//
//  GetTourPaxesRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetTourPaxesRequestModel : Mappable{
    public var planId : String!
    public var hotelId : String!
    public required init?(map: Map) {
        
    }
    
    public init(planId : String, hotelId : String) {
        self.planId = planId
        self.hotelId = hotelId
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?planId=\(self.planId ?? "")&hotelId=\(self.hotelId ?? "")"
    }
}

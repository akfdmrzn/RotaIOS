//
//  UpdateArrAndDepPlanNoShowRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 19.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  UpdateArrAndDepPlanNoShowRequestModel : Mappable{
    public var data : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(data : String) {
        self.data = data
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?data=\(self.data ?? "")"
    }
}

//
//  GetPayPreBookingRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 29.04.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetPayPreBookingRequestModel : Mappable{
    public var data : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(  data : String) {
        self.data = data
    }
    
    public func mapping(map: Map) {
        data <- map["data"]
    }
}

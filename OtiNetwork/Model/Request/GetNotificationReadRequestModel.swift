//
//  GetNotificationReadRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetNotificationReadRequestModel: Mappable {
    
    public var Id:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(Id:Int) {
        self.Id = Id
    }
    
    public func mapping(map: Map) {
        Id <- map["Id"]
    }
    
}

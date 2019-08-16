//
//  ShortLogin.swift
//  BaseProject
//
//  Created by Bekir's Mac on 7.03.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class LoginShortRequest:Mappable{
    
    public var userEncrypted:String!
    
    public required init?(map: Map) {
        
    }
    public init(userEncrypted:String) {
        self.userEncrypted = userEncrypted
    }
    
    public func mapping(map: Map) {
        userEncrypted <- map["UserEncrypted"]
    }
    
    
}


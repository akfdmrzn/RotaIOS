//
//  GetTripDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetTripDetailByIdRequestModel:Mappable{
    
    public var id:String!
    public var birthDate:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(id:String,birthDate : String) {
        self.id = id
        self.birthDate = birthDate
    }
    
    
    public func mapping(map: Map) {
        id <- map["ID"]
        birthDate <- map["BirthDate"]
    }
}


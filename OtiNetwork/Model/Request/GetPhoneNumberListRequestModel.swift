//
//  GetPhoneNumberListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetPhoneNumberListRequestModel:Mappable{
    
    public var companyId:Int!
    public var languageId:Int!
    public var incomingId:Int!
    public var coralTouristId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(companyId:Int,languageId :Int,incomingId : Int,coralTouristId : Int) {
        self.companyId = companyId
        self.languageId = languageId
        self.incomingId = incomingId
        self.coralTouristId = coralTouristId
    }
    
    
    public func mapping(map: Map) {
        companyId <- map["CompanyId"]
        languageId <- map["LanguageId"]
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
        
    }
}


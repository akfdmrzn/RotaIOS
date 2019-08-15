//
//  GetPhoneNumberListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetPhoneNumberListRequestModel:Mappable{
    
    var companyId:Int!
    var languageId:Int!
    var incomingId:Int!
    var coralTouristId:Int!
    
    required init?(map: Map) {
        
    }
    
    init(companyId:Int,languageId :Int,incomingId : Int,coralTouristId : Int) {
        self.companyId = companyId
        self.languageId = languageId
        self.incomingId = incomingId
        self.coralTouristId = coralTouristId
    }
    
    
    func mapping(map: Map) {
        companyId <- map["CompanyId"]
        languageId <- map["LanguageId"]
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
        
    }
}


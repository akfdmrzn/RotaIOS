//
//  CustomerUpdateRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 21.12.2020.
//

import Foundation
import ObjectMapper

public class CustomerUpdateRequestModel: Mappable{
    
    public var customerId:Int!
    public var parameterList:[Parameter]!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int,parameterList : [Parameter]) {
        self.customerId = customerId
        self.parameterList = parameterList
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        parameterList <- map["Parameters"]
    }
    
}
public class Parameter : Mappable {
    public var name: String?
    public var value: Bool?
    
    public required init?(map: Map) {
        
    }
    
    public init(allowMailName : String = "AllowCampaignMail", value : Bool) {
        self.name = allowMailName
        self.value = value
    }
    
    public init(allowSmsName : String = "AllowCampaignSms", value : Bool) {
        self.name = allowSmsName
        self.value = value
    }
    
    public func mapping(map: Map) {
        name <- map["Name"]
        value <- map["Value"]
    }
    
}


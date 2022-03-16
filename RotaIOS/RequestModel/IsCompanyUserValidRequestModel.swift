//
//  IsCompanyUserValidRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import ObjectMapper

public class IsCompanyUserValidRequestModel : Mappable {
    public var ids: String = ""
    public var stepId: String = ""
    public var username: String = ""
    public var password: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(ids : String, stepId: String, username: String, password: String) {
        self.ids = ids
        self.stepId = stepId
        self.username = username
        self.password = password
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?ids=\(self.ids)&stepId=\(self.stepId)&username=\(self.username)&password=\(self.password)"
    }
}

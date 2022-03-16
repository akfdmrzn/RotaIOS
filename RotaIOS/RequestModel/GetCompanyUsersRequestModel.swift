//
//  GetCompanyUsersRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import ObjectMapper

public class GetCompanyUsersRequestModel : Mappable {
    public var ids: String = ""
    public var stepId: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(ids : String, stepId: String) {
        self.ids = ids
        self.stepId = stepId
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?ids=\(self.ids)&stepId=\(self.stepId)"
    }
}

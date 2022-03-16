//
//  GetCompanyUsersResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import ObjectMapper

public class GetCompanyUsersResponseModel: Mappable{
   var id : String?
   var username : String?
   var userDesc : String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {

       id <- map["$id"]
       username <- map["Username"]
       userDesc <- map["UserDesc"]
   }

}

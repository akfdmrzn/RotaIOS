//
//  CreateServiceVoucherResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import ObjectMapper

public class CreateServiceVoucherResponseModel: Mappable{
   var id : String?
   var record : Int?
   var isSuccesful : Bool?
   var resultKey : String?
   var message : String?
   var detailMessage : String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {

       id <- map["id"]
       record <- map["Record"]
       isSuccesful <- map["IsSuccesful"]
       resultKey <- map["ResultKey"]
       message <- map["Message"]
       detailMessage <- map["DetailMessage"]
   }

}

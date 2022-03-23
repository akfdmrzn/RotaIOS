//
//  SetGoShowOnMobileResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import Foundation
import ObjectMapper

public class SetGoShowOnMobileResponseModel: Mappable{
   public var id : String?
   public var isSuccesful : Bool?
   public var resultKey : String?
   public var message : String?
   public var detailMessage : String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {

       id <- map["$id"]
       isSuccesful <- map["IsSuccesful"]
       resultKey <- map["ResultKey"]
       message <- map["Message"]
       detailMessage <- map["DetailMessage"]
   }

}

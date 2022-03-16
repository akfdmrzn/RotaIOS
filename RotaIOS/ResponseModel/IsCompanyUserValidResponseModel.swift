//
//  IsCompanyUserValidResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import ObjectMapper

public class IsCompanyUserValidResponseModel: Mappable{
   var isSuccesful : Bool?

    public required init?(map: Map) {
        
    }
    
    public init(isSuccesful: Bool){
        self.isSuccesful = isSuccesful
    }
    
    public func mapping(map: Map) {
       isSuccesful <- map["IsSuccesful"]
   }

}

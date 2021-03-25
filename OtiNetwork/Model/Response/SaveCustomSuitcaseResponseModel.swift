//
//  SaveCustomSuitcaseResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 25.03.2021.
//

import Foundation
import ObjectMapper

public class SaveCustomSuitcaseResponseModel : Mappable {
    public var id : Int?

    public required init?(map: Map){
        
    }

    public func mapping(map: Map) {
        id <- map["Id"]
    }

}

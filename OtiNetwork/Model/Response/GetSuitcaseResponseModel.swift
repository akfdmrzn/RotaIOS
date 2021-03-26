//
//  GetSuitcaseResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 18.03.2021.
//

import UIKit
import ObjectMapper

public class GetSuitcaseResponseModel : Mappable {
    public var id : Int?
    public var partnerNumber : Int?
    public var name : String?
    public var value : Any?
    public var type : String?
    public var imgUrl : String?
    public var subItemState : Bool?
    public var subItems : [SubItems]?

    public required init?(map: Map){
        
    }

    public func mapping(map: Map) {

        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        value <- map["Value"]
        imgUrl <- map["ImgUrl"]
        type <- map["Type"]
        subItemState <- map["SubItemState"]
        subItems <- map["SubItems"]
    }

}

public class SubItems : Mappable {
    public var id : Int?
    public var partnerNumber : Int?
    public var name : String?
    public var type : String?
    public var value : Any?
 
    public required init?(map: Map){
        
    }

    public func mapping(map: Map) {

        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        type <- map["Type"]
        value <- map["Value"]
    }

}


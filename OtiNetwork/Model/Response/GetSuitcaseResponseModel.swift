//
//  GetSuitcaseResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 18.03.2021.
//

import Foundation
import ObjectMapper

public class GetSuitcaseResponseModel : Mappable {
    public var id : Int!
    public var partnerNumber : Int!
    public var name : String!
    public var value : Int?
    public var type : Int?
    public var imgUrl : String!
    public var subItemState : Bool!
    public var subItems : [SubItems]!

    public required init?(map: Map){
        
    }
    
    public init (id: Int, partnerNumber: Int,name : String,type : Int,value : Int,imgUrl : String,subItemState : Bool,subItems : [SubItems]) {
        self.id = id
        self.partnerNumber = partnerNumber
        self.name = name
        self.type = type
        self.value = value
        self.imgUrl = imgUrl
        self.subItemState = subItemState
        self.subItems = subItems
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
    public var id : Int!
    public var partnerNumber : Int!
    public var name : String!
    public var type : Int?
    public var value : Int?
    
    public required init?(map: Map){
        
    }
    
    public init (id: Int, partnerNumber: Int,name : String,type : Int,value : Int) {
        self.id = id
        self.partnerNumber = partnerNumber
        self.name = name
        self.type = type
        self.value = value
    }

    public func mapping(map: Map) {

        id <- map["Id"]
        partnerNumber <- map["PartnerNumber"]
        name <- map["Name"]
        type <- map["Type"]
        value <- map["Value"]
    }

}

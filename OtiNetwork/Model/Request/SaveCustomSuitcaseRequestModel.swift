//
//  SaveCustomSuitcaseRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 25.03.2021.
//

import Foundation
import ObjectMapper

public class SaveCustomSuitcaseRequestModel: Mappable{
    
    public var id:Int!
    public var customerId:Int!
    public var tourId:String!
    public var itemName:String!
    public var subItemId:Int!
                
    public required init?(map: Map) {
        
    }
    
    public init(id: Int,customerId : Int,tourId : String,itemName : String,subItemId : Int) {
        self.id = id
        self.customerId = customerId
        self.tourId = tourId
        self.itemName = itemName
        self.subItemId = subItemId
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        itemName <- map["ItemName"]
        subItemId <- map["SubItemId"]
    }
    
}

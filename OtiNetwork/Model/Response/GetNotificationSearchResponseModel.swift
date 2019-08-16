//
//  GetNotificationSearchResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetNotificationSearchResponseModel: Mappable {
    
    public var Id:Int!
    public var name:String!
    public var createDate:String!
    public var notificationType:Int!
    public var createDateString:String!
    public var reservationId:Int!
    public var transferId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(Id:Int,name :String,createDate : String,notificationType : Int,createDateString : String,transferId : Int,reservationId : Int) {
        self.Id = Id
        self.name = name
        self.createDate = createDate
        self.notificationType = notificationType
        self.createDateString = createDateString
        self.reservationId = reservationId
        self.transferId = transferId
    }
    
    public func mapping(map: Map) {
        Id <- map["Id"]
        name <- map["Name"]
        createDate <- map["CreateDate"]
        notificationType <- map["NotificationType"]
        createDateString <- map["CreateDateString"]
        reservationId <- map["ReservationId"]
        transferId <- map["TransferId"]
    }
    
}

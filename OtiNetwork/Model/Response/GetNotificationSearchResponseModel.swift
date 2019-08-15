//
//  GetNotificationSearchResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetNotificationSearchResponseModel: Mappable {
    
    var Id:Int!
    var name:String!
    var createDate:String!
    var notificationType:Int!
    var createDateString:String!
    var reservationId:Int!
    var transferId:Int!
    
    required init?(map: Map) {
        
    }
    
    init(Id:Int,name :String,createDate : String,notificationType : Int,createDateString : String,transferId : Int,reservationId : Int) {
        self.Id = Id
        self.name = name
        self.createDate = createDate
        self.notificationType = notificationType
        self.createDateString = createDateString
        self.reservationId = reservationId
        self.transferId = transferId
    }
    
    func mapping(map: Map) {
        Id <- map["Id"]
        name <- map["Name"]
        createDate <- map["CreateDate"]
        notificationType <- map["NotificationType"]
        createDateString <- map["CreateDateString"]
        reservationId <- map["ReservationId"]
        transferId <- map["TransferId"]
    }
    
}

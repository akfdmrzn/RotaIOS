//
//  CalendarAsyncResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 27.05.2021.
//

import Foundation
import ObjectMapper

public class CalendarAsyncResponseModel: Mappable {
    
    public var day: String!
    public var fontColor: String!
    public var backColor: String!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        day <- map["day"]
        fontColor <- map["FontColor"]
        backColor <- map["BackColor"]
        
    }
}

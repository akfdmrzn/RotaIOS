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
    public var opacity: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(day : String,fontColor : String,backColor : String,opacity : Int){
        self.day = day
        self.fontColor = fontColor
        self.backColor = backColor
        self.opacity = opacity
    }
    
    public func mapping(map: Map) {
        day <- map["day"]
        fontColor <- map["FontColor"]
        backColor <- map["BackColor"]
        opacity <- map["Opacity"]
        
    }
}

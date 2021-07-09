//
//  PaidCalendarResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 18.06.2021.
//

import UIKit
import ObjectMapper

public class PaidCalendarResponseModel: Mappable {
    
    public var day : String?
    public var fontColor : String?
    public var backColor : String?
    public var opacity : Int?
    public var price : Double?
    public var priceCurrency : String?

    public required init?(map: Map) {
        
    }
    
    public init(day: String, fontColor: String, backColor: String, opacity: Int, price: Double, priceCurrency: String) {
        self.day = day
        self.fontColor = fontColor
        self.backColor = backColor
        self.opacity = opacity
        self.price = price
        self.priceCurrency = priceCurrency
    }

    public func mapping(map: Map) {
        day <- map["day"]
        fontColor <- map["FontColor"]
        backColor <- map["BackColor"]
        opacity <- map["Opacity"]
        price <- map["Price"]
        priceCurrency <- map["PriceCurrency"]
    }
}


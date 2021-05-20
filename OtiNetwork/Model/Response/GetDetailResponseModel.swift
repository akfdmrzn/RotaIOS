//
//  GetDetailResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 20.05.2021.
//

import Foundation
import ObjectMapper

public class GetDetailResponseModel: Mappable {
    public var id : Int?
    public var minPriceType : String?
    public var minPriceTypeId : Int?
    public var minPriceInfo : String?
    public var minPriceCurrency : String?
    public var excursionId : Int?
    public var excursionName : String?
    public var excursionLocalName : String?
    public var excursionType : String?
    public var excursionTypeKey : Int?
    public var duration : String?
    public var durationKey : String?
    public var tourDescription : String?
    public var itineray : String?
    public var excursionImage : [ExcursionImage]?
    public var excursionVideos : [String]?
    public var includedServices : String?
    public var exculededServices : String?
    public var cancellationPolicy : String?
    public var importantNotes : String?
    public var highlights : String?
    public var allowToChild : Bool?
    public var allowToChildKey : Int?
    public var allowToToddle : Bool?
    public var allowToToddleKey : Int?
    public var allowToInfant : Bool?
    public var allowToInfantKey : Int?
    public var extras : [String]?
    public var durationImageLink : String?

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {

        id <- map["id"]
        minPriceType <- map["minPriceType"]
        minPriceTypeId <- map["minPriceTypeId"]
        minPriceInfo <- map["minPriceInfo"]
        minPriceCurrency <- map["minPriceCurrency"]
        excursionId <- map["excursionId"]
        excursionName <- map["excursionName"]
        excursionLocalName <- map["excursionLocalName"]
        excursionType <- map["excursionType"]
        excursionTypeKey <- map["excursionTypeKey"]
        duration <- map["duration"]
        durationKey <- map["durationKey"]
        tourDescription <- map["tourDescription"]
        itineray <- map["itineray"]
        excursionImage <- map["excursionImage"]
        excursionVideos <- map["excursionVideos"]
        includedServices <- map["includedServices"]
        exculededServices <- map["exculededServices"]
        cancellationPolicy <- map["cancellationPolicy"]
        importantNotes <- map["importantNotes"]
        highlights <- map["highlights"]
        allowToChild <- map["allowToChild"]
        allowToChildKey <- map["allowToChildKey"]
        allowToToddle <- map["allowToToddle"]
        allowToToddleKey <- map["allowToToddleKey"]
        allowToInfant <- map["allowToInfant"]
        allowToInfantKey <- map["allowToInfantKey"]
        extras <- map["extras"]
        durationImageLink <- map["DurationImageLink"]
    }

}

public class ExcursionImage : Mappable {
    
    public var id : Int?
    public var tourId : Int?
    public var imagePath : String?
    public var description : String?
    public var orderNumber : Int?

    public required init?(map: Map){
        
    }

    public func mapping(map: Map) {

        id <- map["id"]
        tourId <- map["tourId"]
        imagePath <- map["imagePath"]
        description <- map["description"]
        orderNumber <- map["orderNumber"]
    }
    
}


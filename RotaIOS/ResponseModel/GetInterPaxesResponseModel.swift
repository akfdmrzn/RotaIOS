//
//  GetInterPaxesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import ObjectMapper

public class GetInterPaxesResponseModel: Mappable{
    public var _id : String?
    public var id : Int?
    public var name : String?
    public var operatorList : String?
    public var oprResNo : String?
    public var incResNo : String?
    public var flightCode : String?
    public var show : Bool?
    public var surveyNo : String?
    public var note : String?
    public var age : Int?
    public var terminal : String?
    public var checkOutDateStr : String?
    public var flightTimeStr : String?

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["_id"]
        id <- map["Id"]
        name <- map["Name"]
        operatorList <- map["Operator"]
        oprResNo <- map["OprResNo"]
        incResNo <- map["IncResNo"]
        flightCode <- map["FlightCode"]
        show <- map["Show"]
        surveyNo <- map["SurveyNo"]
        note <- map["Note"]
        age <- map["Age"]
        terminal <- map["Terminal"]
        checkOutDateStr <- map["CheckOutDateStr"]
        flightTimeStr <- map["FlightTimeStr"]
    }

}

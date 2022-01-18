//
//  GetInfoPaxesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import ObjectMapper

public class GetInfoPaxesResponseModel: Mappable{
    public var _id : String?
    public var birtDayStr : String?
    public var resNote : String?
    public var oprResNo : String?
    public var checkDatesStr : String?
    public var flightCode : String?
    public var arrInfoNote : String?
    public var transferGuideName : String?
    public var transferGuidePhoneNumber : String?
    public var favouriteExcursionDesc : String?
    public var id : Int?
    public var paxId : Int?
    public var name : String?
    public var room : String?
    public var ageGroup : String?
    public var show : Bool?
    public var infoRep : String?
    public var voucherNo : String?
    public var surveyNo : String?
    public var operatorList : String?
    public var incResNo : String?

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        birtDayStr <- map["BirtDayStr"]
        resNote <- map["ResNote"]
        oprResNo <- map["OprResNo"]
        checkDatesStr <- map["CheckDatesStr"]
        flightCode <- map["FlightCode"]
        arrInfoNote <- map["ArrInfoNote"]
        transferGuideName <- map["TransferGuideName"]
        transferGuidePhoneNumber <- map["TransferGuidePhoneNumber"]
        favouriteExcursionDesc <- map["FavouriteExcursionDesc"]
        id <- map["Id"]
        paxId <- map["PaxId"]
        name <- map["Name"]
        room <- map["Room"]
        ageGroup <- map["AgeGroup"]
        show <- map["Show"]
        infoRep <- map["InfoRep"]
        voucherNo <- map["VoucherNo"]
        surveyNo <- map["SurveyNo"]
        operatorList <- map["Operator"]
        incResNo <- map["IncResNo"]
    }

}

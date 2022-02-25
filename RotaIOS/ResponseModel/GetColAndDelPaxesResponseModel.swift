//
//  GetColAndDelPaxesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import ObjectMapper

public class GetColAndDelPaxesResponseModel : Mappable {
    public var _id : String?
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

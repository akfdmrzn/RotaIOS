//
//  GetTourPaxesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import ObjectMapper

public class GetTourPaxesResponseModel : Mappable {
    public var _id : String?
    public var saleGuide : String?
    public var oprResNo : String?
    public var note : String?
    public var extraDesc : String?
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
        saleGuide <- map["SaleGuide"]
        oprResNo <- map["OprResNo"]
        note <- map["Note"]
        extraDesc <- map["ExtraDesc"]
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

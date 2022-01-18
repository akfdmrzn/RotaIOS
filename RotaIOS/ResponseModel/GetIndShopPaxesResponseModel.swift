//
//  GetIndShopPaxesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import ObjectMapper

public class GetIndShopPaxesResponseModel : Mappable {
    public var _id : String = ""
    public var id : Int = 0
    public var show : Bool = false
    public var name : String = ""
    public var ageGroup : String = ""
    public var gender : String = ""
    public var age : Int = 0
    public var infoRep : String = ""
    public var infoRepPhone : String = ""
    public var room : String = ""
    public var incResNo : Int = 0
    public var oprResNo : Int = 0
    public var operatorList : String = ""
    public var voucherNo : String = ""
    public var shoppingGuideNote : String = ""

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        show <- map["Show"]
        name <- map["Name"]
        ageGroup <- map["AgeGroup"]
        gender <- map["Gender"]
        age <- map["Age"]
        infoRep <- map["InfoRep"]
        infoRepPhone <- map["InfoRepPhone"]
        room <- map["Room"]
        incResNo <- map["IncResNo"]
        oprResNo <- map["OprResNo"]
        operatorList <- map["Operator"]
        voucherNo <- map["VoucherNo"]
        shoppingGuideNote <- map["ShoppingGuideNote"]
    }

}

public class PaxList : NSObject {
    public var paxName : String = ""
    public var ageGroup : String = ""
    public var incResNo : String = ""
    public var operatorList : String = ""
    public var voucherNo : String = ""
    public var room : String = ""
    public var oprResNo : String = ""
    public var show : String = ""
    public var infoRep : String = ""
    public var shoppingGuideNote : String = ""
    
    public required init?(map: Map) {

    }

    public init(paxName: String, ageGroup: String, incResNo: String, operator_: String, voucherNo: String, room: String, oprResNo: String, noShow: String, infoRep: String, guideNote: String){
        self.paxName = paxName
        self.ageGroup = ageGroup
        self.incResNo = incResNo
        self.operatorList = operator_
        self.voucherNo = voucherNo
        self.room = room
        self.oprResNo = oprResNo
        self.show = noShow
        self.infoRep = infoRep
        self.shoppingGuideNote = guideNote
    }

}



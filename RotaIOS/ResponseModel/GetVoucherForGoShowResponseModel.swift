//
//  GetVoucherForGoShowResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import Foundation
import ObjectMapper

public class GetVoucherForGoShowResponseModel: Mappable{
   public var _id : String?
   public var id : Int?
   public var voucher : String?
   public var tourist : String?
   public var guide : String?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
       _id <- map["$id"]
       id <- map["Id"]
       voucher <- map["Voucher"]
       tourist <- map["Tourist"]
       guide <- map["Guide"]
   }

}

public class GoShowList : NSObject {
    public var _id : String?
    public var id : Int?
    public var voucher : String?
    public var tourist : String?
    public var guide : String?
    public var check: Bool?
    
    public init(_id : String, id: Int, voucher: String, tourist: String, guide: String, check: Bool) {
        self._id = _id
        self.id = id
        self.voucher = voucher
        self.tourist = tourist
        self.guide = guide
        self.check = check
    }
}

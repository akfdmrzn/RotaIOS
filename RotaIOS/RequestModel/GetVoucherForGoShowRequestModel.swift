//
//  GetVoucherForGoShowRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import Foundation
import ObjectMapper

public class GetVoucherForGoShowRequestModel : Mappable {
    public var voucher: String = ""
    public var date: String = ""
    public var hotelId: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(voucher : String, date: String, hotelId: String) {
        self.voucher = voucher
        self.date = date
        self.hotelId = hotelId
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?voucher=\(self.voucher)&date=\(self.date)&hotelId=\(self.hotelId)"
    }
}

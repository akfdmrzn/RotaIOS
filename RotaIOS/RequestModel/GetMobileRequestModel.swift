//
//  GetMobileRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 16.06.2022.
//


import Foundation
import UIKit
import ObjectMapper

public class  GetMobileRequestModel : Mappable{
    public var voucher : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(  voucher : String) {
        self.voucher = voucher
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?voucherNo=\(self.voucher)"
    }
}

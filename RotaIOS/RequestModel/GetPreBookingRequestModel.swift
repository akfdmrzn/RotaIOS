//
//  GetPreBookingRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 27.04.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetPreBookingRequestModel : Mappable{
    public var voucherNo = ""
    public var guideid = 0
   
    public required init?(map: Map) {
        
    }
    
    public init( voucherNo : String, guideid : Int) {
        self.voucherNo = voucherNo
        self.guideid = guideid
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?voucherNo=\(self.voucherNo)&guideid=\(self.guideid)"
    }
}

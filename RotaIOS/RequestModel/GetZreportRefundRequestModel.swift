//
//  GetZreportRefundRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 29.09.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetZreportRefundRequestModel : Mappable{
    public var zReportNumber : String!
    
    public required init?(map: Map) {
        
    }
    
    public init( zReportNumber : String) {
        self.zReportNumber = zReportNumber
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?zReportNumber=\(self.zReportNumber ?? "")"
    }
}

//
//  GetStepsForIndShopRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepsForIndShopRequestModel : Mappable {
    public var ids: String = ""
    public var indShopVoucherNo: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(ids : String, indShopVoucherNo: String) {
        self.ids = ids
        self.indShopVoucherNo = indShopVoucherNo
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?ids=\(self.ids)&indShopVoucherNo=\(self.indShopVoucherNo)"
    }
}

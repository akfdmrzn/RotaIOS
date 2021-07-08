//
//  GetStatusResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 8.07.2021.
//

import UIKit
import ObjectMapper

public class GetStatusResponseModel: Mappable {
    
    public var code : Int?
    public var isApproved : Bool?
    public var title : String?
    public var message : String?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        code <- map["Code"]
        isApproved <- map["IsAppruved"]
        title <- map["Title"]
        message <- map["Message"]
    }
}

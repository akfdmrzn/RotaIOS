//
//  SaveFavoriteResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class SaveFavoriteResponseModel: Mappable {
    
    public var value = false
    public var message = ""
    public var operationStatus = false
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        value <- map["Value"]
        message <- map["Message"]
        operationStatus <- map["OperationStatus"]
    }
}

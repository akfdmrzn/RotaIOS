//
//  GetTourDefinationComboListResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 11.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTourDefinationComboListResponseModel : Mappable {
    
    public var value: Int?
    public var text: String = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        value <- map["Value"]
        text <- map["Text"]
    }
    
}


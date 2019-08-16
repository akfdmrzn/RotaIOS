//
//  GetExcursionPrintDataResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetExcursionPrintDataResponseModel: Mappable {
    
    public var data: String?
    
    public required init?(map: Map) {
        
    }
    
    public init(data: String?) {
        self.data = data
    }
    
    public func mapping(map: Map) {
        data <- map["Data"]
    }
    
}

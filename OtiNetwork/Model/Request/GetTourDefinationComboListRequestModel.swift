//
//  GetTourDefinationComboListRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 11.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTourDefinationComboListRequestModel : Mappable {
    
    public var incomingId : Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int?) {
        self.incomingId = incomingId
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
    }
    
}
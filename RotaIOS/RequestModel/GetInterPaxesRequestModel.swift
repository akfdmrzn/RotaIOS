//
//  GetInterPaxesRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class GetInterPaxesRequestModel: Mappable{
    
    public var id : Int!
    
    public required init?(map: Map) {
        
    }
    
    public init( id : Int ) {
        self.id = id
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "/?Id=\(self.id ?? 0)"
    }
}

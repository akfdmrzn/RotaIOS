//
//  GetInterRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetInterRequestModel : Mappable{
    
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

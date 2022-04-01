//
//  GetBirthDaysRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 31.03.2022.
//


import Foundation
import UIKit
import ObjectMapper

public class  GetBirthDaysRequestModel : Mappable{
    public var date = ""
    public var hotelIds = ""
   
    public required init?(map: Map) {
        
    }
    
    public init( date : String, hotelIds : String) {
        self.date = date
        self.hotelIds = hotelIds
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?hotelIds=\(self.hotelIds)&date=\(self.date)"
    }
}



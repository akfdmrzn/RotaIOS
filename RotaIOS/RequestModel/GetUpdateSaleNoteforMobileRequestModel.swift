//
//  GetUpdateSaleNoteforMobileRequestModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.03.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetUpdateSaleNoteforMobileRequestModel : Mappable{
    public var TourSaleId : String!
    public var Note : String!
    
    public required init?(map: Map) {
        
    }
    
    public init( TourSaleId : String, Note : String ) {
        self.TourSaleId = TourSaleId
        self.Note = Note
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?TourSaleId=\(self.TourSaleId ?? "")&Note=\(self.Note ?? "")"
    }
}

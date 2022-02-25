//
//  GetGuideDutiesRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 23.12.2021.
//

import Foundation
import UIKit
import ObjectMapper

public class  GetGuideDutiesRequestModel : Mappable{
    public var guideId : String!
    public var date : String!
    public var langId: String!
    
    public required init?(map: Map) {
        
    }
    
    public init( guideId : String, date : String, langId: String) {
        self.guideId = guideId
        self.date = date
        self.langId = langId
    }
    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        return "?guideId=\(self.guideId ?? "")&date=\(self.date ?? "")&langId=\(self.langId ?? "")"
    }
}

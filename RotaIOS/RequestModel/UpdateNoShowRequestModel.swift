//
//  UpdateNoShowRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 19.01.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  UpdateNoShowRequestModel : Mappable{
    public var data : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(data : String) {
        self.data = data
    }
    
    public func mapping(map: Map) {
        data <- map["jsonStr"]
    }
}

public class  UpdateNoShow : Mappable{
    public var typeInt : Int!
    public var noShowList : [NoShowList]!
    
    public required init?(map: Map) {
        
    }
    
    public init(typeInt : Int, noShowList : [NoShowList]) {
        self.typeInt = typeInt
        self.noShowList = noShowList
    }
    
    public func mapping(map: Map) {
        typeInt <- map["TypeInt"]
        noShowList <- map["NoShowList"]
    }

}

public class NoShowList : Mappable {
    var paxId : Int = 0
    var show : Bool = false
    
    public required init?(map: Map) {

    }

    public init(paxId: Int, show: Bool){
        self.paxId = paxId
        self.show = show
    }
    
    public func mapping(map: Map) {
        paxId <- map["PaxId"]
        show <- map["Show"]
    }
}

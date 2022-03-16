//
//  GetSteps_ArrDepH2HRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetSteps_ArrDepH2HRequestModel : Mappable {
    public var tourTransferPlanArrAndDepId: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(tourTransferPlanArrAndDepId : String) {
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?tourTransferPlanArrAndDepId=\(self.tourTransferPlanArrAndDepId)"
    }
}

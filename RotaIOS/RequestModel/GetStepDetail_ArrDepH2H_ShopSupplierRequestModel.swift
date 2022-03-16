//
//  GetStepDetail_ArrDepH2H_ShopSupplierRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepDetail_ArrDepH2H_ShopSupplierRequestModel : Mappable {
    public var tourTransferPlanArrAndDepId: String = ""
    public var stepId: String = ""

    public required init?(map: Map) {
        
    }
    
    public init(tourTransferPlanArrAndDepId : String, stepId: String) {
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
        self.stepId = stepId
    }
    
    public func mapping(map: Map) {
        
    }
    
    public func requestPathString()->String{
        return "?tourTransferPlanArrAndDepId=\(self.tourTransferPlanArrAndDepId)&stepId=\(self.stepId)"
    }
}

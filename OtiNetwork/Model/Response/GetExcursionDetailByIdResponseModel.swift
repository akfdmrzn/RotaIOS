//
//  GetExcursionDetailByIdResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 16.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetExcursionDetailByIdResponseModel: Mappable {
    
    public var excursionId: Int?
    public var incomingId: Int?
    public var mainInfo: MainInfo?
    public var tourAges: TourAges?
    public var tourPlans: [TourPlan]?
    public var extraInfos: [ExtraInfo]?
    public var cancellationAndRefundPolicy: CancellationAndRefundPolicy?
    public var files: [File]?
    public var videos: [String]?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        excursionId <- map["ExcursionId"]
        incomingId <- map["IncomingId"]
        mainInfo <- map["MainInfo"]
        tourAges <- map["TourAges"]
        tourPlans <- map["TourPlan"]
        extraInfos <- map["ExtraInfo"]
        cancellationAndRefundPolicy <- map["CancellationAndRefundPolicy"]
        files <- map["Files"]
        videos <- map["Videos"]
    }
}

public class MainInfo : Mappable {
    public var name: String?
    public var typeName: String?
    public var concept: String?
    public var duration: String?
    public var allotment: String?
    public var isFavorite: Bool?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["Name"]
        typeName <- map["TypeName"]
        concept <- map["Concept"]
        duration <- map["Duration"]
        allotment <- map["Allotment"]
        isFavorite <- map["IsFavorite"]
    }
    
}

public class TourAges: Mappable {
    public var childRange: String?
    public var toddleRange: String?
    public var infantRange: String?
    public var insuranceIncluded: String?
    public var transferIncluded: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        childRange <- map["ChildRange"]
        toddleRange <- map["ToddleRange"]
        infantRange <- map["InfantRange"]
        insuranceIncluded <- map["InsuranceIncluded"]
        transferIncluded <- map["TransferIncluded"]
    }
    
}

public class TourPlan : Mappable {
    public var description: String?
    public var name: String?
    public var time: String?
    public var planText: String?
    
    public required init?(map: Map) {
        
    }
    
    public init(description : String,name : String, time : String, planText : String) {
        self.description = description
        self.name = name
        self.time = time
        self.planText = planText
    }
    
    public func mapping(map: Map) {
        description <- map["Description"]
        name <- map["Name"]
        time <- map["Time"]
        planText <- map["PlanText"]
    }
    
}

public class ExtraInfo : Mappable {
    public var name: String?
    public var information: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["Name"]
        information <- map["Information"]
    }
    
}

public class CancellationAndRefundPolicy : Mappable {
    public var voucherDescription: String?
    public var rule: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        voucherDescription <- map["VoucherDescription"]
        rule <- map["Rule"]
    }
    
}

public class File: Mappable {
    public var mediaType: String?
    public var fileExtension: String?
    public var url: String?
    
    public required init?(map: Map) {
        
    }
    
    public init() {
        mediaType = ""
        fileExtension = ""
        url = ""
    }
    
    public func mapping(map: Map) {
        mediaType <- map["MediaType"]
        fileExtension <- map["Extension"]
        url <- map["Url"]
    }
    
}

//
//  GetExcursionDetailByIdResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 16.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetExcursionDetailByIdResponseModel: Mappable {
    
    var excursionId: Int?
    var incomingId: Int?
    var mainInfo: MainInfo?
    var tourAges: TourAges?
    var tourPlans: [TourPlan]?
    var extraInfos: [ExtraInfo]?
    var cancellationAndRefundPolicy: CancellationAndRefundPolicy?
    var files: [File]?
    var videos: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
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

class MainInfo : Mappable {
    var name: String?
    var typeName: String?
    var concept: String?
    var duration: String?
    var allotment: String?
    var isFavorite: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["Name"]
        typeName <- map["TypeName"]
        concept <- map["Concept"]
        duration <- map["Duration"]
        allotment <- map["Allotment"]
        isFavorite <- map["IsFavorite"]
    }
    
}

class TourAges: Mappable {
    var childRange: String?
    var toddleRange: String?
    var infantRange: String?
    var insuranceIncluded: String?
    var transferIncluded: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        childRange <- map["ChildRange"]
        toddleRange <- map["ToddleRange"]
        infantRange <- map["InfantRange"]
        insuranceIncluded <- map["InsuranceIncluded"]
        transferIncluded <- map["TransferIncluded"]
    }
    
}

class TourPlan : Mappable {
    var description: String?
    var name: String?
    var time: String?
    var planText: String?
    
    required init?(map: Map) {
        
    }
    
    init(description : String,name : String, time : String, planText : String) {
        self.description = description
        self.name = name
        self.time = time
        self.planText = planText
    }
    
    func mapping(map: Map) {
        description <- map["Description"]
        name <- map["Name"]
        time <- map["Time"]
        planText <- map["PlanText"]
    }
    
}

class ExtraInfo : Mappable {
    var name: String?
    var information: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["Name"]
        information <- map["Information"]
    }
    
}

class CancellationAndRefundPolicy : Mappable {
    var voucherDescription: String?
    var rule: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        voucherDescription <- map["VoucherDescription"]
        rule <- map["Rule"]
    }
    
}

class File: Mappable {
    var mediaType: String?
    var fileExtension: String?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    init() {
        mediaType = ""
        fileExtension = ""
        url = ""
    }
    
    func mapping(map: Map) {
        mediaType <- map["MediaType"]
        fileExtension <- map["Extension"]
        url <- map["Url"]
    }
    
}

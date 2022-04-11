//
//  SaveGuideMeetingTimeAndReportRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 24.02.2022.
//

import Foundation
import ObjectMapper

public class SaveGuideMeetingTimeAndReportRequestModel : Mappable {
    public var workNo: String = ""
    public var guide: String = ""
    public var typeInt: String = ""
    public var note: String = ""
    public var isReport: String = ""
    public var action: String = ""
    public var plate: String = ""
    public var state: String = ""
    public var relatedId: String = ""
    public var tourDate: String = ""
    public var glassNumber: String = ""
    public var eventEntryRef: String = ""
    
    public required init?(map: Map) {
        
    }
    
    public init(workNo : String, guide: String, typeInt: String, note: String, isReport: String, action: String, plate: String, state: String, relatedId: String, tourDate: String, glassNumber: String, eventEntryRef: String) {
        self.workNo = workNo
        self.guide = guide
        self.typeInt = typeInt
        self.note = note
        self.isReport = isReport
        self.action = action
        self.plate = plate
        self.state = state
        self.relatedId = relatedId
        self.tourDate = tourDate
        self.glassNumber = glassNumber
        self.eventEntryRef = eventEntryRef
        
    }
    
    public func mapping(map: Map) {
        workNo <- map["WorkNo"]
        guide <- map["Guide"]
        typeInt <- map["TypeInt"]
        note <- map["Note"]
        isReport <- map["IsReport"]
        action <- map["Action"]
        plate <- map["Plate"]
        state <- map["State"]
        relatedId <- map["RelatedId"]
        tourDate <- map["TourDate"]
        glassNumber <- map["GlassNumber"]
        eventEntryRef <- map["EventEntryRef"]
    }

}

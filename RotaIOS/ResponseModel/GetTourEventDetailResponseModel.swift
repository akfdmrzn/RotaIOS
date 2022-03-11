//
//  GetTourEventDetailResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import Foundation
import ObjectMapper
import UIKit

public class GetTourEventDetailResponseModel : Mappable {
    public var id: String = ""
    public var plate: String = ""
    public var driver: String = ""
    public var driverPhone: String = ""
    public var guideName: String = ""
    public var guidePhone: String = ""
    public var meetingPoint: String = ""
    public var typeInt: Int = 0
    public var vehicleNo: Int = 0
    public var kokartGuideName: String = ""
    public var kokartGuidePhone: String = ""
    public var plate_ColOrDes: String = ""
    public var drive_ColOrDes: String = ""
    public var driverPhone_ColOrDes: String = ""
    public var meetingPoint_ColOrDes: String = ""
    public var col: [Any] = []
    public var del: [Any] = []
    public var exc: [Any] = []

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["$id"]
        plate <- map["Plate"]
        driver <- map["Driver"]
        driverPhone <- map["DriverPhone"]
        guideName <- map["GuideName"]
        guidePhone <- map["GuidePhone"]
        meetingPoint <- map["MeetingPoint"]
        typeInt <- map["TypeInt"]
        vehicleNo <- map["VehicleNo"]
        kokartGuideName <- map["KokartGuideName"]
        kokartGuidePhone <- map["KokartGuidePhone"]
        plate_ColOrDes <- map["Plate_ColOrDes"]
        drive_ColOrDes <- map["Drive_ColOrDes"]
        driverPhone_ColOrDes <- map["DriverPhone_ColOrDes"]
        meetingPoint_ColOrDes <- map["MeetingPoint_ColOrDes"]
        col <- map["Col"]
        del <- map["Del"]
        exc <- map["Exc"]
    }

}

public class TourDetailList : NSObject {
    public var id: String?
    public var plate: String?
    public var driver: String?
    public var driverPhone: String?
    public var guideName: String?
    public var guidePhone: String?
    public var meetingPoint: String?
    public var typeInt: String?
    public var vehicleNo: String?
    public var kokartGuideName: String?
    public var kokartGuidePhone: String?
    public var plate_ColOrDes: String?
    public var drive_ColOrDes: String?
    public var driverPhone_ColOrDes: String?
    public var meetingPoint_ColOrDes: String?
    public var col: [Any] = []
    public var del: [Any] = []
    public var exc: [Any] = []
    
    public init(id : String, plate: String, driver: String, driverPhone: String, guideName: String, guidePhone: String, meetingPoint: String, typeInt: String, vehicleNo: String, kokartGuideName: String, kokartGuidePhone: String, plate_ColOrDes: String, drive_ColOrDes: String, driverPhone_ColOrDes: String, meetingPoint_ColOrDes: String, col: [Any], del: [Any], exc: [Any]) {
        self.id = id
        self.plate = plate
        self.driver = driver
        self.driverPhone = driverPhone
        self.guideName = guideName
        self.guidePhone = guidePhone
        self.meetingPoint = meetingPoint
        self.typeInt = typeInt
        self.vehicleNo = vehicleNo
        self.kokartGuideName = kokartGuideName
        self.kokartGuidePhone = kokartGuidePhone
        self.plate_ColOrDes = plate_ColOrDes
        self.drive_ColOrDes = drive_ColOrDes
        self.driverPhone_ColOrDes = driverPhone_ColOrDes
        self.meetingPoint_ColOrDes = meetingPoint_ColOrDes
        self.col = col
        self.del = del
        self.exc = exc
    }
}

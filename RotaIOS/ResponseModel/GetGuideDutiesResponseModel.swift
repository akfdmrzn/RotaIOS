//
//  GetGuideDutiesResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 27.12.2021.
//

import UIKit
import ObjectMapper

public class GetGuideDutiesResponseModel: Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var collection : [Collection] = []
    public var excursion : [Excursion] = []
    public var delivery : [Delivery] = []
    public var arrival : [Arrival] = []
    public var departure : [Departure] = []
    public var intern : [Intern] = []
    public var speakTime : [SpeakTime] = []
    public var infoPlan : [InfoPlan] = []
    public var indShop : [String] = []
    public var indShopForMobile : [Shop] = []
    public var newList : [NewList] = []

    public required init?(map: Map) {

    }
    
    public init(id: String, collection: [Collection], excursion: [Excursion], delivery: [Delivery], arrival: [Arrival],departure : [Departure],intern : [Intern],speakTime : [SpeakTime],infoPlan : [InfoPlan],indShop : [String], indShopForMobile: [Shop], newList: [NewList]) {
        self._id = id
        self.collection = collection
        self.excursion = excursion
        self.delivery = delivery
        self.arrival = arrival
        self.departure = departure
        self.intern = intern
        self.speakTime = speakTime
        self.infoPlan = infoPlan
        self.indShop = indShop
        self.indShopForMobile = indShopForMobile
        self.newList = newList
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        collection <- map["Collection"]
        excursion <- map["Excursion"]
        delivery <- map["Delivery"]
        arrival <- map["Arrival"]
        departure <- map["Departure"]
        intern <- map["Intern"]
        speakTime <- map["SpeakTime"]
        infoPlan <- map["InfoPlan"]
        indShop <- map["IndShop"]
        indShopForMobile <- map["IndShopForMobile"]
        newList <- map["NewList"]
    }
}

public class Collection : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var ids : String = ""
    public var workNo : Int = 0
    public var excursion : String = "-"
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicleId : Int = 0
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var shortCode : String = "-"
    public var typeInt : Int = 0
    public var tourDate : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var extraTotalPax : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"
    
    public required init?(map: Map) {

    }

    public init(id: String, ids: String, workNo: Int, excursion: String, meetingPointAndTime: String, transferType : String, vehicleId :Int, vehicle : String, note : String, pax : String, shortCode: String, typeInt: Int, tourDate: String, meetingTime: String, tourDateStr: String, extraTotalPax: String, driverName: String, driverPhone: String) {
        self._id = id
        self.ids = ids
        self.workNo = workNo
        self.excursion = excursion
        self.meetingPointAndTime = meetingPointAndTime
        self.vehicleId = vehicleId
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.shortCode = shortCode
        self.typeInt = typeInt
        self.tourDate = tourDate
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.extraTotalPax = extraTotalPax
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        ids <- map["Ids"]
        workNo <- map["WorkNo"]
        excursion <- map["Excursion"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicleId <- map["VehicleId"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        shortCode <- map["ShortCode"]
        typeInt <- map["TypeInt"]
        tourDate <- map["TourDate"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        extraTotalPax <- map["ExtraTotalPax"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class Excursion : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var ids : String = ""
    public var workNo : Int = 0
    public var excursion : String = "-"
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicleId : Int = 0
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var shortCode : String = "-"
    public var typeInt : Int = 0
    public var tourDate : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var extraTotalPax : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"

    public required init?(map: Map) {

    }

    public init(id: String, ids: String, workNo: Int, excursion: String, meetingPointAndTime: String, transferType : String, vehicleId :Int, vehicle : String, note : String, pax : String, shortCode: String, typeInt: Int, tourDate: String, meetingTime: String, tourDateStr: String, extraTotalPax: String, driverName: String, driverPhone: String) {
        self._id = id
        self.ids = ids
        self.workNo = workNo
        self.excursion = excursion
        self.meetingPointAndTime = meetingPointAndTime
        self.vehicleId = vehicleId
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.shortCode = shortCode
        self.typeInt = typeInt
        self.tourDate = tourDate
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.extraTotalPax = extraTotalPax
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        ids <- map["Ids"]
        workNo <- map["WorkNo"]
        excursion <- map["Excursion"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicleId <- map["VehicleId"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        shortCode <- map["ShortCode"]
        typeInt <- map["TypeInt"]
        tourDate <- map["TourDate"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        extraTotalPax <- map["ExtraTotalPax"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class Arrival : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var id : Int = 0
    public var workNo : Int = 0
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var fromTo : String = "-"
    public var shortCode : String = "-"
    public var tourDate : String = "-"
    public var flightCodes : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var typeInt : Int = 0
    public var guideNote : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"

    public required init?(map: Map) {

    }

    public init(_id: String, id: Int, workNo: Int, meetingPointAndTime: String, transferType : String,  vehicle : String, note : String, pax : String, fromTo: String, shortCode: String, tourDate: String, flightCodes: String, meetingTime: String, tourDateStr: String, typeInt: Int, guideNote: String, driverName: String, driverPhone: String) {
        self._id = _id
        self.id = id
        self.workNo = workNo
        self.meetingPointAndTime = meetingPointAndTime
        self.transferType = transferType
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.fromTo = fromTo
        self.shortCode = shortCode
        self.tourDate = tourDate
        self.flightCodes = flightCodes
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.typeInt = typeInt
        self.guideNote = guideNote
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        workNo <- map["WorkNo"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        fromTo <- map["FromTo"]
        shortCode <- map["ShortCode"]
        tourDate <- map["TourDate"]
        flightCodes <- map["FlightCodes"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        typeInt <- map["TypeInt"]
        guideNote <- map["GuideNote"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class Departure : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var id : Int = 0
    public var workNo : Int = 0
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var fromTo : String = "-"
    public var shortCode : String = "-"
    public var tourDate : String = "-"
    public var flightCodes : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var typeInt : Int = 0
    public var guideNote : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"

    public required init?(map: Map) {

    }

    public init(_id: String, id: Int, workNo: Int, meetingPointAndTime: String, transferType : String,  vehicle : String, note : String, pax : String, fromTo: String, shortCode: String, tourDate: String, flightCodes: String, meetingTime: String, tourDateStr: String, typeInt: Int, guideNote: String, driverName: String, driverPhone: String) {
        self._id = _id
        self.id = id
        self.workNo = workNo
        self.meetingPointAndTime = meetingPointAndTime
        self.transferType = transferType
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.fromTo = fromTo
        self.shortCode = shortCode
        self.tourDate = tourDate
        self.flightCodes = flightCodes
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.typeInt = typeInt
        self.guideNote = guideNote
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        workNo <- map["WorkNo"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        fromTo <- map["FromTo"]
        shortCode <- map["ShortCode"]
        tourDate <- map["TourDate"]
        flightCodes <- map["FlightCodes"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        typeInt <- map["TypeInt"]
        guideNote <- map["GuideNote"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class SpeakTime : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var id : Int = 0
    public var hotelName : String = "-"
    public var startTime : String = "-"
    public var endTime : String = "-"
    public var days : String = "-"
    public var shortCode : String = "-"
    public var beginDate : String = "-"
    public var endDate : String = "-"
    public var dates : String = "-"
    public var typeInt : Int = 0

    public required init?(map: Map) {

    }

    public init(_id: String, id: Int, hotelName: String, startTime: String, endTime: String, days : String, shortCode : String, beginDate : String, endDate : String, dates: String, typeInt: Int) {
        self._id = _id
        self.id = id
        self.hotelName = hotelName
        self.startTime = startTime
        self.endTime = endTime
        self.days = days
        self.shortCode = shortCode
        self.beginDate = beginDate
        self.endDate = endDate
        self.dates = dates
        self.typeInt = typeInt
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        hotelName <- map["HotelName"]
        startTime <- map["StartTime"]
        endTime <- map["EndTime"]
        days <- map["Days"]
        shortCode <- map["ShortCode"]
        beginDate <- map["BeginDate"]
        endDate <- map["EndDate"]
        dates <- map["Dates"]
        typeInt <- map["TypeInt"]
    }

}

public class InfoPlan : Mappable,Decodable,Encodable {
    public var id : Int = 0
    public var hotelName : String = "-"
    public var date : String = "-"
    public var dateStr : String = "-"
    public var shortCode : String = "-"
    public var infoTime : String = "-"
    public var pax : String = "-"
    public var note : String = ""
    public var market : String = "-"
    public var typeInt : Int = 0
    public var reelPax : String = "-"

    public required init?(map: Map) {

    }

    public init(id: Int, hotelName: String, date: String, dateStr: String, shortCode : String, infoTime :String, pax : String, note : String, market : String, typeInt: Int, reelPax: String) {
        self.id = id
        self.hotelName = hotelName
        self.date = date
        self.dateStr = dateStr
        self.shortCode = shortCode
        self.infoTime = infoTime
        self.pax = pax
        self.note = note
        self.market = market
        self.typeInt = typeInt
        self.reelPax = reelPax
    }

    public func mapping(map: Map) {

        id <- map["Id"]
        hotelName <- map["HotelName"]
        date <- map["Date"]
        dateStr <- map["DateStr"]
        shortCode <- map["ShortCode"]
        infoTime <- map["InfoTime"]
        pax <- map["Pax"]
        note <- map["Note"]
        market <- map["Market"]
        typeInt <- map["TypeInt"]
        reelPax <- map["ReelPax"]
    }

}

public class NewList : Mappable,Decodable,Encodable {
    public var id : Int = 0
    public var hotelName : String = "-"
    public var startTime : String = "-"
    public var endTime : String = "-"
    public var days : String = "-"
    public var shortCode : String = "-"
    public var beginDate : String = "-"
    public var endDate : String = "-"
    public var dates : String = "-"
    public var typeInt : Int = 0

    public required init?(map: Map) {

    }

    public init(id: Int, hotelName: String, startTime: String, endTime: String, days : String, shortCode : String, beginDate : String, endDate : String, dates: String, typeInt: Int) {
        self.id = id
        self.hotelName = hotelName
        self.startTime = startTime
        self.endTime = endTime
        self.days = days
        self.shortCode = shortCode
        self.beginDate = beginDate
        self.endDate = endDate
        self.dates = dates
        self.typeInt = typeInt
    }

    public func mapping(map: Map) {

        id <- map["Id"]
        hotelName <- map["HotelName"]
        startTime <- map["StartTime"]
        endTime <- map["EndTime"]
        days <- map["Days"]
        shortCode <- map["ShortCode"]
        beginDate <- map["BeginDate"]
        endDate <- map["EndDate"]
        dates <- map["Dates"]
        typeInt <- map["TypeInt"]
    }

}

public class Shop : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var id : String = ""
    public var workNo : String = "-"
    public var plan: String = "-"
    public var date : String = "-"
    public var dateStr : String = "-"
    public var typeInt : Int = 0
    public var shortCode : String = "-"
    public var meetingPoint : String = "-"
    public var meetingPointAndTime : String = "-"
    public var pax : String = "-"
    public var meetingTime : String = "-"
    public var vehiclePlate : String = "-"
    public var note : String = ""
    public var companyNote: String = "-"
    public var steps : String = "-"
    public var driverName : String = "-"
    public var driverPhone: String = "-"
    
    public required init?(map: Map) {

    }

    public init(_id: String, id: String, workNo: String, plan: String, date: String, dateStr : String, typeInt :Int, shortCode : String, meetingPoint : String, meetingPointAndTime: String, pax: String, meetingTime: String, vehiclePlate: String, note: String, companyNote: String, steps: String, driverName: String, driverPhone: String) {
        self._id = _id
        self.id = id
        self.workNo = workNo
        self.plan = plan
        self.date = date
        self.dateStr = dateStr
        self.typeInt = typeInt
        self.shortCode = shortCode
        self.meetingPoint = meetingPoint
        self.meetingPointAndTime = meetingPointAndTime
        self.pax = pax
        self.meetingTime = meetingTime
        self.vehiclePlate = vehiclePlate
        self.note = note
        self.companyNote = companyNote
        self.steps = steps
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Ids"]
        workNo <- map["WorkNo"]
        plan <- map["Plan"]
        date <- map["Date"]
        dateStr <- map["DateStr"]
        typeInt <- map["TypeInt"]
        shortCode <- map["ShortCode"]
        meetingPoint <- map["MeetingPoint"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        pax <- map["Pax"]
        meetingTime <- map["MeetingTime"]
        vehiclePlate <- map["VehiclePlate"]
        note <- map["Note"]
        companyNote <- map["CompanyNote"]
        steps <- map["Steps"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class Delivery : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var ids : String = ""
    public var workNo : Int = 0
    public var excursion : String = "-"
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicleId : Int = 0
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var shortCode : String = "-"
    public var typeInt : Int = 0
    public var tourDate : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var extraTotalPax : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"

    public required init?(map: Map) {

    }

    public init(id: String, ids: String, workNo: Int, excursion: String, meetingPointAndTime: String, transferType : String, vehicleId :Int, vehicle : String, note : String, pax : String, shortCode: String, typeInt: Int, tourDate: String, meetingTime: String, tourDateStr: String, extraTotalPax: String, driverName: String, driverPhone: String) {
        self._id = id
        self.ids = ids
        self.workNo = workNo
        self.excursion = excursion
        self.meetingPointAndTime = meetingPointAndTime
        self.vehicleId = vehicleId
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.shortCode = shortCode
        self.typeInt = typeInt
        self.tourDate = tourDate
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.extraTotalPax = extraTotalPax
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        ids <- map["Ids"]
        workNo <- map["WorkNo"]
        excursion <- map["Excursion"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicleId <- map["VehicleId"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        shortCode <- map["ShortCode"]
        typeInt <- map["TypeInt"]
        tourDate <- map["TourDate"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        extraTotalPax <- map["ExtraTotalPax"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class Intern : Mappable,Decodable,Encodable {
    public var _id : String = ""
    public var id : Int = 0
    public var workNo : Int = 0
    public var meetingPointAndTime : String = "-"
    public var transferType : String = "-"
    public var vehicle : String = "-"
    public var note : String = ""
    public var pax : String = "-"
    public var fromTo : String = "-"
    public var shortCode : String = "-"
    public var tourDate : String = "-"
    public var flightCodes : String = "-"
    public var meetingTime : String = "-"
    public var tourDateStr : String = "-"
    public var typeInt : Int = 0
    public var guideNote : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"

    public required init?(map: Map) {

    }

    public init(_id: String, id: Int, workNo: Int, meetingPointAndTime: String, transferType : String, vehicle : String, note : String, pax : String, fromTo: String, shortCode: String, tourDate: String, flightCodes: String, meetingTime: String, tourDateStr: String, typeInt: Int, guideNote: String, driverName: String, driverPhone: String) {
        self._id = _id
        self.id = id
        self.workNo = workNo
        self.meetingPointAndTime = meetingPointAndTime
        self.transferType = transferType
        self.vehicle = vehicle
        self.note = note
        self.pax = pax
        self.fromTo = fromTo
        self.shortCode = shortCode
        self.tourDate = tourDate
        self.flightCodes = flightCodes
        self.meetingTime = meetingTime
        self.tourDateStr = tourDateStr
        self.typeInt = typeInt
        self.guideNote = guideNote
        self.driverName = driverName
        self.driverPhone = driverPhone
    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        workNo <- map["WorkNo"]
        meetingPointAndTime <- map["MeetingPointAndTime"]
        transferType <- map["TransferType"]
        vehicle <- map["Vehicle"]
        note <- map["Note"]
        pax <- map["Pax"]
        fromTo <- map["FromTo"]
        shortCode <- map["ShortCode"]
        tourDate <- map["TourDate"]
        flightCodes <- map["FlightCodes"]
        meetingTime <- map["MeetingTime"]
        tourDateStr <- map["TourDateStr"]
        typeInt <- map["TypeInt"]
        guideNote <- map["GuideNote"]
        driverName <- map["DriverName"]
        driverPhone <- map["DriverPhone"]
    }

}

public class TotalList : NSObject {
    public var shortCode : String = "-"
    public var workNo : String = "-"
    public var tourDateStr : String = "-"
    public var excursion : String = "-"
    public var transferType : String = "-"
    public var pax : String = "-"
    public var vehicle : String = "-"
    public var meetingPointAndTime : String = "-"
    public var meetingTime : String = "-"
    public var extra : String = "-"
    public var driverName : String = "-"
    public var driverPhone : String = "-"
    public var color: UIColor = UIColor.white
    public var noteColor: UIColor = UIColor.white
    public var note: String = ""
    
    public required init?(map: Map) {

    }

    public init(shortCode: String, workNo: String, tourDateStr: String, excursion: String, transferType: String, pax : String, vehicle :String, meetingPointAndTime : String, meetingTime : String, extra : String, driverName: String, driverPhone: String, color: UIColor, noteColor: UIColor, note: String) {
        self.shortCode = shortCode
        self.workNo = workNo
        self.tourDateStr = tourDateStr
        self.excursion = excursion
        self.transferType = transferType
        self.pax = pax
        self.vehicle = vehicle
        self.meetingPointAndTime = meetingPointAndTime
        self.meetingTime = meetingTime
        self.extra = extra
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.color = color
        self.noteColor = noteColor
        self.note = note
    }

}

public class GetGuideDutiesList : NSObject {
    var id : Int = 0
    var ids : String = ""
    var typeInt : String = ""
    var planId : String = ""
    var planIds : String = ""
    
    public required init?(map: Map) {

    }

    public init(id: Int, ids: String, typeInt: String, planId: String, planIds: String){
        self.id = id
        self.ids = ids
        self.typeInt = typeInt
        self.planId = planId
        self.planIds = planIds
    }

}

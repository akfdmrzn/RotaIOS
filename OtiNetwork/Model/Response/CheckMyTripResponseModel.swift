//
//  CheckMyTripResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CheckMyTripResponseModel: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var birthDate = ""
    public var birthDateStringFormat = ""
    public var passportGivenDate = ""
    public var passportGivenDateString = ""
    public var passportValidThru = ""
    public var passportValidThruString = ""
    public var fullName = ""
    public var gender = ""
    public var name = ""
    public var surName = ""
    public var passportNumber = ""
    public var citizenShip = ""
    public var phoneNumber = ""
    public var phone2 = ""
    public var fullTaken = false
    public var preparedForEmbassy = false
    public var givenIntoTheEmbassy = false
    public var receivedFromEmbassy = false
    public var visaStatus = false
    public var bringYourDocument = false
    public var visaStatusName = ""
    public var visaInfo = ""
    public var previewHotelStatus = false
    public var incomingId = ""
    public var agencyStuff: Int = 0
    public var givenDateIntoTheEmbassy = ""
    public var givenDateIntoTheEmbassyString = ""
    public var recordDate = ""
    public var recordDateString = ""
    public var departureDate = ""
    public var hotels: [Hotels] = []
    public var flights: [Flights] = []
    public var extras: [Extras] = []
    public var transfers: [Transfers] = []
    public var insurances: [Insurances] = []
    public var agency: Agency?
    
    public init() {
        
    }
    
    public required init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        birthDate <- map["BirthDate"]
        birthDateStringFormat <- map["BirthDateStringFormat"]
        passportGivenDate <- map["PassportGivenDate"]
        passportGivenDateString <- map["PassportGivenDateString"]
        passportValidThru <- map["PassportValidThru"]
        passportValidThruString <- map["PassportValidThruString"]
        fullName <- map["FullName"]
        gender <- map["Gender"]
        name <- map["Name"]
        surName <- map["SurName"]
        passportNumber <- map["PassportNumber"]
        citizenShip <- map["CitizenShip"]
        phoneNumber <- map["PhoneNumber"]
        phone2 <- map["Phone2"]
        fullTaken <- map["FullTaken"]
        preparedForEmbassy <- map["PreparedForEmbassy"]
        givenIntoTheEmbassy <- map["GivenIntoTheEmbassy"]
        receivedFromEmbassy <- map["ReceivedFromEmbassy"]
        visaStatus <- map["VisaStatus"]
        bringYourDocument <- map["BringYourDocument"]
        visaStatusName <- map["VisaStatusName"]
        visaInfo <- map["VisaInfo"]
        previewHotelStatus <- map["PreviewHotelStatus"]
        incomingId <- map["IncomingId"]
        agencyStaff <- map["AgencyStaff"]
        givenDateIntoTheEmbassy <- map["GivenDateIntoTheEmbassy"]
        givenDateIntoTheEmbassyString <- map["GivenDateIntoTheEmbassyString"]
        recordDate <- map["RecordDate"]
        recordDateString <- map["RecordDateString"]
        departureDate <- map["DepartureDate"]
        hotels <- map["Hotels"]
        flights <- map["Flights"]
        extras <- map["Extras"]
        transfers <- map["Transfers"]
        insurances <- map["Insurances"]
        agency <- map["Agency"]
    }
}

public class Agency: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var name : String = ""
    public var address : String = ""
    public var email: String = ""
    public var phone: String = ""
    
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        name <- map["Name"]
        address <- map["Address"]
        email <- map["Email"]
        phone <- map["Phone"]
    }
}

public class Insurances: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var beginDate = ""
    public var beginDateString = ""
    public var endDate = ""
    public var endDateString = ""
    public var insuranceName = ""
    public var company = ""
    public var zone = ""
    public var salePrice = 0
    public var saleCurrencyName = ""
    public var franchiseAmount = 0
    public var franchiseCurrency = ""
    public var cancelStatus = ""
    public var previewInsuranceStatus = false
    
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        beginDate <- map["BeginDate"]
        beginDateString <- map["BeginDateString"]
        endDate <- map["EndDate"]
        endDateString <- map["EndDateString"]
        insuranceName <- map["InsuranceName"]
        company <- map["Company"]
        zone <- map["Zone"]
        salePrice <- map["SalePrice"]
        saleCurrencyName <- map["SaleCurrencyName"]
        franchiseAmount <- map["FranchiseAmount"]
        franchiseCurrency <- map["FranchiseCurrency"]
        cancelStatus <- map["CancelStatus"]
        previewInsuranceStatus <- map["PreviewInsuranceStatus"]
    }
}

public class Transfers: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var transferDate = ""
    public var transferDateString = ""
    public var arrivalTransferDate = ""
    public var arrivalTransferDateString = ""
    public var transferType = ""
    public var transferDirection = ""
    public var transferDirectionType: Int = 0
    public var fromPointName = ""
    public var toPointName = ""
    public var route = ""
    public var cancelStatus = ""
    public var arrivalTransferTime = ""
    public var departureTransferTime = ""
    public var transferTime: String = ""
    public var departurePoint = ""
    public var pickupTime: String = ""
    public var pickupPoint: String = ""
    public var vehiclePoint: String = ""
    public var vehiclePlate: String = ""
    public var guideName: String = ""
    public var guidePhoneNumber: String = ""
    public var isArrival : Bool = false
    public var arrivalGuideName: String = ""
    public var arrivalGuidePhone: String = ""
    public var arrivalVehiclePlate: String = ""
    public var departureGuideName: String = ""
    public var departureGuidePhone: String = ""
    public var departureVehiclePlate: String = ""
    public var pickupPlace: String?
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        transferDate <- map["TransferDate"]
        transferDateString <- map["TransferDateString"]
        arrivalTransferDate <- map["ArrivalTransferDate"]
        arrivalTransferDateString <- map["ArrivalTransferDateString"]
        arrivalTransferTime <- map["ArrivalTransferTime"]
        transferType <- map["TransferType"]
        transferDirection <- map["TransferDirection"]
        transferDirectionType <- map["TransferDirectionType"]
        fromPointName <- map["FromPointName"]
        toPointName <- map["ToPointName"]
        transferTime <- map["TransferTime"]
        route <- map["Route"]
        departurePoint <- map["DeparturePoint"]
        cancelStatus <- map["CancelStatus"]
        departureTransferTime <- map["DepartureTransferTime"]
        pickupTime <- map["PickupTime"]
        pickupPoint <- map["PickupPoint"]
        vehiclePoint <- map["VehiclePoint"]
        vehiclePlate <- map["VehiclePlate"]
        guideName <- map["GuideName"]
        guidePhoneNumber <- map["GuidePhoneNumber"]
        arrivalGuideName <- map["ArrivalGuideName"]
        arrivalGuidePhone <- map["ArrivalGuidePhone"]
        arrivalVehiclePlate <- map["ArrivalVehiclePlate"]
        departureGuideName <- map["DepartureGuideName"]
        departureGuidePhone <- map["DepartureGuidePhone"]
        departureVehiclePlate <- map["DepartureVehiclePlate"]
        pickupPlace <- map["PickUpPlace"]
        
    }
}

public class Extras: Mappable,Decodable,Encodable {
    
    public var ID = 0
    public var extraServiceName = ""
    public var extraServiceDate = ""
    public var saleDate = ""
    public var extraServiceTime = ""
    public var extraServiceDateString = ""
    public var saleDateString = ""
    public var cancelStatus = ""
    public var salePrice = 0
    public var saleCurrencyName = ""
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        ID <- map["ID"]
        saleDate <- map["SaleDate"]
        extraServiceDate <- map["ExtraServiceDate"]
        extraServiceName <- map["ExtraServiceName"]
        extraServiceTime <- map["ExtraServiceTime"]
        salePrice <- map["SalePrice"]
        saleCurrencyName <- map["SaleCurrencyName"]
        extraServiceDateString <- map["ExtraServiceDateString"]
        saleDateString <- map["SaleDateString"]
        cancelStatus <- map["CancelStatus"]
    }
}

public class BaggageExtra: Mappable,Decodable,Encodable {
    
    public var baggageType = 0
    public var tempBaggageTypeName = ""
    public var baggageTypeName = ""
    public var baggageAmount = 0
    public var baggageUnitName = ""
    public var id = 0
    public var saleDate = ""
    public var extraServiceDate = ""
    public var saleDateString = ""
    public var extraServiceDateString = ""
    public var extraServiceTime = ""
    public var extraServiceName = ""
    public var extraServiceDetail = ""
    public var cancelStatus = ""
    public var salePrice = 0
    public var saleCurrencyName = ""
    public var cancel = false
    
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        baggageTypeName <- map["BaggageTypeName"]
        baggageAmount <- map["BaggageAmount"]
        baggageUnitName <- map["BaggageUnitName"]
        id <- map["ID"]
        saleDate <- map["SaleDate"]
        extraServiceDate <- map["ExtraServiceDate"]
        saleDateString  <- map["SaleDateString"]
        extraServiceDateString <- map["ExtraServiceDateString"]
        extraServiceTime <- map["ExtraServiceTime"]
        extraServiceName <- map["ExtraServiceName"]
        extraServiceDetail <- map["ExtraServiceDetail"]
        cancelStatus <- map["CancelStatus"]
        salePrice <- map["SalePrice"]
        saleCurrencyName <- map["SaleCurrencyName"]
        cancel <- map["Cancel"]
        baggageType <- map["BaggageType"]
    }
}

public class Flights: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var saleDate = ""
    public var saleDateString = ""
    public var departureDate = ""
    public var departureDateString = ""
    public var arrivalDate = ""
    public var arrivalDateString = ""
    public var departureTime = ""
    public var arrivalTime = ""
    public var flightDuration = ""
    public var departureArea = ""
    public var arrivalArea = ""
    public var departureAirportName = ""
    public var departureAirportTerminal = ""
    public var departureAirportCode = ""
    public var arrivalAirportName = ""
    public var arrivalAirportTerminal = ""
    public var arrivalAirportCode = ""
    public var airlineName = ""
    public var flightCode = ""
    public var flightClass = ""
    public var baggageAllowance = 0
    public var planeType = ""
    public var cancelStatus = ""
    public var direction = 0
    public var directionName = ""
    public var isConnectedFlight = false
    public var previewFlightStatus = false
    public var baggageAllowanceFree = ""
    public var baggageIncludedFree = ""
    public var cabinBaggageAllowanceFree = ""
    public var cabinBaggageIncludedFree = ""
    public var baggageExtraList : [BaggageExtra] = []
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        saleDate <- map["SaleDate"]
        saleDateString <- map["SaleDateString"]
        departureDate <- map["DepartureDate"]
        departureDateString <- map["DepartureDateString"]
        arrivalDate <- map["ArrivalDate"]
        arrivalDateString <- map["ArrivalDateString"]
        departureTime <- map["DepartureTime"]
        arrivalTime <- map["ArrivalTime"]
        flightDuration <- map["FlightDuration"]
        departureArea <- map["DepartureArea"]
        arrivalArea <- map["ArrivalArea"]
        departureAirportName <- map["DepartureAirportName"]
        departureAirportTerminal <- map["DepartureAirportTerminal"]
        departureAirportCode <- map["DepartureAirportCode"]
        arrivalAirportName <- map["ArrivalAirportName"]
        arrivalAirportTerminal <- map["ArrivalAirportTerminal"]
        arrivalAirportCode <- map["ArrivalAirportCode"]
        airlineName <- map["AirlineName"]
        flightCode <- map["FlightCode"]
        flightClass <- map["FlightClass"]
        baggageAllowance <- map["BaggageAllowance"]
        planeType <- map["PlaneType"]
        cancelStatus <- map["CancelStatus"]
        direction <- map["Direction"]
        directionName <- map["DirectionName"]
        previewFlightStatus <- map["PreviewFlightStatus"]
        baggageAllowanceFree <- map["BaggageAllowanceFree"]
        baggageIncludedFree <- map["BaggageIncludedFree"]
        cabinBaggageAllowanceFree <- map["CabinBaggageAllowanceFree"]
        cabinBaggageIncludedFree <- map["CabinBaggageIncludedFree"]
        baggageExtraList <- map["BaggageExtraList"]
    }
}

public class Hotels: Mappable,Decodable,Encodable {
    
    public var iD = 0
    public var hotelID = 0
    public var checkInDate = ""
    public var checkInDateString = ""
    public var checkOutDate = ""
    public var checkOutDateString = ""
    public var checkInAndOutDate = ""
    public var hotelName = ""
    public var roomName = ""
    public var mealName = ""
    public var accName = ""
    public var hotelCategory = ""
    public var cancelStatus = ""
    public var hotelArea = ""
    public var hotelRegion = ""
    public var hotelPlace = ""
    public var countryName = ""
    public var imageUrl = ""
    public var hotelCountry = ""
    public var hotelCountryID = ""
    
    
    public init() {
        
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        hotelID <- map["HotelID"]
        checkInDate <- map["CheckInDate"]
        checkInDateString <- map["CheckInDateString"]
        checkOutDate <- map["CheckOutDate"]
        checkOutDateString <- map["CheckOutDateString"]
        checkInAndOutDate <- map["CheckInAndOutDate"]
        hotelName <- map["HotelName"]
        roomName <- map["RoomName"]
        mealName <- map["MealName"]
        accName <- map["AccName"]
        hotelCategory <- map["HotelCategory"]
        cancelStatus <- map["CancelStatus"]
        hotelArea <- map["HotelArea"]
        hotelRegion <- map["HotelRegion"]
        hotelPlace <- map["HotelPlace"]
        countryName <- map["CountryName"]
        imageUrl <- map["ImageUrl"]
        hotelCountry <- map["HotelCountry"]
        hotelCountryID <- map["HotelCountryID"]
    }
}


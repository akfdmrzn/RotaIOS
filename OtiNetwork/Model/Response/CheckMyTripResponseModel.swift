//
//  CheckMyTripResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CheckMyTripResponseModel: Mappable {
    
    var iD = 0
    var birthDate = ""
    var birthDateStringFormat = ""
    var passportGivenDate = ""
    var passportGivenDateString = ""
    var passportValidThru = ""
    var passportValidThruString = ""
    var fullName = ""
    var gender = ""
    var name = ""
    var surName = ""
    var passportNumber = ""
    var citizenShip = ""
    var phoneNumber = ""
    var phone2 = ""
    var fullTaken = false
    var preparedForEmbassy = false
    var givenIntoTheEmbassy = false
    var receivedFromEmbassy = false
    var visaStatus = false
    var visaInfo = ""
    var bringYourDocument = false
    var visaStatusName: Any?
    var givenDateIntoTheEmbassy = ""
    var givenDateIntoTheEmbassyString = ""
    var recordDate = ""
    var recordDateString = ""
    var hotels: [Hotels] = []
    var flights: [Flights] = []
    var extras: [Extras] = []
    var transfers: [Transfers] = []
    var insurances: [Insurances] = []
    var agency: Agency?
    
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
        visaInfo <- map["VisaInfo"]
        bringYourDocument <- map["BringYourDocument"]
        visaStatusName <- map["VisaStatusName"]
        givenDateIntoTheEmbassy <- map["GivenDateIntoTheEmbassy"]
        givenDateIntoTheEmbassyString <- map["GivenDateIntoTheEmbassyString"]
        recordDate <- map["RecordDate"]
        recordDateString <- map["RecordDateString"]
        hotels <- map["Hotels"]
        flights <- map["Flights"]
        extras <- map["Extras"]
        transfers <- map["Transfers"]
        insurances <- map["Insurances"]
        agency <- map["Agency"]
    }
}

public class Agency: Mappable {
    
    var iD = 0
    var name : String = ""
    var address : String = ""
    var email: String = ""
    var phone: String = ""
    
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

public class Insurances: Mappable {
    
    var iD = 0
    var beginDate = ""
    var beginDateString = ""
    var endDate = ""
    var endDateString = ""
    var insuranceName = ""
    var company = ""
    var zone = ""
    var salePrice = 0
    var saleCurrencyName = ""
    var franchiseAmount = 0
    var franchiseCurrency = ""
    var cancelStatus = ""
    
    
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
    }
}

public class Transfers: Mappable {
    
    var iD = 0
    var transferDate = ""
    var transferDateString = ""
    var arrivalTransferDate = ""
    var arrivalTransferDateString = ""
    var transferType = ""
    var transferDirection = ""
    var fromPointName = ""
    var toPointName = ""
    var transferTime: String = ""
    var route = ""
    var departurePoint = ""
    var cancelStatus = ""
    var arrivalTransferTime = ""
    var departureTransferTime = ""
    var pickupTime: String = ""
    var pickupPoint: String = ""
    var vehiclePoint: String = ""
    var vehiclePlate: String = ""
    var guideName: String = ""
    var guidePhoneNumber: String = ""
    var isArrival : Bool = false
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        iD <- map["ID"]
        transferDate <- map["TransferDate"]
        transferDateString <- map["TransferDateString"]
        arrivalTransferDate <- map["ArrivalTransferDate"]
        arrivalTransferDateString <- map["ArrivalTransferDateString"]
        transferType <- map["TransferType"]
        transferDirection <- map["TransferDirection"]
        fromPointName <- map["FromPointName"]
        toPointName <- map["ToPointName"]
        transferTime <- map["TransferTime"]
        route <- map["Route"]
        departurePoint <- map["DeparturePoint"]
        cancelStatus <- map["CancelStatus"]
        arrivalTransferTime <- map["ArrivalTransferTime"]
        departureTransferTime <- map["DepartureTransferTime"]
        pickupTime <- map["PickupTime"]
        pickupPoint <- map["PickupPoint"]
        vehiclePoint <- map["VehiclePoint"]
        vehiclePlate <- map["VehiclePlate"]
        guideName <- map["GuideName"]
        guidePhoneNumber <- map["GuidePhoneNumber"]
    }
}

public class Extras: Mappable {
    
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
    }
}

public class Flights: Mappable {
    
    var iD = 0
    var saleDate = ""
    var saleDateString = ""
    var departureDate = ""
    var departureDateString = ""
    var arrivalDate = ""
    var arrivalDateString = ""
    var departureTime = ""
    var arrivalTime = ""
    var flightDuration = ""
    var departureArea = ""
    var arrivalArea = ""
    var departureAirportName = ""
    var departureAirportTerminal = ""
    var departureAirportCode = ""
    var arrivalAirportName = ""
    var arrivalAirportTerminal = ""
    var arrivalAirportCode = ""
    var airlineName = ""
    var flightCode = ""
    var flightClass = ""
    var baggageAllowance = 0
    var planeType = ""
    var cancelStatus = ""
    var direction = 0
    var directionName = ""
    var isConnectedFlight = false
    
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
    }
}

public class Hotels: Mappable {
    
    var iD = 0
    var hotelID = 0
    var checkInDate = ""
    var checkInDateString = ""
    var checkOutDate = ""
    var checkOutDateString = ""
    var checkInAndOutDate = ""
    var hotelName = ""
    var roomName = ""
    var mealName = ""
    var accName = ""
    var hotelCategory = ""
    var cancelStatus = ""
    var hotelArea = ""
    var hotelRegion = ""
    var hotelPlace = ""
    var countryName = ""
    var imageUrl = ""
    
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
    }
}


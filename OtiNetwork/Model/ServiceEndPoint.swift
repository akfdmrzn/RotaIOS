//
//  ServiceEndPoint.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation

public enum ServiceEndPoint: String {
    
    case CreateToken = "/api/Account/CreateTokenAsync"
    case Login = "/api/Account/CustomerLoginAsync"
    case ShortLogin = "/api/Account/CustomerShortLoginAsync"
    case CreateCustomer = "/api/Account/CustomerCreateAsync"
    case ChangePassword = "/api/Account/CustomerChangePasswordAsync"
    case CustomerDetailById = "/api/Account/CustomerDetailByIdAsync"
    case CheckMyTrip = "/api/Integration/CheckMyTripAsync"
    case GetActualTrip = "/api/Integration/GetActualTripAsync"
    case GetTripDetailById = "/api/Integration/GetTripDetailByIdAsync"
    case GetPhoneNumberList = "/api/Integration/GetPhoneNumberListAsync"
    case SendRatedResult = "/api/Survey/SendRatedTourResultAsync"
    case GetSurveys = "/api/Survey/GetListAsync"
    case SendActivationCode = "/api/Account/CustomerSendActiveCodeAsync"
    case ControlActivationCode = "/api/Account/CustomerControlActivateCodeAsync"
    case GetGuideInfoOfTourist = "/api/Excursion/GetGuideInfoOfTouristAsync"
    case GetTourDefinationList = "/api/Excursion/GetTourDefinationListAsync"
    case GetFavorites = "/api/Favorite/GetListAsync"
    case SaveFavorite = "/api/Favorite/SaveAsync"
    case GetTourDefinationComboList = "/api/Excursion/GetTourDefinationComboListAsync"
    case GetExcursionDetailById = "/api/Excursion/GetDetailByIdAsync"
    case GetTransfer = "/api/Integration/GetTransferAsync"
    case GetWeather = "/api/Weather/GetWeaterDetailAsync"
    case GetNotificationSearch = "/api/Notification/SearchAsync"
    case GetNotificationRead = "/api/Notification/ReadAsync"
    case GetSaledExcursionInfo = "/api/Excursion/GetSaledExcursionInfoAsync"
    case GetSaledExcursionInfoDetail = "/api/Excursion/GetSaledExcursionInfoDetailAsync"
    case GetExcursionPrintData = "/api/Excursion/GetPrintDataAsync"
    case GetCustomerForgotPassword = "/api/Account/CustomerForgetPasswordAsync"
    case CreateVoucherDocument = "/api/Integration/CreateVoucherDocumentAsync"
    case CreateFlightTicket = "/api/Integration/CreateFlightTicketAsync"
    case CreateInsuranceDocument = "/api/Integration/CreateInsuranceDocumentAsync"
    case GetPDFData = "/api/Excursion/GetPdfAsync"
    case SaveVoucherCustomerLink = "/api/Integration/SaveVoucherCustomerLinkAsync"
    case DeleteVoucherCustomerLink = "/api/Integration/DeleteVoucherCustomerLinkAsync"
    case GetTransferTypeList = "/api/Integration/GetTransferTypeListAsync"
    case GetBarcode = "/api/Integration/GetBarcode"
    case GetBonusLoyalty = "/api/Bonus/SaveAsync"
    case GetExcursionIncomingId = "/api/Excursion/GetExcursionIncomingListAsync"
    case CustomerUpdate = "/api/Account/CustomerUpdateAsync"

}

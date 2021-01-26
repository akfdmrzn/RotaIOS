//
//  Defaults.swift
//  BaseProject
//
//  Created by Bekir's Mac on 7.03.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class Defaults{
    public enum DefaultsType {
        case User
        case CompanyID
        case LanguageID
        case CustomerID
        case DeviceID
        case FlagChoosed
        case FlagID
        case IncomingID
        case TouristID
        case LastEmail
        case LastPassword
        case ActualTrip
        case PurschasedExcursions
        case PurschasedExcursionsDetails
        case SurveyListTrip
        case SurveyListExcursions
        case SendRateTourListTrip
        case SendRateTourListExcursion
        case CheckMyTripResponseModel
    }
    
   public init(){}
    
    
    
   public func clearData(){
        let userDefaultsData:Defaults = Defaults()
        
        let tempMail = userDefaultsData.getLastEmail()
        let tempPassword = userDefaultsData.getLastPassword()
        let lastDeviceId = userDefaultsData.getDeviceId() ?? ""
        let tempLanguageId = userDefaultsData.getLanguageId()
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    
        userDefaultsData.saveLastEmail(lastEmail: tempMail)
        userDefaultsData.saveLastPassword(id: tempPassword)
        userDefaultsData.saveLanguageId(languageId: tempLanguageId)
        userDefaultsData.saveDeviceId(id: lastDeviceId)
        
    }
    
    // UserEncryptedData
    public func saveUserEncrypted(data:String){
        let preferences = UserDefaults.standard
        preferences.set( data , forKey:getIdentifier(type: .User))
        preferences.synchronize()
    }
    
    public func getUserEncrypted() -> String! {
        let preferences = UserDefaults.standard
        if preferences.object(forKey: getIdentifier(type: .User)) == nil {
            return nil
        }
        let data:String = preferences.value(forKey: getIdentifier(type: .User)) as! String
        return data
    }
    
    //CompanyID
    public func saveCompanyID(companyFlagId:Int = 0) -> Bool{ //Default olarak company ID hep 9 gönderiliyor bayrak seçimlerinden sonra ne yapılacağı belli değil
        return true
//        let preferences = UserDefaults.standard
//        let currentCompanyKey = getIdentifier(type: .CompanyID)
//        preferences.set(9, forKey: currentCompanyKey)
//        let didSave = preferences.synchronize()
//        return didSave
    }
    public func getCompanyID() -> Int{
        
        if (Bundle.main.bundleIdentifier?.elementsEqual("com.oti.sunmar"))! {
            return 13
        }
        else if (Bundle.main.bundleIdentifier?.elementsEqual("com.oti.coral.ru"))! {
            return 9
        }
        else if (Bundle.main.bundleIdentifier?.elementsEqual("com.oti.coral.poland"))! {
            return 3
        }
        else if (Bundle.main.bundleIdentifier?.elementsEqual("com.oti.coral.ua"))! {
            return 10
        }
        else{
            return 9
        }
    }
    
    //LanguageID
    public func saveLanguageId(languageId:Int){
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        preferences.set(languageId, forKey: currentLanguageKey)
        preferences.synchronize()
    }
    
    public func getLanguageId() -> Int{
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        if preferences.object(forKey: currentLanguageKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentLanguageKey)
        }
    }
    
    //CustomerID
    public func saveCustomerID(customerId:Int){
        let preferences = UserDefaults.standard
        let currentCsutomerKey = getIdentifier(type: .CustomerID)
        preferences.set(customerId, forKey: currentCsutomerKey)
        preferences.synchronize()
    }
    
    public func getCustomerID() -> Int{
        let preferences = UserDefaults.standard
        let currentCsutomerKey = getIdentifier(type: .CustomerID)
        if preferences.object(forKey: currentCsutomerKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentCsutomerKey)
        }
    }
    
    // DeviceID
    public func saveDeviceId(id:String){
        let preferences = UserDefaults.standard
        preferences.set( id , forKey:getIdentifier(type: .DeviceID))
        preferences.synchronize()
    }
    
    public func getDeviceId() -> String! {
        let preferences = UserDefaults.standard
        if preferences.object(forKey: getIdentifier(type: .DeviceID)) == nil {
            return nil
        }
        let data:String = preferences.value(forKey: getIdentifier(type: .DeviceID)) as! String
        return data
    }
    
    public func saveLastPassword(id:String){
        let preferences = UserDefaults.standard
        preferences.set( id , forKey:getIdentifier(type: .LastPassword))
        preferences.synchronize()
    }
    
    public func getLastEmail() -> String{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .LastPassword)
        if preferences.object(forKey: currentFlagKey) == nil {
            return ""
        } else {
            return preferences.value(forKey: getIdentifier(type: .LastPassword)) as! String
        }
    }
    
    //FlagID
    public func saveFlagID(flagId:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagID)
        preferences.set(flagId, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    public func getFlagID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    //FlagChoosed
    public func saveFlagChoosed(flagId:Bool){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagChoosed)
        preferences.set(flagId, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    public func getFlagChoosed() -> Bool{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagChoosed)
        if preferences.object(forKey: currentFlagKey) == nil {
            return false
        } else {
            return preferences.bool(forKey: currentFlagKey)
        }
    }
    
    public func saveIncomingID(incomingID:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .IncomingID)
        preferences.set(incomingID, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    public func getIncomingID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .IncomingID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return 2
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    
    public func saveTouristID(incomingID:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .TouristID)
        preferences.set(incomingID, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    public func getTouristID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .TouristID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    
    public func saveLastEmail(lastEmail:String){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .LastEmail)
        preferences.set(lastEmail, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    public func getLastPassword() -> String{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .LastEmail)
        if preferences.object(forKey: currentFlagKey) == nil {
            return ""
        } else {
            return preferences.value(forKey: getIdentifier(type: .LastEmail)) as! String
        }
    }
    
    public func saveActualTrip(myTrip:[GetActualTripResponseModel]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .ActualTrip))
            preferences.synchronize()
        }
    }
    
    public func getActualTrip() -> [GetActualTripResponseModel]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .ActualTrip)) as? Data {
            if let loadedPerson = try? decoder.decode([GetActualTripResponseModel].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func savePurschasedExcursions(myTrip:[GetSaledExcursionInfoResponseModel]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .PurschasedExcursions))
            preferences.synchronize()
        }
    }
    
    public func getPurschasedExcursions() -> [GetSaledExcursionInfoResponseModel]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .PurschasedExcursions)) as? Data {
            if let loadedPerson = try? decoder.decode([GetSaledExcursionInfoResponseModel].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func savePurschasedExcursionsDetails(myTrip:[GetSaledExcursionInfoDetailResponseModel]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .PurschasedExcursionsDetails))
            preferences.synchronize()
        }
    }
    
    public func getPurschasedExcursionsDetails() -> [GetSaledExcursionInfoDetailResponseModel]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .PurschasedExcursionsDetails)) as? Data {
            if let loadedPerson = try? decoder.decode([GetSaledExcursionInfoDetailResponseModel].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func saveSurveyListTrip(myTrip:[[GetListResponseModel]]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .SurveyListTrip))
            preferences.synchronize()
        }
    }
    
    public func getSurveyListTrip() -> [[GetListResponseModel]]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .SurveyListTrip)) as? Data {
            if let loadedPerson = try? decoder.decode([[GetListResponseModel]].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    
    public func saveSurveyListExcursions(myTrip:[[GetListResponseModel]]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .SurveyListExcursions))
            preferences.synchronize()
        }
    }
    
    public func getSurveyListExcursions() -> [[GetListResponseModel]]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .SurveyListExcursions)) as? Data {
            if let loadedPerson = try? decoder.decode([[GetListResponseModel]].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func saveRateModelTripList(myTrip:[[SendRatedTourList]]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .SendRateTourListTrip))
            preferences.synchronize()
        }
    }
    
    public func getRateModelTripList() -> [[SendRatedTourList]]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .SendRateTourListTrip)) as? Data {
            if let loadedPerson = try? decoder.decode([[SendRatedTourList]].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func saveRateModelExcursionList(myTrip:[[SendRatedTourList]]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .SendRateTourListExcursion))
            preferences.synchronize()
        }
    }
    
    public func getRateModelExcursionList() -> [[SendRatedTourList]]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .SendRateTourListExcursion)) as? Data {
            if let loadedPerson = try? decoder.decode([[SendRatedTourList]].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    public func saveCheckMyTripResponseList(myTrip:[CheckMyTripResponseModel]){
        let preferences = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myTrip) {
            preferences.set(encoded, forKey: getIdentifier(type: .CheckMyTripResponseModel))
            preferences.synchronize()
        }
    }
    
    public func getCheckMyTripResponseList() -> [CheckMyTripResponseModel]{
        let preferences = UserDefaults.standard
        let decoder = JSONDecoder()
        if let savedPerson = preferences.object(forKey: getIdentifier(type: .CheckMyTripResponseModel)) as? Data {
            if let loadedPerson = try? decoder.decode([CheckMyTripResponseModel].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    
    
    private  func  getIdentifier(type:DefaultsType)->String {
        switch type {
        case .User:
            return "UserSave"
        case .CompanyID:
            return "CompanyIDSave"
        case .LanguageID:
            return "LanguageIDSave"
        case .CustomerID:
            return "CustomerIdSave"
        case .DeviceID:
            return "DeviceIdSave"
        case .FlagChoosed:
            return "FlagChoosedSave"
        case .IncomingID:
            return "IncomingID"
        case .TouristID:
            return "TouristID"
        case .LastEmail:
            return "LastEmail"
        case .FlagID:
            return "FlagIDSave"
        case .ActualTrip:
            return "ActualTrip"
        case .PurschasedExcursions:
            return "PurschasedExcursions"
        case .SurveyListTrip:
            return "SurveyListTrip"
        case .SurveyListExcursions:
            return "SurveyListExcursions"
        case .SendRateTourListTrip:
            return "SendRateTourListTrip"
        case .SendRateTourListExcursion:
            return "SendRateTourListExcursion"
        case .CheckMyTripResponseModel:
            return "CheckMyTripResponseModel"
        case .LastPassword:
            return "LastPassword"
        case .PurschasedExcursionsDetails:
            return "PurschasedExcursionsDetails"
        
        }
    }
}

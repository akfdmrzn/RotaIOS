//
//  Defaults.swift
//  BaseProject
//
//  Created by Bekir's Mac on 7.03.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class Defaults{
     enum DefaultsType {
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
    }
    
    init(){}
    
    
    
    func clearData(){
        
//        let userDefaultsData:Defaults = Defaults()
//        let tempLanguageId = userDefaultsData.getLanguageId()
//        let tempMail = userDefaultsData.getLastEmail()
//        
//        if let appDomain = Bundle.main.bundleIdentifier {
//            UserDefaults.standard.removePersistentDomain(forName: appDomain)
//        }
//        
//        _ = userDefaultsData.saveFlagChoosed(flagId: true)
//        userDefaultsData.saveLanguageId(languageId: tempLanguageId)
//        if (tempLanguageId == 2) {
//            LocalizationManager.setCurrentLanguage("en")
//        }
//        else if (tempLanguageId == 3) {
//            LocalizationManager.setCurrentLanguage("ru")
//        }
//        userDefaultsData.saveLastEmail(lastEmail: tempMail)
//        HomeViewController.firstTripModel = nil
        
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
    func saveCompanyID(companyFlagId:Int = 0) -> Bool{ //Default olarak company ID hep 9 gönderiliyor bayrak seçimlerinden sonra ne yapılacağı belli değil
        let preferences = UserDefaults.standard
        let currentCompanyKey = getIdentifier(type: .CompanyID)
        preferences.set(9, forKey: currentCompanyKey)
        let didSave = preferences.synchronize()
        return didSave
    }
    func getCompanyID() -> Int{
        let preferences = UserDefaults.standard
        let currentCompanyKey = getIdentifier(type: .CompanyID)
        
        if preferences.object(forKey: currentCompanyKey) == nil {
            return 9
        } else {
            return preferences.integer(forKey: currentCompanyKey)
        }
    }
    
    //LanguageID
    func saveLanguageId(languageId:Int){
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        preferences.set(languageId, forKey: currentLanguageKey)
        preferences.synchronize()
    }
    
    func getLanguageId() -> Int{
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        if preferences.object(forKey: currentLanguageKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentLanguageKey)
        }
    }
    
    //CustomerID
    func saveCustomerID(customerId:Int){
        let preferences = UserDefaults.standard
        let currentCsutomerKey = getIdentifier(type: .CustomerID)
        preferences.set(customerId, forKey: currentCsutomerKey)
        preferences.synchronize()
    }
    
    func getCustomerID() -> Int{
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
    
    //FlagID
    func saveFlagID(flagId:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagID)
        preferences.set(flagId, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    func getFlagID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    //FlagChoosed
    func saveFlagChoosed(flagId:Bool){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagChoosed)
        preferences.set(flagId, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    func getFlagChoosed() -> Bool{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .FlagChoosed)
        if preferences.object(forKey: currentFlagKey) == nil {
            return false
        } else {
            return preferences.bool(forKey: currentFlagKey)
        }
    }
    
    func saveIncomingID(incomingID:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .IncomingID)
        preferences.set(incomingID, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    func getIncomingID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .IncomingID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return 2
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    
    func saveTouristID(incomingID:Int){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .TouristID)
        preferences.set(incomingID, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    func getTouristID() -> Int{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .TouristID)
        if preferences.object(forKey: currentFlagKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentFlagKey)
        }
    }
    
    func saveLastEmail(lastEmail:String){
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .LastEmail)
        preferences.set(lastEmail, forKey: currentFlagKey)
        preferences.synchronize()
    }
    
    func getLastEmail() -> String{
        let preferences = UserDefaults.standard
        let currentFlagKey = getIdentifier(type: .LastEmail)
        if preferences.object(forKey: currentFlagKey) == nil {
            return ""
        } else {
            return preferences.value(forKey: getIdentifier(type: .LastEmail)) as! String
        }
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
        }
    }
}

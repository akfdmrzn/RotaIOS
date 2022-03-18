//
//  ConfigManager.swift
//  RotaIOS
//
//  Created by Akif Demirezen on 17.03.2022.
//

import Foundation

class ConfigManager {
    
    static let shared = ConfigManager()
    private var appType: AppType
    private var testConfiguration: Bool
    
    private init() {
        switch Bundle.main.bundleIdentifier {
        case ConfigConstants.Rota_IOS_TR_BUNDLE_IDENTIFIER:
            appType = .RotaTR
        case ConfigConstants.Rota_IOS_EGYPT_BUNDLE_IDENTIFIER:
            appType = .RotaEgypt
        default:
            appType = .RotaTR
        }
        #if RotaIOSTRTest || RotaIOSEgyptTest
        testConfiguration = true
        #else
        testConfiguration = false
        #endif
    }
    
    func getAppType() -> AppType {
        return appType
    }
    
    func getBaseUrl() -> String {
        switch appType {
        case .RotaTR:
            return testConfiguration ? ConfigConstants.Rota_IOS_TR_TEST_URL : ConfigConstants.Rota_IOS_TR_PROD_URL
        case .RotaEgypt:
            return testConfiguration ? ConfigConstants.Rota_IOS_EGYPT_TEST_URL : ConfigConstants.Rota_IOS_EGYPT_PROD_URL
        }
    }
    
    func getFirebaseGoogleInfoPlist() -> String {
        switch appType {
        case .RotaTR:
            return ConfigConstants.Rota_IOS_TR_GOOGLE_INFO_PLIST
        case .RotaEgypt:
            return ConfigConstants.Rota_IOS_EGYPT_GOOGLE_INFO_PLIST
        
        }
    }
}



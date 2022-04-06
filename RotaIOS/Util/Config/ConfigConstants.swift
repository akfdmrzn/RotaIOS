//
//  ConfigConstants.swift
//  RotaIOS
//
//  Created by Akif Demirezen on 17.03.2022.
//

import Foundation

struct ConfigConstants {
    
    //    RotaIOSTR
    static let Rota_IOS_TR_BUNDLE_IDENTIFIER = "com.oti.rotaIosTRMobile"
    static let Rota_IOS_TR_TEST_URL = "https://rota-uat.odeontours.com"
    static let Rota_IOS_TR_PROD_URL = "https://rota.odeontours.com/"
    static let Rota_IOS_TR_GOOGLE_INFO_PLIST = "GoogleService-Info-RotaTR"
    
    //    RotaIOSEgypt
    static let Rota_IOS_EGYPT_BUNDLE_IDENTIFIER = "com.oti.rotaIosEgyptMobile"
    static let Rota_IOS_EGYPT_TEST_URL = "https://rota-uat-eg.odeontours.com"
    static let Rota_IOS_EGYPT_PROD_URL = "https://rota-eg.odeontours.com"
    static let Rota_IOS_EGYPT_GOOGLE_INFO_PLIST = "GoogleService-Info-RotaEGYPT"
}

enum AppType {
    case RotaTR
    case RotaEgypt
}

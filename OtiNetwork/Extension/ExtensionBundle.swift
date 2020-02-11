//
//  ExtensionBundle.swift
//  Alamofire
//
//  Created by Cüneyt AYVAZ on 11.02.2020.
//

import Foundation

extension Bundle {
    
    public var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    public var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
}

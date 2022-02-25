//
//  ExtensionUIClour.swift
//  Rota
//
//  Created by Yasin Dalkilic on 19.04.2021.
//

import Foundation
import UIKit

extension UIColor {
    class var mainColor:                        UIColor { return UIColor(hexString: "4485a3") }
    class var tabbarHighlineBackground:         UIColor { return UIColor(hexString: "f9a01c") }
    class var textColor:                        UIColor { return UIColor.white }
    class var darkTextColor:                    UIColor { return UIColor.black }
    class var iconColor:                        UIColor { return UIColor(hexString: "ffffff") }
    class var tabbarColor:                      UIColor { return UIColor(hexString: "609db9") }
    class var homeMainTextColor:                UIColor { return UIColor.black }
    class var headerIconColor:                  UIColor { return UIColor(hexString: "f9a01c") }
    class var backPageTitleColor:               UIColor { return UIColor(hexString: "ffffff") }
    class var coralGreen:                       UIColor { return UIColor(hexString: "00c714") }
    class var airlineInfoTemplate:              UIColor { return UIColor(hexString: "f9a01c") }
    class var darkTextFieldColor:               UIColor { return UIColor(hexString: "000000").withAlphaComponent(0.3) }
    class var customButtonColor:                UIColor { return UIColor(hexString: "f9a01c") }
    class var textFieldDarkPlaceHolder:         UIColor { return UIColor(hexString: "ffffff").withAlphaComponent(0.5) }
    class var coralYellow:                      UIColor { return UIColor(hexString: "ffe600") }
    class var grey:                             UIColor { return UIColor(hexString: "7b7b7b") }
    class var womanColor:                       UIColor { return UIColor(hexString: "ef8fff") }
    class var manColor:                         UIColor { return UIColor(hexString: "6d9cb6") }
    class var mainTextColor :                   UIColor { return UIColor(hexString: "#000000").withAlphaComponent(0.9) }
    class var mainViewColor :                   UIColor { return UIColor(hexString: "#333333").withAlphaComponent(0.9) }
    class var grayColor :                       UIColor { return UIColor(hexString: "#333333") }
    class var greenColor :                      UIColor { return UIColor(hexString: "##5AA427") }
    class var tableViewColor :                  UIColor { return UIColor(hexString: "#1C1C1D") }
    class var lightGreenColor :                 UIColor { return UIColor(hexString: "#BFD732") }
    class var darkGreenColor :                  UIColor { return UIColor(hexString: "#3DB54A") }
    class var barGreenColor :                   UIColor { return UIColor(hexString: "#56B53B") }
    class var barGrayColor :                    UIColor { return UIColor(hexString: "#191919") }
    class var darkGrayColor :                   UIColor { return UIColor(hexString: "#1C1C1D") }
    class var excursionColor:                   UIColor { return UIColor(hexString: "#FFB300") }
    class var collectionColor:                  UIColor { return UIColor(hexString: "#1C1C1D") }
    class var deliveryColor:                    UIColor { return UIColor(hexString: "#035D00") }
    class var arrivalColor:                     UIColor { return UIColor(hexString: "#26C455") }
    class var departureColor:                   UIColor { return UIColor(hexString: "#B71C1C") }
    class var internColor:                      UIColor { return UIColor(hexString: "#D9D9D9") }
    class var speakTimeColor:                   UIColor { return UIColor(hexString: "#00C9C3") }
    class var infoPlanColor:                    UIColor { return UIColor(hexString: "#B800AC") }
    class var indShopForMobileColor:            UIColor { return UIColor(hexString: "#FF6600") }
    class var noteGrayColor:                    UIColor { return UIColor(hexString: "#707070") }
    
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}

extension UISearchBar {

    // Due to searchTextField property who available iOS 13 only, extend this property for iOS 13 previous version compatibility
    var compatibleSearchTextField: UITextField {
        guard #available(iOS 13.0, *) else { return legacySearchField }
        return self.searchTextField
    }

    private var legacySearchField: UITextField {
        if let textField = self.subviews.first?.subviews.last as? UITextField {
            // Xcode 11 previous environment
            return textField
        } else if let textField = self.value(forKey: "searchField") as? UITextField {
            // Xcode 11 run in iOS 13 previous devices
            return textField
        } else {
            // exception condition or error handler in here
            return UITextField()
        }
    }
}


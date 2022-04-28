//
//  ExtensionString.swift
//  RotaIOS
//
//  Created by odeon on 6.01.2022.
//

import UIKit
import Foundation

extension String {
    
    func dateFormat() -> String {
        let arr = self.components(separatedBy: "-")
        let month = arr[0]
        let day = arr[1]
        let year = arr[2]
        return "\(day).\(month).\(year)"
    }
    
    func dateFormatStr() -> String {
        let arr = self.components(separatedBy: "-")
        let year = arr[0]
        let month = arr[1]
        let day = arr[2]
        return "\(day).\(month).\(year)"
    }
    
    func getDateFormatStr() -> String {
        let arr = self.components(separatedBy: ".")
        let day = arr[0]
        let month = arr[1]
        let year = arr[2]
        return "\(year)\(month)\(day)"
    }
    
    func dateToString() -> String {
        return self.components(separatedBy: "T")[0]
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}

extension String {
    func before(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return ""
    }
    
    func after(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let after = suffix(from: index).dropFirst()
            return String(after)
        }
        return ""
    }
}

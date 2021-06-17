//
//  AddMoreTouristResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 17.06.2021.
//

import UIKit
import ObjectMapper

public class AddMoreTouristResponseModel: Mappable {
    
    public var id : Int?
    public var fullName : String?
    public var gender : String?
    public var dateOfBirth : String?
    public var askForHeight : Bool?

    public required init?(map: Map) {
        
    }
    
    public init(id: Int, fullName: String, gender: String, dateOfBirth: String, askForHeight: Bool) {
        self.id = id
        self.fullName = fullName
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.askForHeight = askForHeight
    }

    public func mapping(map: Map) {
        id <- map["Id"]
        fullName <- map["FullName"]
        gender <- map["Gender"]
        dateOfBirth <- map["DateOfBirth"]
        askForHeight <- map["AskForHeight"]
    }
}

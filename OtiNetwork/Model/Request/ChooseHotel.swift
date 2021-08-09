//
//  ChooseHotel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 9.08.2021.
//

import UIKit

public class ChooseHotel{
    public var id: Int? = 0
    public var name:String? = ""
    public var askForHeight:Bool? = false
    public var isSelected:Bool? = false
    public var voucherNumber:Int? = 0
    public var operatorId:Int? = 0
    
    public init() {}
    
    public init(id:Int,name:String,askForHeight:Bool,isSelected:Bool!,operatorId : Int = 0,voucherNumber : Int = 0) {
        self.id = id
        self.name = name
        self.askForHeight = askForHeight
        self.isSelected = isSelected
        self.operatorId = operatorId
        self.voucherNumber = voucherNumber
    }
}


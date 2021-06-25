//
//  CompanyInfo.swift
//  OtiNetwork
//
//  Created by odeon on 25.06.2021.
//

import UIKit

public class CompanyList: NSObject {
    var id:Int!
    var name:String!
    override init() {}
    
    init(id:Int,name:String!) {
        self.id = id
        self.name = name
    }
}


//
//  BaseData.swift
//  BaseProject
//
//  Created by Bekir's Mac on 18.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
class BaseData{
    
    static let shared = BaseData()
    
    private init(){}
    
    var getTokenResponse:BaseResponse<GetTokenResponse>!
    
}

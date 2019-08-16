//
//  BaseData.swift
//  BaseProject
//
//  Created by Bekir's Mac on 18.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
class BaseData{
    
   public static let shared = BaseData()
    
    private init(){}
    
   public var getTokenResponse:BaseResponse<GetTokenResponse>!
    
}

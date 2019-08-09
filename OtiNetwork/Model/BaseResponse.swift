//
//  BaseResponse.swift
//  BaseProject
//
//  Created by Bekir's Mac on 19.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//
import ObjectMapper
class BaseResponse<T:Mappable >:Mappable{
    
    public var token :String?
    public var isSuccess :Bool?
    public var threadGuid :String?
    public var baseMessageList :BaseMessageItem?
    var dataArray: [T]?
    var dataObject: T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        token <- map["Token"]
        isSuccess <- map["IsSuccess"]
        threadGuid <- map["ThreadGuid"]
        baseMessageList <- map["BaseMessage"]
        dataObject <- map["Data"]
        dataArray <- map["Data"]
        
    }
    
    
}


class GetTokenResponse:Mappable{
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
}


//
//  BaseApiRequest.swift
//  BaseProject
//
//  Created by Bekir's Mac on 19.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//
import ObjectMapper
public class BaseApiRequestBody<T:Mappable >:Mappable{
 
    var token:String!
    var languageId:Int!
    var mobilInformation:String!
    var data:T!
    var dataArray:[T]!
    
    
    public required init?(map: Map) {
        
    }
    
    public  func mapping(map: Map) {
        token <- map["Token"]
        languageId <- map["LanguageId"]
        mobilInformation <- map["MobilInformation"]
        data <- map["Data"]
        dataArray <- map["Data"]
    }
    

    
   public init(token:String!,languageId:Int,mobilInformation:String){
        self.token = token
        self.languageId = languageId
        self.mobilInformation = mobilInformation
    }
    
   public init(token:String!,languageId:Int,mobilInformation:String,data:T){
        self.token = token
        self.languageId = languageId
        self.mobilInformation = mobilInformation
        self.data = data
    }
   public init(token:String!,languageId:Int,mobilInformation:String,dataArray:[T]){
        self.token = token
        self.languageId = languageId
        self.mobilInformation = mobilInformation
        self.dataArray = dataArray
    }
   public func setData(data:T){
        self.data = data
    }
   public func setDataArray(dataArray:[T]){
        self.dataArray = dataArray
    }

}

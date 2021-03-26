//
//  ViewController.swift
//  OtiNetwork
//
//  Created by akfdmrzn on 08/09/2019.
//  Copyright (c) 2019 akfdmrzn. All rights reserved.
//

import UIKit
import OtiNetwork

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let basetoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxNzAxMCIsIkxhbmd1YWdlIjoiMiIsIlVzZXJuYW1lIjoiQjJDTW9iaWxlQXBwIiwiQXBwVXNlcklEIjoiMiIsIlVzZXJUeXBlcyI6IjcxIiwibmJmIjoxNjE2NjgwNjAwLCJleHAiOjE2MTY3MDk0MDAsImlhdCI6MTYxNjY4MDYwMH0.bsqZMdL3OR3ajDhDLvsXk_0kOE8EjAidl5lelvkv6MM"
        let getSuitcaseRequestModel = GetSuitcaseRequestModel.init(customerId: 6, tourId: "V9647559C6")
        let sonmodel = getBaseRequestData(data: getSuitcaseRequestModel)
        sonmodel.token = basetoken
        NetworkManager.sendRequest(url: "http://mobilb2c.coral.ru/V2_0/", endPoint: .GetSuitcase, requestModel: sonmodel) { (response: BaseResponse<GetSuitcaseResponseModel>) in
            if response.isSuccess!{
                
            }
        }
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


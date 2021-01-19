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
        
        
        let loginData = LoginShortRequest.init(userEncrypted: "sad")
        self.showIndicator(tag: "0")
        let saveactual = GetActualTripResponseModel.init(JSON: ["voucher":3])

        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


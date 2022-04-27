//
//  OnlineSalesViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 22.04.2022.
//

import UIKit

class OnlineSalesViewController: UIViewController {
    @IBOutlet var viewOnlineSales: OnlineSalesView!
    var voucherNo = ""
    var guideID = 0
    var preBookingDetail : GetPreBookingResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    @IBAction func checkButtonTapped(_ sender: Any) {
        self.voucherNo = self.viewOnlineSales.textPrebookingId.text ?? ""
        self.guideID = userDefaultsData.getGuideId()
        
        let requestPreBooking = GetPreBookingRequestModel.init(voucherNo: self.voucherNo, guideid: self.guideID)
        
        NetworkManager.sendGetRequest(url: NetworkManager.BASEURL, endPoint: .GetPreBooking, method: .get, parameters: requestPreBooking.requestPathString()) { (response : GetPreBookingResponseModel) in
            if response.record != nil {
                self.preBookingDetail = response
                self.otiPushViewController(viewController: OnlineSalesDetailViewController.init(preBookingDetailListInDetailPage: self.preBookingDetail!))
            }else{
                let alert = UIAlertController.init(title: "Warning", message: "Please be sure Prebooking number is correct", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}

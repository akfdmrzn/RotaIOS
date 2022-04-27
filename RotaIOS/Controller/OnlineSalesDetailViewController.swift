//
//  OnlineSalesDetailViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 26.04.2022.
//

import UIKit

class OnlineSalesDetailViewController: UIViewController {
    @IBOutlet var viewOnlineSalesDetail: OnlineSalesDetailView!
    @IBOutlet weak var tableView: UITableView!
    var preBookingDetail : GetPreBookingResponseModel?
    var date = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.date = self.preBookingDetail?.record?.excDate ?? ""
        self.viewOnlineSalesDetail.labelExcursionDate.text = String(self.date.prefix(10))
        self.viewOnlineSalesDetail.labelCurrency.text = self.preBookingDetail?.record?.currency
        self.viewOnlineSalesDetail.labelAmount.text = ""
      //  self.viewOnlineSalesDetail.labelTourist.text = self.preBookingDetail?.record?.paxes
      /*  self.viewOnlineSalesDetail.labelExtra.text = self.preBookingDetail?.record?.excursionName
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName */
        
    }
    
    init(preBookingDetailListInDetailPage : GetPreBookingResponseModel) {
        super.init(nibName: nil, bundle: nil)
        self.preBookingDetail = preBookingDetailListInDetailPage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addPaymetButtonTapped(_ sender: Any) {
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
    }
    
}

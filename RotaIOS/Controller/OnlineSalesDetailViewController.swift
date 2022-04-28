//
//  OnlineSalesDetailViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 26.04.2022.
//

import UIKit
import DropDown

class OnlineSalesDetailViewController: UIViewController {
    @IBOutlet var viewOnlineSalesDetail: OnlineSalesDetailView!
    @IBOutlet weak var tableView: UITableView!
    var preBookingDetail : GetPreBookingResponseModel?
    var date = ""
    var paxes = ""
    //Type Menu
    var typeList = ["CASH","CARD"]
    var paymentTypeList : [PaymentType] = []
    var typeMenu = DropDown()
    var selectedPaymentType = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paxes = self.preBookingDetail?.record?.paxes ?? ""
        
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.date = self.preBookingDetail?.record?.excDate ?? ""
        self.viewOnlineSalesDetail.labelExcursionDate.text = String(self.date.prefix(10))
        self.viewOnlineSalesDetail.labelCurrency.text = self.preBookingDetail?.record?.currency
        self.viewOnlineSalesDetail.labelAmount.text = String(self.preBookingDetail?.record?.totalExcursionAmount ?? 0.0)
        self.viewOnlineSalesDetail.labelTourist.text = self.preBookingDetail?.record?.paxes ?? ""
        self.paxes = self.paxes.before(first: ",")
        self.viewOnlineSalesDetail.labelExtra.text = self.paxes
            
        self.typeMenu.dataSource = self.typeList
        self.typeMenu.dataSource.insert("", at: 0)
        self.typeMenu.backgroundColor = UIColor.grayColor
        self.typeMenu.separatorColor = UIColor.gray
        self.typeMenu.textColor = .white
        self.typeMenu.anchorView = self.viewOnlineSalesDetail.viewType
        self.typeMenu.topOffset = CGPoint(x: 0, y:-(self.typeMenu.anchorView?.plainView.bounds.height)!)
        
        let gestureType = UITapGestureRecognizer(target: self, action: #selector(didTappedTypeListMenu))
        gestureType.numberOfTouchesRequired = 1
        self.viewOnlineSalesDetail.viewType.addGestureRecognizer(gestureType)
        
        self.typeMenu.selectionAction = { index, title in
            self.viewOnlineSalesDetail.viewType.mainLabel.text = title
            self.selectedPaymentType = title
        }
        
    }
    
    @objc func didTappedTypeListMenu() {
        self.typeMenu.show()
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

//
//  OnlineSalesDetailViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 26.04.2022.
//

import UIKit
import DropDown
import Foundation
import ObjectMapper

class SendPreBookingData : Mappable, Encodable, Decodable {
    var countryId : Int?
    var currencyId : Int?
    var guideId : Int?
    var paidBy : String?
    var paymentAmount : Double?
    var paymentDate : String?
    var payments : [Payment] = []
    var voucherNo : String?
    
    public init(countryId : Int,  currencyId : Int, payments : [Payment], guideId : Int, paidBy : String, paymentDate : String, paymentAmount : Double, voucherNo : String ) {
        self.countryId = countryId
        self.currencyId = currencyId
        self.payments = payments
        self.guideId = guideId
        self.paidBy = paidBy
        self.paymentAmount = paymentAmount
        self.paymentDate = paymentDate
        self.voucherNo = voucherNo
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        countryId <- map["countryId"]
        currencyId <- map["currencyId"]
        payments <- map["payments"]
        guideId <- map["guideId"]
        paidBy <- map["paidBy"]
        paymentAmount <- map["paymentAmount"]
        paymentDate <- map["paymentDate"]
        voucherNo <- map["voucherNo"]
    }
}

class OnlineSalesDetailViewController: UIViewController {
    @IBOutlet var viewOnlineSalesDetail: OnlineSalesDetailView!
    @IBOutlet weak var tableView: UITableView!
    var preBookingDetail : GetPreBookingResponseModel?
    var date = ""
    var paxes = ""
    var paxesIds = ""
    //Type Menu
    var typeList = ["CASH","CARD"]
    var paymentTypeList : [PaymentType] = []
    var typeMenu = DropDown()
    var selectedPaymentType = ""
    //TouristMenu
    var touristMenu = DropDown()
    var tempTouristMenu  : [String] = []
    var selectedTouristName = ""
    var selectedTouristId = ""
    ///
    var totalAmount = 0.0
    var totalPayment = 0.0
    var selectedCurrencyType = ""
    var savedTotalAmount = 0.00
    var balanceAmount = 0.00
    var currencyId = 0
    var deletedAmount = 0.0
    var payments : [Payment] = []
    var paxesList : [String] = []
    var paxesIdList : [String] = []
    var extraList : [PreBookingExtras] = []
    var extrasNameList : [String] = []
    var extrasNameListStringType = ""
    var extrasPaxesList : [String] = []
    var extrasPaxesListStringType = ""
    var guideId = 0
    var voucherNo = ""
    var data = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.guideId = userDefaultsData.getGuideId()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ProceedPaxTableViewCell.nib, forCellReuseIdentifier: ProceedPaxTableViewCell.identifier)
        
        self.paxes = self.preBookingDetail?.record?.paxes ?? ""
        self.paxesList = self.paxes.components(separatedBy: ",")
        
        self.paxesIds = self.preBookingDetail?.record?.paxesId ?? ""
        self.paxesIdList = self.paxesIds.components(separatedBy: ",")
        
        self.viewOnlineSalesDetail.labelExcursion.text = self.preBookingDetail?.record?.excursionName
        self.date = self.preBookingDetail?.record?.excDate ?? ""
        self.viewOnlineSalesDetail.labelExcursionDate.text = String(self.date.prefix(10))
        self.viewOnlineSalesDetail.labelCurrency.text = self.preBookingDetail?.record?.currency
        self.viewOnlineSalesDetail.labelAmount.text = String(self.preBookingDetail?.record?.totalExcursionAmount ?? 0.0)
        self.totalAmount = self.preBookingDetail?.record?.totalExcursionAmount ?? 0.0
        self.viewOnlineSalesDetail.viewAmount.mainText.text = String(self.totalAmount)
        self.viewOnlineSalesDetail.viewTotalAmount.mainLabel.text = String(self.totalAmount)
        self.viewOnlineSalesDetail.labelTourist.text = self.preBookingDetail?.record?.paxes ?? ""
       // self.paxes = self.paxes.before(first: ",")
        
        self.extraList =  self.preBookingDetail?.record?.extras ?? self.extraList
        
        if self.extraList.count > 0 {
            for i in 0...self.extraList.count - 1 {
                self.extrasNameList.append(self.extraList[i].extraName ?? "")
                self.extrasPaxesList.append(self.extraList[i].paxes ?? "")
            }
            self.extrasNameListStringType = self.extrasNameList.joined(separator: ",")
            self.extrasPaxesListStringType = self.extrasPaxesList.joined(separator: ",")
        }
        self.viewOnlineSalesDetail.labelExtra.text = self.extrasNameListStringType
        self.viewOnlineSalesDetail.labelExtraTourist.text = self.extrasPaxesListStringType
     
        self.viewOnlineSalesDetail.viewCurrency.mainLabel.text = self.preBookingDetail?.record?.currency ?? ""
        self.selectedCurrencyType = self.preBookingDetail?.record?.currency ?? ""
        self.currencyId = self.preBookingDetail?.record?.totalExcAmountCurrencyId ?? 0
        self.viewOnlineSalesDetail.viewBalanced.mainLabel.text = String(self.totalAmount)
        
        // Type Menu
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
        
        // TouristMenu
        self.viewOnlineSalesDetail.viewTourist.mainLabel.text = self.paxesList[0]
        self.touristMenu.dataSource = self.paxesList
        self.touristMenu.dataSource.insert("", at: 0)
        self.touristMenu.backgroundColor = UIColor.grayColor
        self.touristMenu.separatorColor = UIColor.gray
        self.touristMenu.textColor = .white
        self.touristMenu.anchorView = self.viewOnlineSalesDetail.viewTourist
        self.touristMenu.topOffset = CGPoint(x: 0, y:-(self.touristMenu.anchorView?.plainView.bounds.height)!)
        
        let gestureExchange = UITapGestureRecognizer(target: self, action: #selector(didTappedToristListMenu))
        gestureExchange.numberOfTouchesRequired = 1
        self.viewOnlineSalesDetail.viewTourist.addGestureRecognizer(gestureExchange)
        
        self.touristMenu.selectionAction = { index, title in
            self.viewOnlineSalesDetail.viewTourist.mainLabel.text = title
            self.selectedTouristName = title
            self.selectedTouristId = self.paxesList[index]
        }
    }
    
    @objc func didTappedTypeListMenu() {
        self.typeMenu.show()
    }
    
    init(preBookingDetailListInDetailPage : GetPreBookingResponseModel, voucherNo : String) {
        super.init(nibName: nil, bundle: nil)
        self.preBookingDetail = preBookingDetailListInDetailPage
        self.voucherNo = voucherNo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addPaymetButtonTapped(_ sender: Any) {
        var roundedPaymentAmount = 0.0
        var roundedPaymentAmountChosenCurrency = 0.0
        self.viewOnlineSalesDetail.viewAmount.mainText.text = self.viewOnlineSalesDetail.viewAmount.mainText.text?.replacingOccurrences(of: ",", with: ".")
        let paymentAmount = Double(self.viewOnlineSalesDetail.viewAmount.mainText.text ?? "")
        roundedPaymentAmountChosenCurrency = paymentAmount ?? 0.0
        roundedPaymentAmountChosenCurrency = Double(Darwin.round(100 * roundedPaymentAmountChosenCurrency) / 100 )
        roundedPaymentAmount = paymentAmount ?? 0.00
        roundedPaymentAmount = Double(Darwin.round(100 * roundedPaymentAmount) / 100 )
        
        if self.selectedPaymentType != "" && self.selectedTouristName != "" {
            
            /* self.paymentTypeList.append(PaymentType(paymentype: self.selectedPaymentType, paymentAmount: Double(self.viewAmount.mainText.text ?? "") ?? 0.00), currencyTpye : self.selectedCurrencyType)*/
            self.paymentTypeList.append(PaymentType.init(paymentype:self.selectedPaymentType, paymentAmount: roundedPaymentAmountChosenCurrency, currencyTpye:  self.selectedCurrencyType))
            
            self.tableView.reloadData()
            
            self.savedTotalAmount += paymentAmount ?? 0.0
            
            var roundedSavedTotalAmountValue = Double(Darwin.round(100 * self.savedTotalAmount) / 100 )
            
            self.viewOnlineSalesDetail.viewPaid.mainLabel.text = String(roundedSavedTotalAmountValue)
            self.viewOnlineSalesDetail.viewPaid.mainLabel.text = self.viewOnlineSalesDetail.viewPaid.mainLabel.text?.replacingOccurrences(of: ",", with: ".")
            
            if roundedSavedTotalAmountValue < 0 {
                roundedSavedTotalAmountValue = -roundedSavedTotalAmountValue
            }
            self.balanceAmount = self.totalAmount - roundedSavedTotalAmountValue
            //self.totalAmount = self.balanceAmount
            let roundedBalanceValue = Double(Darwin.round(100 * self.balanceAmount) / 100 )
            if roundedBalanceValue <= 0.5 && roundedBalanceValue >= -0.5 {
                self.balanceAmount = 0.0
                
            }
            self.viewOnlineSalesDetail.viewBalanced.mainLabel.text = String(roundedBalanceValue)
            
            self.viewOnlineSalesDetail.viewTotalAmount.mainText.text = self.viewOnlineSalesDetail.viewTotalAmount.mainText.text?.replacingOccurrences(of: ",", with: ".")
            
            self.payments.append(Payment(ByDesc: self.selectedTouristName , ById: self.selectedTouristId, ConvertedCurrency:  self.selectedCurrencyType, ConvertedPaymentAmount:  Int(self.totalAmount), Currency: self.selectedCurrencyType, CurrencyId: String(self.currencyId), PaymentAmount: Double(self.viewOnlineSalesDetail.viewAmount.mainText.text ?? "") ?? 0.00, PaymentType: self.selectedPaymentType, TargetAmount:0, TypeId: self.selectedPaymentType))
            self.totalPayment += Double(self.viewOnlineSalesDetail.viewAmount.mainText.text ?? "") ?? 0.0
            
        }else {
            let alert = UIAlertController.init(title: "Error", message: "Please Insert CurrencyType, Pax and PaymentType", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
        
        let payPrebooking = SendPreBookingData(countryId: 1, currencyId: self.currencyId, payments: self.payments, guideId: self.guideId, paidBy: self.selectedTouristName, paymentDate: self.date, paymentAmount: self.totalPayment, voucherNo: self.voucherNo)
        
        self.data = "\(payPrebooking.toJSONString() ?? "")"
        print(data)
        
        let payPreBookingRequestModel = GetPayPreBookingRequestModel.init(data: self.data)
        
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetPayPreBooking, requestModel: payPreBookingRequestModel ) { (response: GetPayPreBookingResponseModel) in
            if response.isSuccesful == true {
                
                print(response)
                let alert = UIAlertController(title: "SUCCSESS", message: "\(response.message ?? "")\(self.voucherNo)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                if let topVC = UIApplication.getTopViewController() {
                    topVC.present(alert, animated: true, completion: nil)
                }
               
            }else {
                self.buttonColor(isEnable: false, button: self.viewOnlineSalesDetail.buttonPay)
                let alert = UIAlertController(title: "FAILED", message: response.message ?? "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                if let topVC = UIApplication.getTopViewController() {
                    topVC.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func didTappedToristListMenu() {
        self.touristMenu.show()
    }
    
}

extension OnlineSalesDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paymentTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProceedPaxTableViewCell.identifier) as! ProceedPaxTableViewCell
        cell.labelPaymentType.text = paymentTypeList[indexPath.row].paymentype
        cell.labelPaymentPrice.text = "\(Double(paymentTypeList[indexPath.row].paymentAmount ?? 0.00 ))"
        cell.labelPaymentCurrency.text = paymentTypeList[indexPath.row].currencyTpye
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
           
            var roundedSavedValue = 0.0
           
            self.deletedAmount = self.paymentTypeList[indexPath.row].paymentAmount ?? 0.00
            let roundedDeletedValue = Double(Darwin.round(100 * self.deletedAmount) / 100 )
            self.savedTotalAmount -= roundedDeletedValue
            roundedSavedValue = Double(Darwin.round(100 * self.savedTotalAmount) / 100 )
            if roundedSavedValue == -0.0 {
                roundedSavedValue = 0.0
            }
            self.viewOnlineSalesDetail.viewPaid.mainLabel.text = String(roundedSavedValue)
            self.viewOnlineSalesDetail.viewPaid.mainLabel.text = self.viewOnlineSalesDetail.viewPaid.mainLabel.text?.replacingOccurrences(of: ",", with: ".")
            self.balanceAmount = self.totalAmount - roundedSavedValue
            self.viewOnlineSalesDetail.viewBalanced.mainLabel.text = String(self.balanceAmount)
            if let index = self.payments.firstIndex(where: {$0.PaymentAmount ==  self.paymentTypeList[indexPath.row].paymentAmount ?? 0.00} ){
                self.payments.remove(at: index)
                self.totalPayment -= self.payments[index].PaymentAmount ?? 0.0
            }
            
            self.paymentTypeList.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            print(self.paymentTypeList)
        }
    }
}

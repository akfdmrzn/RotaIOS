//
//  ExcProceedCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 16.12.2021.
//

import Foundation
import UIKit
import DropDown
import ObjectMapper


struct SendDataPrint {
    var tourName : String?
    var paxInfo : String?
    var voucher : String?
    var tourDate : String?
    var transTourist : String?
    var hotelName : String?
    var date : String?
    var room : String?
    var paxName : String?
    var operatorName : String?
    var resNo : String?
    var total : String?
    var discount : String?
    var netTotal : String?
    var cash : String?
    var card : String?
    var guideInfoNumber : String?
    var pickUpTime : String?
    var extras : String?
    var transfers : String?
}

struct PaymentType {
    var paymentype : String?
    var paymentAmount : Double?
    var currencyTpye : String?
}

class ExcProceedCustomView: UIView{
    @IBOutlet var viewMainView: UIView!
    @IBOutlet weak var viewTouristView: MainTextCustomView!
    @IBOutlet weak var viewCurrencyType: MainTextCustomView!
    @IBOutlet weak var viewType: MainTextCustomView!
    @IBOutlet weak var viewAmount: MainTextCustomView!
    @IBOutlet weak var viewDiscount: MainTextCustomView!
    @IBOutlet weak var viewNotes: MainTextCustomView!
    @IBOutlet weak var viewPaid: MainTextCustomView!
    @IBOutlet weak var viewBalanced: MainTextCustomView!
    @IBOutlet weak var viewDicountCalculate: MainTextCustomView!
    @IBOutlet weak var viewTotalAmount: MainTextCustomView!
    @IBOutlet weak var viewCurrencyConvert: MainTextCustomView!
    @IBOutlet weak var buttonApplyDiscount: UIButton!
    @IBOutlet weak var buttonAddPayment: UIButton!
    @IBOutlet weak var buttonConvert: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var buttonPrintVoucher: UIButton!
    var totalAmount = 0.00
    var balanceAmount = 0.00
    var savedTotalAmount = 0.00
    var discount = 0.00
    var selectedTouristName = ""
    var selectedCurrencyType = ""
    var selectedPaymentType = ""
    var data = ""
    var offlineDataList : [TourSalePost] = []
    // TourList
    var tourList : [GetSearchTourResponseModel] = []
    //currencyMenu
    var currencyList : [GetCurrencyResponeModel] = []
    var currencyMenu = DropDown()
    var tempCurrencyMenu  : [String] = []
    //TouristMenu
    var touristList : [GetInHoseListResponseModel] = []
    var touristMenu = DropDown()
    var tempTouristMenu  : [String] = []
    //TypeMenu
    var typeList = ["CASH","CARD"]
    var paymentTypeList : [PaymentType] = []
    var typeMenu = DropDown()
    //ExchangeMenu
    var exchangeList : [GetExhangeRatesResponseModel] = []
    var exchangeMenu = DropDown()
    var selectedExchange : [GetExhangeRatesResponseModel] = []
    var exchangeListStringType : [String] = []
    var valueforDivided = 1.0
    var convertedCurrency = 0.00
    var convertedCurrencyTitle = ""
    var payments : [Payment] = []
    var minPerson = 0
    var minPriceTotal = 0.0
    var currencyId = 0
    var hotelId = 0
    var marketId = 0
    let date = Date()
    var currentDate = ""
    var voucherNo : [String] = []
    var pickUpTimeProceedView = ""
    var internetConnection = true
    var promotionTourList : [Tours] = []
    var tourTotalAmount = 0.0
    var totalPricePerTour = 0.0
    var deletedAmount = 0.0
    var sendedTotalAmount = 0.0
    var extras : [Extras] = []
    var transfers : [Transfers] = []
    var multisaleCurrencyId = 0
    var extrasTotalPrice = 0.0
    var transfersTotalPrice = 0.0
    var tourExtras : [Extras] = []
    var tourTransfers : [Transfers] = []
    var printManager = PrintManager.sharedInstance
    var promotionDiscount = 0.0
    var promotionId = 0
    var printString = ""
    var tourNameList : [String] = []
    var paxList : [String] = []
    var totalDiscount = 0.0
    var printList : [SendDataPrint] = []
    var printListStringType : [String] = []
    var connectedAccessories : [EAAccessory] = []
    var savedFirstValue = 0.0
    var addedNumber = 1100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: ExcProceedCustomView.self), owner: self, options: nil)
        printManager.connectionDelegate = self
        self.updateConnectedAccessories()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ProceedPaxTableViewCell.nib, forCellReuseIdentifier: ProceedPaxTableViewCell.identifier)
        self.tableView.backgroundColor = UIColor.tableViewColor
        
        self.touristList = userDefaultsData.getPaxesList() ?? self.touristList
        self.tourList = userDefaultsData.getTourList() ?? self.tourList
        
        self.extras = userDefaultsData.getExtrasList() ?? self.extras
        self.transfers = userDefaultsData.getTransfersList() ?? self.transfers
        
       
        self.voucherNo = userDefaultsData.getMaxVoucher() ?? self.voucherNo
        self.buttonSend.isEnabled = true
        
        self.buttonPrintVoucher.backgroundColor = UIColor.clear
        self.buttonPrintVoucher.layer.borderWidth = 1
        self.buttonPrintVoucher.layer.cornerRadius = 10
        self.buttonPrintVoucher.layer.borderColor = UIColor.green.cgColor
        /*   var adultCount = 0
         var childCount = 0
         var toodleCount = 0
         var infantCount = 0
         
         var tours : [TourRequestModel] = []
         
         if self.tourList.count > 0 {
         for i in 0...self.touristList.count - 1{
         if self.touristList[i].ageGroup == "ADL" {
         adultCount += 1
         }else if self.touristList[i].ageGroup == "CHD" {
         childCount += 1
         }else if self.touristList[i].ageGroup == "TDL" {
         toodleCount += 1
         }else if self.touristList[i].ageGroup == "INF" {
         infantCount += 1
         }
         }
         }
         
         for i in 0...self.tourList.count - 1 {
         tours.append(TourRequestModel(Adl: adultCount, AdultAmount: self.tourList[i].adultPrice ?? 0.00, Chd: childCount, ChildAmount: self.tourList[i].childPrice ?? 0.0, Inf: infantCount, InfantAmount: self.tourList[i].infantPrice ?? 0.0, PaxTotalAmount: self.totalAmount, PlanId: self.tourList[i].planId ?? 0, PriceType: self.tourList[i].priceType ?? 0, PromotionDiscount: 0.0, Tdl: toodleCount, ToodleAmount: self.tourList[i].toodlePrice ?? 0.0, TotalAmount: self.tourList[i].totalPrice ?? 0.0, TourAmount: self.totalAmount, TourDate: self.tourList[i].tourDate ?? "", TourId: self.tourList[i].tourId ?? 0))
         }
         
         let tourPromotionPostRequestModel = TourPromotionPost(PromotionDiscount: 0, PromotionId: 35, tours: tours)
         
         self.data = "\(tourPromotionPostRequestModel.toJSONString(prettyPrint: true) ?? "")"
         
         let promotionRequestModel = GetSaveMobileSaleRequestModel.init(data: self.data)
         NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetApplyPromotionMobile, requestModel: promotionRequestModel ) { (response: GetApplyPromotionMobileResponseModel) in
         if response.isSuccesful == true {
         print(response)
         let alert = UIAlertController(title: "SUCCSESS", message: response.message ?? "", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         if let topVC = UIApplication.getTopViewController() {
         topVC.present(alert, animated: true, completion: nil)
         }
         self.promotionTourList = response.record?.tours ?? self.promotionTourList
         for i in 0...self.promotionTourList.count - 1 {
         self.discount += self.promotionTourList[i].promotionDiscount ?? 0.0
         }
         }else {
         let alert = UIAlertController(title: "FAILED", message: response.message ?? "", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         if let topVC = UIApplication.getTopViewController() {
         topVC.present(alert, animated: true, completion: nil)
         }
         }
         }
         */
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        self.currentDate = dateFormatter.string(from: date)
        
        self.viewMainView.addCustomContainerView(self)
        self.viewMainView.backgroundColor = UIColor.grayColor
        self.viewTouristView.headerLAbel.text = "Tourist"
        self.viewCurrencyType.headerLAbel.text = "CurrencyType"
        self.viewType.headerLAbel.text = "Type"
        self.viewAmount.headerLAbel.text = "Amount"
        self.viewDiscount.headerLAbel.text = "Discount"
        self.viewNotes.headerLAbel.text = "Notes"
        self.viewPaid.headerLAbel.text = "Paid"
        self.viewBalanced.headerLAbel.text = "Balanced"
        self.viewDicountCalculate.headerLAbel.text = "Discount"
        self.viewTotalAmount.headerLAbel.text = "TotalAmount"
        self.viewCurrencyConvert.headerLAbel.text = "Currency"
        self.viewCurrencyType.mainLabel.text = "EUR"
        self.viewAmount.mainText.isHidden = false
        self.viewAmount.mainLabel.isHidden = true
        self.viewNotes.mainText.isHidden = false
        self.viewNotes.mainLabel.isHidden = true
        self.viewDiscount.mainText.isHidden = false
        self.viewDiscount.mainLabel.isHidden = true
        self.viewPaid.mainLabel.isHidden = true
        self.viewPaid.mainText.isHidden = false
        self.viewBalanced.mainLabel.isHidden = true
        self.viewBalanced.mainText.isHidden = false
        self.viewDicountCalculate.mainLabel.isHidden = true
        self.viewDicountCalculate.mainText.isHidden = false
        self.viewTotalAmount.mainLabel.isHidden = true
        self.viewTotalAmount.mainText.isHidden = false
        self.viewCurrencyConvert.mainLabel.isHidden = false
        self.viewCurrencyConvert.mainText.isHidden = true
        self.viewAmount.imageMainText.isHidden = true
        self.viewNotes.imageMainText.isHidden = true
        self.viewDiscount.imageMainText.isHidden = true
        self.viewPaid.imageMainText.isHidden = true
        self.viewDicountCalculate.imageMainText.isHidden = true
        self.viewTotalAmount.imageMainText.isHidden = true
        self.viewBalanced.imageMainText.isHidden = true
        self.viewCurrencyConvert.imageMainText.isHidden = true
        self.buttonApplyDiscount.layer.cornerRadius = 10
        self.buttonApplyDiscount.backgroundColor = UIColor.greenColor
        self.buttonConvert.layer.cornerRadius = 10
        self.buttonConvert.backgroundColor = UIColor.greenColor
        self.buttonAddPayment.layer.cornerRadius = 10
        self.buttonAddPayment.backgroundColor = UIColor.greenColor
        self.buttonSend.layer.cornerRadius = 10
        self.buttonSend.backgroundColor = UIColor.greenColor
        self.viewDicountCalculate.mainText.text = String(self.discount)
        self.viewTotalAmount.mainText.text = String(self.totalAmount - self.discount)
        self.viewBalanced.mainText.text = String(self.balanceAmount - self.discount)
        self.viewTouristView.mainLabel.text = self.touristList[0].text ?? self.touristList[0].name ?? ""
        self.selectedTouristName = self.touristList[0].text ?? self.touristList[0].name ?? ""
       
        // self.sendedTotalAmount = self.totalAmount
        
        if Connectivity.isConnectedToInternet {
            print("connect")
            self.internetConnection = true
        } else {
            self.internetConnection = false
        }
        if self.internetConnection == true {
            // Exchange Menu
            let exchangeRequestModel = GetExhangeRatesRequestModel.init(date: userDefaultsData.getSaleDate() ?? "") // burda aynı günün değeri alınmalı fakat özgeyle konuş aynı gün değer dönmüyor
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetExhangeRates, method: .get, parameters: exchangeRequestModel.requestPathString()) { ( response : [GetExhangeRatesResponseModel]) in
                if response.count > 0 {
                    self.exchangeList = response
                    userDefaultsData.saveExchangeRates(tour: self.exchangeList)
                    for listofArray in self.exchangeList {
                        self.exchangeListStringType.append(listofArray.sHORTCODE ?? "")
                    }
                    self.exchangeMenu.dataSource = self.exchangeListStringType
                    self.exchangeMenu.dataSource.insert("", at: 0)
                    self.exchangeMenu.backgroundColor = UIColor.grayColor
                    self.exchangeMenu.separatorColor = UIColor.gray
                    self.exchangeMenu.textColor = .white
                    self.exchangeMenu.anchorView = self.viewCurrencyConvert
                    self.exchangeMenu.topOffset = CGPoint(x: 0, y:-(self.exchangeMenu.anchorView?.plainView.bounds.height)!)
                }
            }
        }else{
            self.exchangeList = userDefaultsData.getExchangeRates() ?? self.exchangeList
            for listofArray in self.exchangeList {
                self.exchangeListStringType.append(listofArray.sHORTCODE ?? "")
            }
            self.exchangeMenu.dataSource = self.exchangeListStringType
            self.exchangeMenu.dataSource.insert("", at: 0)
            self.exchangeMenu.backgroundColor = UIColor.grayColor
            self.exchangeMenu.separatorColor = UIColor.gray
            self.exchangeMenu.textColor = .white
            self.exchangeMenu.anchorView = self.viewCurrencyConvert
            self.exchangeMenu.topOffset = CGPoint(x: 0, y:-(self.exchangeMenu.anchorView?.plainView.bounds.height)!)
        }
        
        let gestureTourist = UITapGestureRecognizer(target: self, action: #selector(didTappedExchangeMenu))
        gestureTourist.numberOfTouchesRequired = 1
        self.viewCurrencyConvert.addGestureRecognizer(gestureTourist)
        
        self.exchangeMenu.selectionAction = { index, title in
            self.viewCurrencyConvert.mainLabel.text = title
            self.convertedCurrencyTitle = title
            
            let filtered = self.exchangeList.filter{($0.sHORTCODE?.contains(title) ?? false)}
            self.selectedExchange = filtered
            for listofArray in self.selectedExchange {
                self.valueforDivided = listofArray.eUROCROSS ?? 0.00
            }
        }
        
        // TouristMenu
        for listofArray in self.touristList {
            self.tempTouristMenu.append(listofArray.name ?? "")
        }
        self.touristMenu.dataSource = self.tempTouristMenu
        self.touristMenu.dataSource.insert("", at: 0)
        self.touristMenu.backgroundColor = UIColor.grayColor
        self.touristMenu.separatorColor = UIColor.gray
        self.touristMenu.textColor = .white
        self.touristMenu.anchorView = self.viewTouristView
        self.touristMenu.topOffset = CGPoint(x: 0, y:-(self.touristMenu.anchorView?.plainView.bounds.height)!)
        
        let gestureExchange = UITapGestureRecognizer(target: self, action: #selector(didTappedToristListMenu))
        gestureExchange.numberOfTouchesRequired = 1
        self.viewTouristView.addGestureRecognizer(gestureExchange)
        
        self.touristMenu.selectionAction = { index, title in
            self.viewTouristView.mainLabel.text = title
            self.selectedTouristName = title
            
            /*  let filtered = self.hotelList.filter{($0.text?.contains(title) ?? false)}
             self.filteredHotelList = filtered
             for listofArray in self.filteredHotelList {
             userDefaultsData.saveHotelId(hotelId: listofArray.value ?? 0)
             userDefaultsData.saveHotelArea(hotelAreaId: listofArray.area ?? 0)
             }*/
        }
        
        //CurrencyTypeMenu
        self.typeMenu.dataSource = self.typeList
        self.typeMenu.dataSource.insert("", at: 0)
        self.typeMenu.backgroundColor = UIColor.grayColor
        self.typeMenu.separatorColor = UIColor.gray
        self.typeMenu.textColor = .white
        self.typeMenu.anchorView = self.viewType
        self.typeMenu.topOffset = CGPoint(x: 0, y:-(self.typeMenu.anchorView?.plainView.bounds.height)!)
        
        let gestureType = UITapGestureRecognizer(target: self, action: #selector(didTappedTypeListMenu))
        gestureType.numberOfTouchesRequired = 1
        self.viewType.addGestureRecognizer(gestureType)
        
        self.typeMenu.selectionAction = { index, title in
            self.viewType.mainLabel.text = title
            self.selectedPaymentType = title
            /*  let filtered = self.hotelList.filter{($0.text?.contains(title) ?? false)}
             self.filteredHotelList = filtered
             for listofArray in self.filteredHotelList {
             userDefaultsData.saveHotelId(hotelId: listofArray.value ?? 0)
             userDefaultsData.saveHotelArea(hotelAreaId: listofArray.area ?? 0)
             }*/
        }
        
        if self.internetConnection == true {
            NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetCurrencySelectList, method: .get, parameters: "") { (response : [GetCurrencyResponeModel] ) in
                if response.count > 0 {
                    self.currencyList = response
                    userDefaultsData.saveCurrencyList(tour: self.currencyList)
                    
                    for listofArray in self.currencyList {
                        self.tempCurrencyMenu.append(listofArray.text ?? "")
                    }
                    self.currencyMenu.dataSource = self.tempCurrencyMenu
                    self.currencyMenu.dataSource.insert("", at: 0)
                    self.currencyMenu.backgroundColor = UIColor.grayColor
                    self.currencyMenu.separatorColor = UIColor.gray
                    self.currencyMenu.textColor = .white
                    self.currencyMenu.anchorView = self.viewCurrencyType
                    self.currencyMenu.topOffset = CGPoint(x: 0, y:-(self.currencyMenu.anchorView?.plainView.bounds.height)!)
                }else{
                    print("data has not recived")
                }
            }
        }else {
            self.currencyList = userDefaultsData.getCurrencyList() ?? self.currencyList
            
            for listofArray in self.currencyList {
                self.tempCurrencyMenu.append(listofArray.text ?? "")
            }
            self.currencyMenu.dataSource = self.tempCurrencyMenu
            self.currencyMenu.dataSource.insert("", at: 0)
            self.currencyMenu.backgroundColor = UIColor.grayColor
            self.currencyMenu.separatorColor = UIColor.gray
            self.currencyMenu.textColor = .white
            self.currencyMenu.anchorView = self.viewCurrencyType
            self.currencyMenu.topOffset = CGPoint(x: 0, y:-(self.currencyMenu.anchorView?.plainView.bounds.height)!)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTappedItem))
        gesture.numberOfTouchesRequired = 1
        self.viewCurrencyType.addGestureRecognizer(gesture)
        
        self.currencyMenu.selectionAction = { index, title in
            self.viewCurrencyType.mainLabel.text = title
            self.selectedCurrencyType = title
            if let index = self.currencyList.firstIndex(where: {$0.text == self.selectedCurrencyType} ){
                self.currencyId = self.currencyList[index].value ?? 0
            }
        }
    }
    
    func updateConnectedAccessories(){
        self.connectedAccessories = EAAccessoryManager.shared().connectedAccessories
    }
    
    @objc func didTappedExchangeMenu() {
        self.exchangeMenu.show()
    }
    
    @objc func didTappedItem() {
        self.currencyMenu.show()
    }
    
    @objc func didTappedToristListMenu() {
        self.touristMenu.show()
    }
    
    @objc func didTappedTypeListMenu() {
        self.typeMenu.show()
    }
    
    @IBAction func applyDiscountButtonTapped(_ sender: Any) {
        self.totalAmount = self.savedFirstValue
        self.balanceAmount = self.savedFirstValue
        self.discount = 0.0
        if let discount = Double(self.viewDiscount.mainText.text ?? ""){
            self.discount = discount
           // self.totalDiscount = discount
        }
        self.viewDiscount.mainText.text = self.viewDiscount.mainText.text?.replacingOccurrences(of: ",", with: ".")
        self.viewDicountCalculate.mainText.text = String(self.discount + self.promotionDiscount)
        self.balanceAmount = self.balanceAmount - self.discount
        self.viewBalanced.mainText.text = String(self.balanceAmount)
        self.totalAmount = self.totalAmount - self.discount
        self.viewTotalAmount.mainText.text = String(self.totalAmount)
        self.viewDiscount.mainText.text = "\(0.0)"
    }
    
    @IBAction func addPaymentButtonTapped(_ sender: Any) {
        
        if self.selectedCurrencyType == "" {
            self.selectedCurrencyType = self.viewCurrencyType.mainLabel.text ?? "EUR"
        }
        var roundedPaymentAmount = 0.0
        var roundedPaymentAmountChosenCurrency = 0.0
        self.viewAmount.mainText.text = self.viewAmount.mainText.text?.replacingOccurrences(of: ",", with: ".")
        let filter = self.exchangeList.filter{ $0.sHORTCODE == self.selectedCurrencyType}
        var paymentAmount = Double(self.viewAmount.mainText.text ?? "")
        roundedPaymentAmountChosenCurrency = paymentAmount ?? 0.0
        roundedPaymentAmountChosenCurrency = Double(Darwin.round(100 * roundedPaymentAmountChosenCurrency) / 100 )
        if filter.count > 0 {
            paymentAmount = (paymentAmount ?? 0.0) * (filter[0].eUROCROSS ?? 0.0)
        }
        roundedPaymentAmount = paymentAmount ?? 0.00
        roundedPaymentAmount = Double(Darwin.round(100 * roundedPaymentAmount) / 100 )
        
        if self.selectedTouristName != "" && self.selectedPaymentType != "" && self.viewCurrencyType.mainLabel.text != "" {
            
            /* self.paymentTypeList.append(PaymentType(paymentype: self.selectedPaymentType, paymentAmount: Double(self.viewAmount.mainText.text ?? "") ?? 0.00), currencyTpye : self.selectedCurrencyType)*/
            self.paymentTypeList.append(PaymentType.init(paymentype:self.selectedPaymentType, paymentAmount: roundedPaymentAmountChosenCurrency, currencyTpye:  self.selectedCurrencyType))
            
            self.tableView.reloadData()
            
            
            self.savedTotalAmount += paymentAmount ?? 0.0
            
            var roundedSavedTotalAmountValue = Double(Darwin.round(100 * self.savedTotalAmount) / 100 )
            
            self.viewPaid.mainText.text = String(roundedSavedTotalAmountValue)
            self.viewPaid.mainText.text = self.viewPaid.mainText.text?.replacingOccurrences(of: ",", with: ".")
            
            if roundedSavedTotalAmountValue < 0 {
                roundedSavedTotalAmountValue = -roundedSavedTotalAmountValue
            }
            self.balanceAmount = self.totalAmount - roundedSavedTotalAmountValue
            //self.totalAmount = self.balanceAmount
            let roundedBalanceValue = Double(Darwin.round(100 * self.balanceAmount) / 100 )
            if roundedBalanceValue <= 0.5 && roundedBalanceValue >= -0.5 {
                self.balanceAmount = 0.0
                
            }
            self.viewBalanced.mainText.text = String(roundedBalanceValue)
            
            if self.currencyId == 0 {
                if let index = self.currencyList.firstIndex(where: {$0.text == self.viewCurrencyType.mainLabel.text} ){
                        self.currencyId = self.currencyList[index].value ?? 0
                    }
            }
            self.viewTotalAmount.mainText.text = self.viewTotalAmount.mainText.text?.replacingOccurrences(of: ",", with: ".")
            
            self.payments.append(Payment(ByDesc: self.selectedTouristName , ById:"0", ConvertedCurrency: self.convertedCurrencyTitle, ConvertedPaymentAmount:  Int(self.totalAmount), Currency: self.selectedCurrencyType, CurrencyId: String(self.currencyId), PaymentAmount: Double(self.viewAmount.mainText.text ?? "") ?? 0.00, PaymentType: self.selectedPaymentType, TargetAmount:0, TypeId: self.selectedPaymentType))
            
        }else {
            let alert = UIAlertController.init(title: "Error", message: "Please Insert CurrencyType, Pax and PaymentType", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func printButtonTapped(_ sender: Any) {
       
        if self.printList.count > 0 && self.connectedAccessories.count > 0{
            self.connectEaAccessory(eaAccessory: self.connectedAccessories[0])
        }else{
            let alert = UIAlertController.init(title: "Warning", message: "Please send data and Connect Zebra device", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
        }
     if let topVC = UIApplication.getTopViewController() {
            topVC.otiPushViewController(viewController: MainPAgeViewController())
        }
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        self.convertedCurrency = self.balanceAmount / self.valueforDivided
        let roundedValue = Double(Darwin.round(100 * self.convertedCurrency) / 100 )
        let alert = UIAlertController.init(title: "Message", message: "Converted balance  for \(self.balanceAmount) EUR is \(roundedValue)\(self.convertedCurrencyTitle)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let topVC = UIApplication.getTopViewController() {
            topVC.present(alert, animated: true, completion: nil)
        }
        //  self.balanceAmount = self.convertedCurrency
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        if self.balanceAmount == 0.0{
            if Connectivity.isConnectedToInternet == true {
                self.hotelId = userDefaultsData.getHotelId()
                self.marketId = userDefaultsData.getMarketId()
            }else{
                self.hotelId = userDefaultsData.getOfflineHotelId()
                self.marketId = userDefaultsData.getOfflineMarketId()
                if self.tourList.count > 0 {
                    for _ in 0...self.tourList.count - 1 {
                        self.voucherNo.append("123")
                    }
                }
            }
            
            if let index = self.currencyList.firstIndex(where: {$0.text == "EUR"} ){
                    self.currencyId = self.currencyList[index].value ?? 0
                }
            
            let multisale = Multisale.init(CouponAmount:0, CouponId:0, CurrencyId: self.currencyId, GuideId: userDefaultsData.getGuideId(), HotelId: self.hotelId, ID:0, IsMobile:1, IsOfficeSale: false, ManualDiscount: self.discount, MarketId: self.marketId, Note: "", PaidAmount: self.savedTotalAmount, PromotionId: self.promotionId, SaleDate: self.currentDate , TotalAmount: self.sendedTotalAmount)
            var paxTourList : [PaxTourList] = []
            var paxes : [Paxes] = []
            var tourListIndata : [TourList] = []
            var adultCount = 0
            var childCount = 0
            var toodleCount = 0
            var infantCount = 0
            self.tourTotalAmount = 0.0
         
            var hotelName = ""
            var room = ""
            var paxName = ""
            var resNo = ""
            var operatorName = ""
            var tourExtrasString = ""
            var tourTransfersString = ""
            
            var voucherLabelSize = ""
    
            var discountList : [Double] = []
            var perTourPriceList : [Double] = []

            paxes = userDefaultsData.getTouristDetailInfoList() ?? paxes
            if paxes.count > 0 {
                for i in 0...paxes.count - 1 {
                    self.paxList.append(paxes[i].pAX_AGEGROUP ?? "")
                    
                    if self.selectedTouristName.haveSameCharecterSet(paxes[i].pAX_NAME) == true {
                        hotelName = paxes[i].hotelname ?? ""
                        room = paxes[i].pAX_ROOM ?? ""
                        paxName = paxes[i].pAX_NAME ?? ""
                        resNo = paxes[i].pAX_RESNO ?? ""
                        operatorName = paxes[i].pAX_OPRNAME ?? ""
                    }
                }
            }
    
            if self.extras.count > 0 {
                for i in 0...self.extras.count - 1 {
                    self.extras[i].TotalPrice = self.extrasTotalPrice
                    self.extras[i].totalAmount = self.extrasTotalPrice
                }
            }
            
            if self.transfers.count > 0 {
                for i in 0...self.transfers.count - 1 {
                    self.transfers[i].TotalPrice = self.transfersTotalPrice
                    self.transfers[i].totalAmount = self.transfersTotalPrice
                }
            }
            
            if self.tourList.count > 0 && self.touristList.count > 0 && self.voucherNo.count > 0{
                for i in 0...self.tourList.count - 1{
                    for index in 0...self.touristList.count - 1 {
                        let paxesTour = PaxTourList(AgeGroup:self.touristList[index].ageGroup ?? "", Gender:self.touristList[index].gender ?? "",ID:String(self.touristList[index].ID ?? 0), PlanId:self.tourList[i].planId ?? 0)
                        paxTourList.append(paxesTour)
                    }
                }
                for i in 0...self.touristList.count - 1{
                    if self.touristList[i].ageGroup == "ADL" {
                        adultCount += 1
                    }else if self.touristList[i].ageGroup == "CHD" {
                        childCount += 1
                    }else if self.touristList[i].ageGroup == "TDL" {
                        toodleCount += 1
                    }else if self.touristList[i].ageGroup == "INF" {
                        infantCount += 1
                    }
                }
                
                
                for i in 0...self.tourList.count - 1 {
                    self.tourExtras = []
                    self.tourTransfers = []
                    self.totalPricePerTour = 0.0
                    tourExtrasString = ""
                    self.addedNumber = 1000
                    
                    if self.extras.count > 0 {
                        for index in 0...self.extras.count - 1 {
                            if self.extras[index].tourId == self.tourList[i].tourId && self.extras[index].tourDate == self.tourList[i].tourDate && self.extras[index].tourName == self.tourList[i].tourName {
                                self.tourExtras.append(extras[index])
                            }
                        }
                    }
                    
                    if self.transfers.count > 0 {
                        for index in 0...self.transfers.count - 1 {
                            if self.transfers[index].tourId == self.tourList[i].tourId && self.transfers[index].tourDate == self.tourList[i].tourDate && self.transfers[index].tourName == self.tourList[i].tourName {
                                self.tourTransfers.append(transfers[index])
                            }
                        }
                    }
                    
                    if self.tourList[i].priceType == 35 {
                        for index in 0...self.touristList.count - 1 {
                            switch self.touristList[index].ageGroup {
                            case "INF":
                                self.totalPricePerTour += self.tourList[i].infantPrice ?? 0.00
                            case "TDL":
                                self.totalPricePerTour += self.tourList[i].toodlePrice ?? 0.00
                            case "CHD":
                                self.totalPricePerTour += self.tourList[i].childPrice ?? 0.00
                            default:
                                self.totalPricePerTour += self.tourList[i].adultPrice ?? 0.00
                            }
                        }
                    }
                    
                    //Flat Price calculation
                    else if self.tourList[i].priceType == 36{
                        self.totalPricePerTour += self.tourList[i].flatPrice ?? 0.00
                    }
                    
                    //Min Price
                    else if self.tourList[i].priceType == 37{
                        self.minPerson = Int(self.tourList[i].minPax ?? 0.00)
                        if self.minPerson > 0 {
                            for index in 0...self.touristList.count - 1{
                                if  self.touristList[index].ageGroup == "ADL" {
                                    self.minPriceTotal = self.tourList[i].minPrice ?? 0.00
                                    self.minPerson -= 1
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "CHD" {
                                    self.minPriceTotal = self.tourList[i].minPrice ?? 0.00
                                    self.minPerson -= 1
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "TDL" {
                                    self.minPriceTotal = self.tourList[i].minPrice ?? 0.00
                                    self.minPerson -= 1
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "INF" {
                                    self.minPriceTotal = self.tourList[i].minPrice ?? 0.00
                                    self.minPerson -= 1
                                }
                            }
                        }else {
                            for index in 0...self.touristList.count - 1{
                                if  self.touristList[index].ageGroup == "ADL" {
                                    self.totalPricePerTour += self.tourList[i].adultPrice  ?? 0.00
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "CHD" {
                                    self.totalPricePerTour += tourList[i].childPrice ?? 0.00
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "TDL" {
                                    self.totalPricePerTour += tourList[i].toodlePrice ?? 0.00
                                }else if self.minPerson > 0 && self.touristList[index].ageGroup == "INF" {
                                    self.totalPricePerTour += tourList[i].infantPrice ?? 0.00
                                }
                            }
                        }
                        self.totalPricePerTour += self.minPriceTotal
                    }
                    // Önemli, özgeye sor tour date offline tourdan geldiği için tarih geride kalıyor ve offline satışta sale date tourdate ten ileri olamaz hatası veriyor nasıl çözeceğiz
                   // self.totalPricePerTour += userDefaultsData.getExtrasandTransfersTotalPrice()
                    self.tourTotalAmount = self.totalPricePerTour + userDefaultsData.getExtrasandTransfersTotalPrice()
                   // netTotal += self.tourTotalAmount
                   // discount = self.discount
                   // total = netTotal - discount
                    self.pickUpTimeProceedView = tourList[i].pickUpTime ?? ""
                 
                    tourListIndata.append(TourList(id: Int(self.tourList[i].id ?? "") ?? 0, AdultAmount:(self.tourList[i].adultPrice ?? 0.0)*Double(adultCount), AdultCount:adultCount, AdultPrice:self.tourList[i].adultPrice ?? 0.00,ChildAmount:(self.tourList[i].childPrice ?? 0.0)*Double(childCount), ChildCount:childCount, ChildPrice:self.tourList[i].childPrice ?? 0.00, InfantAmount: (self.tourList[i].infantPrice ?? 0.0)*Double(infantCount), InfantCount:infantCount, InfantPrice: self.tourList[i].infantPrice ?? 0.00, ToodleAmount:  (self.tourList[i].toodlePrice ?? 0.0)*Double(toodleCount), ToodleCount:toodleCount, ToodlePrice: self.tourList[i].toodlePrice ?? 0.00, MatchId: self.tourList[i].matchId ?? 0, MarketId: self.tourList[i].marketId ?? 0, PromotionId: self.tourList[i].promotionId ?? 0, PoolType: self.tourList[i].poolType ?? 0, PriceId: self.tourList[i].priceId ?? 0, PlanId: self.tourList[i].planId ?? 0, TourType: self.tourList[i].tourType ?? 0, TourName: self.tourList[i].tourName ?? "", TourId:  self.tourList[i].tourId ?? 0, Currency: self.tourList[i].currency ?? 0 , CurrencyDesc: self.tourList[i].currencyDesc ?? "", TourDateStr:self.tourList[i].tourDateStr ?? "", TourDate: self.tourList[i].tourDate ?? "", AllotmenStatus: self.tourList[i].allotmenStatus ?? 0, RemainingAllotment: self.tourList[i].remainingAllotment ?? 0, PriceType: self.tourList[i].priceType ?? 0, MinPax:self.tourList[i].minPax ?? 0.0, TotalPrice: self.tourTotalAmount, FlatPrice: self.tourList[i].flatPrice ?? 0.0, MinPrice: self.tourList[i].minPrice ?? 0.0, InfantAge1: self.tourList[i].infantAge1 ?? 0.0, InfantAge2: self.tourList[i].infantAge2 ?? 0.0, ToodleAge1: self.tourList[i].toodleAge1 ?? 0.0, ToodleAge2: self.tourList[i].toodleAge2 ?? 0.0, ChildAge1: self.tourList[i].childAge1 ?? 0.0, ChildAge2: self.tourList[i].childAge2 ?? 0.0, PickUpTime:  self.pickUpTimeProceedView, DetractAdult: self.tourList[i].detractAdult ?? false, DetractChild: self.tourList[i].detractChild ?? false, DetractKid: self.tourList[i].detractKid ?? false, DetractInfant: self.tourList[i].detractInfant ?? false, AskSell: self.tourList[i].askSell ?? false, MeetingPointId: self.tourList[i].meetingPointId ?? 0, Paref: String(self.tourList[i].paref ?? 0) ,TourCode: self.tourList[i].tourCode ?? "", ID: self.tourList[i].ID ?? 0, CREATEDDATE: self.tourList[i].cREATEDDATE ?? "", RefundCondition:"", TicketCount: 0, TourAmount: self.totalPricePerTour, VoucherNo: self.voucherNo[i], ExtraTourist: self.tourExtras, TransferTourist:self.tourTransfers))
                    self.selectedTouristName.append(tourList[i].tourName ?? "")
                    
                    // printList düzenlemre
                   var isTransfersHave = ""
                    
                    if self.tourTransfers.count > 0 {
                        isTransfersHave = "YES"
                    }else{
                        isTransfersHave = "NO"
                    }
                    
                   
                    
                    if self.tourExtras.count > 0 {
                        self.addedNumber += 80
                        for i in 0...self.tourExtras.count - 1{
                            let extrasLabelType = "^FO10,\(self.addedNumber)^GB540,100,0^FS^FO 20,\(self.addedNumber + 5) ^A 0, 20 ^FDExtras^FS^FO 250, \(self.addedNumber + 5)^A 0, 20 ^FDExtra Name^FS^FO 20, \(self.addedNumber + 70)) ^A 0, 20 ^FD 1  ADL  2  CHD  0  TDL  0  INF  30.0  EUR^FS"
                            tourExtrasString.append(extrasLabelType)
                            self.addedNumber += (i * 120)
                        }
                        
                    }else{
                        self.addedNumber += 120
                    }
                    
                    if self.tourTransfers.count > 0 {
                        self.addedNumber += 80
                        for i in 0...self.tourTransfers.count - 1{
                            let transfersLabelType = "^FO10,\(self.addedNumber)^GB540,100,0^FS^FO 20,\(self.addedNumber + 5) ^A 0, 20 ^FDExtras^FS^FO 250, \(self.addedNumber + 5)^A 0, 20 ^FDExtra Name^FS^FO 20, \(self.addedNumber + 70)) ^A 0, 20 ^FD 1  ADL  2  CHD  0  TDL  0  INF  30.0  EUR^FS"
                            tourExtrasString.append(transfersLabelType)
                            self.addedNumber += (i * 120)
                        }
                        
                    }else{
                        self.addedNumber += 120
                    }
                    
                    voucherLabelSize = "^FO20,\(self.addedNumber)^A 0, 20 ^FDYour Info Guide Number:^FS^FO20,\(self.addedNumber + 22)^A 0, 20 ^FD+9005418281989^FS^FO20,\(self.addedNumber + 50)^BY2^BCN,120,Y,N,N^FD\(self.voucherNo[i])^FS^CF0,40^FO20,\(self.addedNumber + 200)^FDNotes^FS"
                    self.addedNumber += 300
                    perTourPriceList.append(self.totalPricePerTour)
                    self.printList.append(SendDataPrint(tourName: self.tourList[i].tourName, paxInfo: "ADL :\(adultCount),CHD: \(childCount), TDL:\(toodleCount), INF: \(infantCount)", voucher: voucherLabelSize, tourDate: self.tourList[i].tourDateStr, transTourist: isTransfersHave, hotelName: hotelName, date: self.currentDate, room: room, paxName: paxName, operatorName: operatorName, resNo: resNo, total:"\(0.0)EUR" , discount: "\(0.0)EUR", netTotal: "\(0.0)EUR", cash: "", card: "", guideInfoNumber: "", pickUpTime: self.tourList[i].pickUpTime, extras: tourExtrasString, transfers: <#T##String?#>))
                }
                // printList düzenlemre
                var perPersonTotalPrice = 0.0
                
                for i in 0...perTourPriceList.count - 1 {
                    perPersonTotalPrice += perTourPriceList[i]
                }
                
                for i in 0...perTourPriceList.count - 1 {
                    var perDiscount = 0.0
                    perDiscount = self.discount * (perTourPriceList[i]/perPersonTotalPrice)
                    discountList.append(perDiscount)
                }
                for i in 0...self.printList.count - 1{
                    self.printList[i].total = String(perTourPriceList[i] - discountList[i])
                    self.printList[i].discount = String(discountList[i])
                }
                
            }
            
        
            print(self.data)
            
            if Connectivity.isConnectedToInternet {
                print("connect")
                
                let tourSalePost = TourSalePost(Multisale:multisale, PaxTourLists:paxTourList, Payments: self.payments, Paxes:paxes, IsOffline:"0", AllowDublicatePax:"0",TourList:tourListIndata )
                
                self.data = "\(tourSalePost.toJSONString() ?? "")"
                
                let toursaleRequestModel = GetSaveMobileSaleRequestModel.init(data: self.data)
                NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetSaveMobileSale, requestModel: toursaleRequestModel ) { (response: GetSaveMobileSaleResponseModel) in
                    if response.IsSuccesful == true {
                        print(response)
                        let alert = UIAlertController(title: "SUCCSESS", message: "\(response.Message ?? "")\(self.voucherNo)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        if let topVC = UIApplication.getTopViewController() {
                            topVC.present(alert, animated: true, completion: nil)
                        }
                        userDefaultsData.saveMaxVoucher(voucher: [])
                        userDefaultsData.saveTouristDetailInfoList(tour: [])
                        userDefaultsData.saveExtrasList(tour: [])
                        userDefaultsData.saveTransfersList(tour: [])
                        userDefaultsData.saveExtrasandTransfersTotalPrice(totalPrice: 0.0)
                        userDefaultsData.saveTourList(tour: [])
                        self.buttonSend.isEnabled = false
                    }else {
                        let alert = UIAlertController(title: "FAILED", message: response.Message ?? "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        if let topVC = UIApplication.getTopViewController() {
                            topVC.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                
            } else {
                let tourSalePost = TourSalePost(Multisale:multisale, PaxTourLists:paxTourList, Payments: self.payments, Paxes:paxes, IsOffline:"1", AllowDublicatePax:"0",TourList:tourListIndata )
                self.offlineDataList.append(tourSalePost)
                userDefaultsData.saveTourSalePost(tour: self.offlineDataList)
                let alert = UIAlertController.init(title: "Message", message: "Data has been saved", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                if let topVC = UIApplication.getTopViewController() {
                    topVC.present(alert, animated: true, completion: nil)
                }
            }
        }else {
            let alert = UIAlertController.init(title: "WARNING", message: "Balance amount is not 0.0. Please be sure balance amount is 0.0", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
            return
        }
        self.buttonSend.isEnabled = false
    }
}

extension ExcProceedCustomView : UITableViewDelegate, UITableViewDataSource {
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
            let chosenCrossType = self.paymentTypeList[indexPath.row].currencyTpye
            let baseCrossType = "EUR"
            var baseCrossValue = 1.0
            var roundedSavedValue = 0.0
            
            for i in 0...self.exchangeList.count - 1 {
                if chosenCrossType == exchangeList[i].sHORTCODE {
                    if baseCrossType == "EUR" {
                        baseCrossValue = exchangeList[i].eUROCROSS ?? 1.0
                    }else if baseCrossType == "USD" {
                        baseCrossValue = exchangeList[i].uSDCROSS ?? 1.0
                    }else if baseCrossType == "RUB" {
                        baseCrossValue = exchangeList[i].rUBCROSS ?? 1.0
                    }else {
                        baseCrossValue = exchangeList[i].eUROCROSS ?? 1.0
                    }
                }
            }
            
            self.deletedAmount = self.paymentTypeList[indexPath.row].paymentAmount ?? 0.00
            self.deletedAmount = self.deletedAmount * baseCrossValue
            let roundedDeletedValue = Double(Darwin.round(100 * self.deletedAmount) / 100 )
            self.savedTotalAmount -= roundedDeletedValue
            roundedSavedValue = Double(Darwin.round(100 * self.savedTotalAmount) / 100 )
            if roundedSavedValue == -0.0 {
                roundedSavedValue = 0.0
            }
            self.viewPaid.mainText.text = String(roundedSavedValue)
            self.viewPaid.mainText.text = self.viewPaid.mainText.text?.replacingOccurrences(of: ",", with: ".")
            self.balanceAmount = self.totalAmount - roundedSavedValue
            self.viewBalanced.mainText.text = String(self.balanceAmount)
            if let index = self.payments.firstIndex(where: {$0.PaymentAmount ==  self.paymentTypeList[indexPath.row].paymentAmount ?? 0.00} ){
                self.payments.remove(at: index)
            }
            
            self.paymentTypeList.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            print(self.paymentTypeList)
        }
    }
}

extension ExcProceedCustomView: EAAccessoryManagerConnectionStatusDelegate {
    func changeLabelStatus() {
       /*if printManager.isConnected {
            printerConnectionStatus.text = "Connected"
        } else {
            printerConnectionStatus.text = "Not Connected"
        }*/
    }
}

extension String {
    func haveSameCharecterSet(_ str : String) -> Bool {
            return self.sorted() == str.sorted()
    }
}

extension ExcProceedCustomView{
 
    private func connectEaAccessory(eaAccessory : EAAccessory){
        if eaAccessory.modelNumber.hasPrefix("iMZ320"){

            //Note: Zebra SDK requires communication in background thread
            DispatchQueue.global(qos: .background).async {
                //Zebra SDK specific code -- Start
                var connection :  NSObjectProtocol & ZebraPrinterConnection //define variable that confronts to NSObjectProtocol & ZebraPrinterConnection
                connection = MfiBtPrinterConnection.init(serialNumber: eaAccessory.serialNumber)! //Call Zebra's SDK to init a BT Connection
                
                if connection.open(){
                    print ("Printer Connected")
                    do{
                        var printer : ZebraPrinter & NSObjectProtocol //define variable that confronts to NSObjectProtocol & ZebraPrinter
                        printer = try ZebraPrinterFactory.getInstance(connection)
                        
                        let printerLanguage = printer.getControlLanguage()
                        print ("Connected Printer uses the following language: \(printerLanguage)")
                        if printerLanguage == PRINTER_LANGUAGE_ZPL{
                            self.configureLabelSize(connection: connection)
                            self.sendZebraTestingString(connection: connection)
                        } else{
                            print ("Our program only support printer using ZPL language")
                        }
                        
                    }catch{
                        print ("Error occured: \(error.localizedDescription)")
                    }
                    
                }else{
                    print ("Failed to Connect to ZQ620 Printer")
                    let alert = UIAlertController.init(title: "Warning", message: "Please be sure connected to device", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    if let topVC = UIApplication.getTopViewController() {
                        topVC.present(alert, animated: true, completion: nil)
                    }
                }
                //Zebra SDK specific code -- End
            }
        }
    }
    
    private func sendStrToPrinter(_ strToSend: String, connection: ZebraPrinterConnection){
        let data = strToSend.data(using: .utf8)!
        var error : NSErrorPointer = nil
        connection.write(data, error: error)
    }
    private func configureLabelSize(connection: ZebraPrinterConnection){
        let strToSend = """
        ^XA
        ^PW408
        ^LT16
        ^XZ
        """
       // sendStrToPrinter(strToSend, connection: connection)
    }
    private func sendZebraTestingString(connection: ZebraPrinterConnection){
        var hotelNameFirstColumn = ""
        var hotelNameScondColumn = ""
        
        //strToSend it written in ZPL language
        let testingStr = "^XA^FO17,16^GB379,371,8^FS^FT65,255^A0N,135,134^FDTEST^FS^XZ"
      // sendStrToPrinter(testingStr, connection: connection)
        
        //The first
       /* let testingLabelStr = ""*/
        
        if self.printList.count > 0 {
            for i in 0...self.printList.count - 1 {
                if self.printList[i].hotelName?.count ?? 0 > 20 {
                    hotelNameFirstColumn = self.printList[i].hotelName?[1..<20] ?? ""
                    hotelNameScondColumn = self.printList[i].hotelName?.substring(fromIndex: 20) ?? ""
                }else{
                    hotelNameFirstColumn = self.printList[i].hotelName ?? ""
                }
                self.printString = "^XA^PON^LL\(self.addedNumber + 200)^XGMyFormat^FS^CF0,25^FO280,30^FDVoucher No^FS^CF0,25^FO280,60^FD\(self.printList[i].voucher ?? "")^FS^CF0,25^FO280,90^FDPrint Date : ^FS^CF0,25^FO400,90^FD\(self.printList[i].date ?? "")^FS^FO10,150^GB200,100,0^FS^CF0,25^FO20,170^FDTour^FS^FO210,150^GB340,100,0^FS^FO 220, 170 ^A 0, 20 ^FD\(self.printList[i].tourName ?? "")^FS^FO10,250^GB200,60,0^FS^CF0,25^FO20,270^FDPax Info^FS^FO210,250^GB340,60,0^FS^FO220, 270 ^A 0, 20 ^FD\(self.printList[i].paxInfo ?? "")^FS^FO10,310^GB200,60,0^FS^CF0,25^FO20,330^FDDate^FS^FO210,310^GB340,60,0^FS^FO 220, 330 ^A 0, 20 ^FD\(self.printList[i].tourDate ?? "")^FS^FO10,370^GB200,60,0^FS^CF0,25^FO20,390^FDConcept^FS^FO210,370^GB340,60,0^FS^FO 220, 390 ^A 0, 20 ^FDStandart^FS^FO10,430^GB200,60,0^FS^CF0,25^FO20,450^FDTransfer^FS^FO210,430^GB340,60,0^FS^FO 220, 450 ^A 0, 20 ^FD\(self.printList[i].transTourist ?? "")^FS^FO10,490^GB200,100,0^FS^CF0,25^FO20,510^FDHotel^FS^FO210,490^GB340,100,0^FS^FO 220, 510 ^A 0, 20 ^FD\(hotelNameFirstColumn)^FS^FO 220, 550 ^A 0, 20 ^FD\(hotelNameScondColumn)^FS^FO10,590^GB200,60,0^FS^CF0,25^FO20,610^FDRoom^FS^FO210,590^GB340,60,0^FS^FO 220, 610 ^A 0, 20 ^FD\(self.printList[i].room ?? "")^FS^FO10,650^GB200,60,0^FS^CF0,25^FO20,670^FDPick Up^FS^FO210,650^GB340,60,0^FS^FO 220, 670 ^A 0, 20 ^FD\(self.printList[i].pickUpTime ?? "")^FS^FO10,710^GB200,60,0^FS^CF0,25^FO20,730^FDPick Up Point^FS^FO210,710^GB340,60,0^FS^FO 220, 730 ^A 0, 20 ^FD-^FS^FO10,770^GB200,60,0^FS^CF0,25^FO20,790^FDName^FS^FO210,770^GB340,60,0^FS^FO 220, 790 ^A 0, 20 ^FD\(self.printList[i].paxName ?? "")^FS^FO10,830^GB200,60,0^FS^CF0,25^FO20,850^FDOperator^FS^FO210,830^GB340,60,0^FS^FO 220, 850 ^A 0, 20 ^FD\(self.printList[i].operatorName ?? "")^FS^FO10,890^GB200,60,0^FS^CF0,25^FO20,910^FDRes No^FS^FO210,890^GB340,60,0^FS^FO 220, 910 ^A 0, 20 ^FD\(self.printList[i].resNo ?? "")^FS^CF0,25^FO20,980^FDNet Total^FS^CF0,25^FO150,980^FD\(self.printList[i].total ?? "")^FS^CF0,25^FO20,1020^FDDiscount^FS^CF0,25^FO150,1020^FD\(self.printList[i].discount ?? "")^FS\(self.printList[i].extras ?? "")\(self.printList[i].voucher ?? "")^XZ"
              //  self.printListStringType.append(printString)
                sendStrToPrinter(self.printString, connection: connection)
            }
        }
    }
}


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

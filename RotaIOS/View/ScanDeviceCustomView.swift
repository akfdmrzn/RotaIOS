//
//  ScanDeviceCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 5.04.2022.
//

import Foundation
import UIKit


class ScanDeviceCustomView : UIView, EAAccessoryManagerConnectionStatusDelegate {
    func changeLabelStatus() {
        
    }
    
    @IBOutlet var viewMainView: UIView!
    @IBOutlet weak var buttonScan: UIButton!
    @IBOutlet weak var buttonReconnect: UIButton!
    @IBOutlet weak var buttonPrint: UIButton!
    @IBOutlet weak var buttonNewExcSale: UIButton!
    @IBOutlet weak var buttonNewInd_Shop: UIButton!
    var excProceedCustomView : ExcProceedCustomView?
    var connectedDeviceName = ""
    var connectedAccessories : [EAAccessory] = []
    var printList : [SendDataPrint] = []
    var printManager = PrintManager.sharedInstance
    var printString = ""
    var addedNumber = 1000
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: ScanDeviceCustomView.self), owner: self, options: nil)
        self.viewMainView.addCustomContainerView(self)
        
        printManager.connectionDelegate = self
        self.updateConnectedAccessories()
        
        self.buttonScan.layer.cornerRadius = 10
        self.buttonPrint.layer.cornerRadius = 10
        self.buttonReconnect.layer.cornerRadius = 10
        self.buttonNewExcSale.layer.cornerRadius = 10
        self.buttonNewInd_Shop.layer.cornerRadius = 10
        
        self.buttonScan.backgroundColor = UIColor.greenColor
        self.buttonPrint.backgroundColor = UIColor.greenColor
        self.buttonReconnect.backgroundColor = UIColor.greenColor
        self.buttonNewExcSale.backgroundColor = UIColor.greenColor
        self.buttonNewInd_Shop.backgroundColor = UIColor.greenColor
        
        self.printList = userDefaultsData.getPrintList() ?? self.printList
        self.addedNumber = printList.last?.addedNumber ?? 1000
    }
    
    func getNotConnectionDevices() {
       
        EAAccessoryManager.shared().showBluetoothAccessoryPicker(withNameFilter: nil) { success in
            if self.connectedAccessories.count > 0 {
                self.updateConnectedAccessories()
            }else{
              return
            }
            
                }
    }
    
    func updateConnectedAccessories(){
        self.connectedAccessories = EAAccessoryManager.shared().connectedAccessories
        
        if self.connectedAccessories.count > 0 {
            self.connectedDeviceName = self.connectedAccessories[0].name
            if let topVC = UIApplication.getTopViewController() {
                Toast("Connected to \(self.connectedDeviceName)").show(topVC)
                
            }
        }
    }
    
    @IBAction func scanButtonTapped(_ sender: Any) {
        self.getNotConnectionDevices()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func reconnectButtonTapped(_ sender: Any) {
        self.updateConnectedAccessories()
      
        // get devices diye func yaz kodu bu func içine yaz func bool dönecek
    }
    
    @IBAction func printButtonTapped(_ sender: Any) {
        
        if self.printList.count > 0 && self.connectedAccessories.count > 0{
            self.connectEaAccessory(eaAccessory: self.connectedAccessories[0])
            
        }else{
            let alert = UIAlertController.init(title: "Warning", message: "Please be sure connecting Zebra device", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
        }
    
    }
    
    @IBAction func newExcSaleButtonTapped(_ sender: Any) {
        if let topVC = UIApplication.getTopViewController() {
            topVC.otiPushViewController(viewController: ExcursionViewController())
            
        }
    }
    
    @IBAction func newIndShopSaleTapped(_ sender: Any) {
        if let topVC = UIApplication.getTopViewController() {
            topVC.otiPushViewController(viewController: ShopAppointmentViewController())
            
        }
    }
}

extension ScanDeviceCustomView {
    
    func connectEaAccessory(eaAccessory : EAAccessory){
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
       
       // iade kuralleri diller
       let odeonLabel = "^FO10,20^GFA,2425,2425,25,,:::00hKFE,007hJFE,:::::::::007gUF80JF3FFE,007LF81JFC3OFE1KF83IF807FFE0FFE,007LF01JF8007MF803IFE01IF803FFC07FE,007KFCI01FEJ03KFCI0IFCI03FC01FFC07FE,007KF8J07L07JF8I0IFK0FE01FFE03FE,007KFK03L01IFEJ07FEK07E00FFE03FE,007JFCS0IFCJ07FCK03F00IF03FE,007JF8S07FF8J07F8K01F807FF03FE,007JF8007EK0FF803FF007E07FI07E01F807FF03FE,007JF001FF80080FFE03FE03FFCFE001FF00F803FF03FE,007IFE001FF80780FFE01FC07JFC003FF80F001FF03FE,007IFC003FFC0781IF01F80KFC007FF80F001FF83FE,007IF8087FFC0781IF00F01KF8107FFC0FI0FF83FE,007IF81CIFE0781IF00F03KF018IFC0E0807F83FE,007IF01JFE0781IF00E07KF03JFC0E0C07F83FE,007IF03JFE0781IF80C07FFC7E03JFC0E0C03F83FE,007IF03JFE0781IF80C0F8003E07JFC0E0E03F83FE,007FFE03JFE0781IF808K03E07JFC0E1E01F83FE,007FFE07JFE0781IF808K03C07JFC0C1F00F83FE,007FFC07JFC0781IF01L03C0KFC0C1F80F83FE,007FFC07JFC0F81IF01L03C0KF81C1F80783FE,007FFC07JFC0F81IF01L07C0KF81C1FC0787FE,007FFC07JF81F81IF0203KFC0KF8181FE0387FE,007FFC07JF81F81FFE0203KF80KF0383FE0187FE,007FFC07JF03F81FFE0603KF80JFE0783FF0187FE,007FFC07IFE03F81FFC0603KF80JFE0703FF8087FE,007FFC07IFE07F81FF80E03KF807IFC0F07FF8007FE,007FFC03IF80FF81FF01E03JFC007IF81E07FFC007FE,007FFC01FFE01FF81F803E01IFEI03FFE01E07FFE00FFE,007FFE007F803F801E007E007FFK0FF807E07FFE00FFE,007FFEL07F8K0FFT0FC0JF00FFE,007IFL0FF8J03FFM06K01FC0JF80FFE,007IF8J03FF8J07FF8K01FK03F00JFC1FFE,007IFCJ0IF8I03IFCK0FF8J0FE00JFE3FFE,007IFEI03IFCI0JFEJ07FFEI03FE01NFE,007JF800JFE007KF8003JF001FFE01NFE,007gSFE03NFE,007gTF03NFE,007gTFC7NFE,007hJFE,007gPFDSFE,007FFEgY07FE,007FFCgY07FE,:007FFEgY07FE,007hJFE,::::007RFE3gLFC7FFE,007FFC001LF00MF8707KFC00LFE00FFE,007FFC001KFE007LF0707KF800LFC00FFE,007FFC001KFE003LF0707KF8007KFC007FE,007FFE003KFC083LF0707KF8007KF8107FE,007IFC1LFC183LF0707KF8307KF8187FE,007IFC1LFC183LF0707KF8307KF81CFFE,007IFC1LFC1C1LF0707KF8107KFC07FFE,007IFC1LFC1C1LF0707KF8007KFC01FFE,007IFC1LFC1C1LF0707KF800LFE00FFE,007IFC1LFC1C1LF0707KF8007LF807FE,007IFC1LFC181LF0707KF8007LFE07FE,007IFC1LFC183LF0707KF8307KF8303FE,007IFC1LFC183LF0307KF8387KF8303FE,007IFC1LFC083LF8007KF8387KF8007FE,007IFC1LFE003LF800LF8387KF8007FE,007IFC1MF007LFC00LF8383KFC00FFE,007IFE1MF80MFE03LFC387KFE01FFE,007hJFE,::::::00hKFE,007hJFC,,::::^FS"
  
       
       if self.printList.count > 0 {
           for i in 0...self.printList.count - 1 {
               if self.printList[i].hotelName?.count ?? 0 > 20 {
                   hotelNameFirstColumn = self.printList[i].hotelName?[0..<23] ?? ""
                   hotelNameScondColumn = self.printList[i].hotelName?.substring(fromIndex: 20) ?? ""
               }else{
                   hotelNameFirstColumn = self.printList[i].hotelName ?? ""
               }
               
               if  ConfigManager.shared.getAppType() == .RotaTR {
                   
                   self.printString = "^XA^PON^LL\(self.addedNumber + 200 + 1200)^XGMyFormat^FS^CF0,25^FO280,30^FDVoucher No^FS^CF0,25^FO280,60^FD\(self.printList[i].voucherNoTop ?? "")^FS^CF0,25^FO280,90^FDPrint Date : ^FS^CF0,25^FO400,90^FD\(self.printList[i].date ?? "")^FS^FO10,150^GB200,100,0^FS^CF0,25^FO20,170^FDTour^FS^FO210,150^GB340,100,0^FS^FO 220, 170 ^A 0, 20 ^FD\(self.printList[i].tourName ?? "")^FS^FO10,250^GB200,60,0^FS^CF0,25^FO20,270^FDPax Info^FS^FO210,250^GB340,60,0^FS^FO220, 270 ^A 0, 20 ^FD\(self.printList[i].paxInfo ?? "")^FS^FO10,310^GB200,60,0^FS^CF0,25^FO20,330^FDDate^FS^FO210,310^GB340,60,0^FS^FO 220, 330 ^A 0, 20 ^FD\(self.printList[i].tourDate ?? "")^FS^FO10,370^GB200,60,0^FS^CF0,25^FO20,390^FDConcept^FS^FO210,370^GB340,60,0^FS^FO 220, 390 ^A 0, 20 ^FDStandart^FS^FO10,430^GB200,60,0^FS^CF0,25^FO20,450^FDTransfer^FS^FO210,430^GB340,60,0^FS^FO 220, 450 ^A 0, 20 ^FD\(self.printList[i].transTourist ?? "")^FS^FO10,490^GB200,100,0^FS^CF0,25^FO20,510^FDHotel^FS^FO210,490^GB340,100,0^FS^FO 220, 510 ^A 0, 20 ^FD\(hotelNameFirstColumn)^FS^FO 220, 550 ^A 0, 20 ^FD\(hotelNameScondColumn)^FS^FO10,590^GB200,60,0^FS^CF0,25^FO20,610^FDRoom^FS^FO210,590^GB340,60,0^FS^FO 220, 610 ^A 0, 20 ^FD\(self.printList[i].room ?? "")^FS^FO10,650^GB200,60,0^FS^CF0,25^FO20,670^FDPick Up^FS^FO210,650^GB340,60,0^FS^FO 220, 670 ^A 0, 20 ^FD\(self.printList[i].pickUpTime ?? "")^FS^FO10,710^GB200,60,0^FS^CF0,25^FO20,730^FDPick Up Point^FS^FO210,710^GB340,60,0^FS^FO 220, 730 ^A 0, 20 ^FD-^FS^FO10,770^GB200,60,0^FS^CF0,25^FO20,790^FDName^FS^FO210,770^GB340,60,0^FS^FO 220, 790 ^A 0, 20 ^FD\(self.printList[i].paxName ?? "")^FS^FO10,830^GB200,60,0^FS^CF0,25^FO20,850^FDOperator^FS^FO210,830^GB340,60,0^FS^FO 220, 850 ^A 0, 20 ^FD\(self.printList[i].operatorName ?? "")^FS^FO10,890^GB200,60,0^FS^CF0,25^FO20,910^FDRes No^FS^FO210,890^GB340,60,0^FS^FO 220, 910 ^A 0, 20 ^FD\(self.printList[i].resNo ?? "")^FS^CF0,25^FO20,980^FDNet Total^FS^CF0,25^FO150,980^FD\(self.printList[i].total ?? "")^FS^CF0,25^FO20,1020^FDDiscount^FS^CF0,25^FO150,1020^FD\(self.printList[i].discount ?? "")^FS\(self.printList[i].tourPax ?? "")\(self.printList[i].paymentDetail ?? "")\(self.printList[i].extras ?? "")\(self.printList[i].transfers ?? "")\(self.printList[i].voucher ?? "")\(self.printList[i].refundConditionLabel ?? "")\(odeonLabel)^XZ"
               }else if  ConfigManager.shared.getAppType() == .RotaEgypt {
                    self.printString = "^XA^PON^LL\(self.addedNumber + 200 + 1200)^XGMyFormat^FS^CF0,25^FO280,30^FDVoucher No^FS^CF0,25^FO280,60^FD\(self.printList[i].voucherNoTop ?? "")^FS^CF0,25^FO280,90^FDPrint Date : ^FS^CF0,25^FO400,90^FD\(self.printList[i].date ?? "")^FS^FO10,150^GB200,100,0^FS^CF0,25^FO20,170^FDTour^FS^FO210,150^GB340,100,0^FS^FO 220, 170 ^A 0, 20 ^FD\(self.printList[i].tourName ?? "")^FS^FO10,250^GB200,60,0^FS^CF0,25^FO20,270^FDPick Up^FS^FO210,250^GB340,60,0^FS^FO220, 270 ^A 0, 20 ^FD\(self.printList[i].pickUpTime ?? "")^FS^FO10,310^GB200,60,0^FS^CF0,25^FO20,330^FDPick Up Point^FS^FO210,310^GB340,60,0^FS^FO 220, 330 ^A 0, 20 ^FD-^FS^FO10,370^GB200,60,0^FS^CF0,25^FO20,390^FDDate^FS^FO210,370^GB340,60,0^FS^FO 220, 390 ^A 0, 20 ^FD\(self.printList[i].tourDate ?? "")^FS^FO10,430^GB200,60,0^FS^CF0,25^FO20,450^FDConcept^FS^FO210,430^GB340,60,0^FS^FO 220, 450 ^A 0, 20 ^FDStandart^FS^FO10,490^GB200,60,0^FS^CF0,25^FO20,510^FDTransfer^FS^FO210,490^GB340,60,0^FS^FO 220, 510 ^A 0, 20 ^FD\(self.printList[i].transTourist ?? "")^FS^FO10,610^GB200,100,0^FS^CF0,25^FO20,630^FDHotel^FS^FO210,610^GB340,100,0^FS^FO 220, 630 ^A 0, 20 ^FD\(hotelNameFirstColumn)^FS^FO 220, 670 ^A 0, 20 ^FD\(hotelNameScondColumn)^FS^FO10,710^GB200,60,0^FS^CF0,25^FO20,730^FDRoom^FS^FO210,710^GB340,60,0^FS^FO 220, 730 ^A 0, 20 ^FD\(self.printList[i].room ?? "")^FS^FO10,770^GB200,60,0^FS^CF0,25^FO20,790^FDName^FS^FO210,770^GB340,60,0^FS^FO 220, 790 ^A 0, 20 ^FD\(self.printList[i].paxName ?? "")^FS^FO10,830^GB200,60,0^FS^CF0,25^FO20,850^FDOperator^FS^FO210,830^GB340,60,0^FS^FO 220, 850 ^A 0, 20 ^FD\(self.printList[i].operatorName ?? "")^FS^FO10,890^GB200,60,0^FS^CF0,25^FO20,910^FDRes No^FS^FO210,890^GB340,60,0^FS^FO 220, 910 ^A 0, 20 ^FD\(self.printList[i].resNo ?? "")^FS^CF0,25^FO20,980^FDNet Total(VAT Inc.)^FS^CF0,25^FO220,980^FD\(self.printList[i].total ?? "")^FS^CF0,25^FO20,1020^FDVat Amount^FS^CF0,25^FO150,1020^FD\(self.printList[i].vatAmount ?? "")^FS^CF0,25^FO20,1060^FDDiscount^FS^CF0,25^FO150,1060^FD\(self.printList[i].discount ?? "")^FS\(self.printList[i].tourPax ?? "")\(self.printList[i].paymentDetail ?? "")\(self.printList[i].extras ?? "")\(self.printList[i].transfers ?? "")\(self.printList[i].voucher ?? "")\(self.printList[i].refundConditionLabel ?? "")\(odeonLabel)^XZ"
               }
               
             //  self.printListStringType.append(printString)
               sendStrToPrinter(self.printString, connection: connection)
           }
       }
   }
}

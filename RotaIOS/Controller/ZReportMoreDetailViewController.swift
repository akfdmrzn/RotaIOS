//
//  ZReportMoreDetailViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 21.09.2021.
//

import UIKit

class ZReportMoreDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewZreportMoreDetailview: ZReportMoreDetailView!
    var zReportNumberInZReportDetailPage : String?
    var zReportData : GetReportDataResponseModel?
    var zReportPreview : [ReportPreview] = []
    var zReportTotal : [ReportTotal] = []
    var zReportRefund : [TourRefund] = []
    var tempReportPreview : [String] = ["-","-","-","-","-","-"]
    var tempReportTotal : [String] = ["-","-","-"]
    var tempReportRefund : [String] = ["-","-","-","-"]
    var connectedAccessories : [EAAccessory] = []
    var printString = ""
    var addedNumber = 300
    var zReportPreviewLabel = ""
    var zReportTotalLabel = ""
    var zReportRefundLabel = ""
    var zReportNo = ""
    var zReportDateTime = ""
    var zReportGuide = ""
    var zReportCollettor = ""
    var zReportCreatedBy = ""
    var bottomDataLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateConnectedAccessories()
        let getReportDataRequestModel = GetReportDataRequestModel.init(zReportNumber: self.zReportNumberInZReportDetailPage ?? "")
        NetworkManager.sendGetRequest(url: NetworkManager.BASEURL, endPoint:.GetZReportData, method: .get, parameters: getReportDataRequestModel.requestPathString()) { (response : GetReportDataResponseModel) in
            if response.zReportNo != nil {
                self.zReportData = response
                self.zReportPreview = response.reportPreview ?? self.zReportPreview
                self.zReportTotal = response.reportTotal ?? self.zReportTotal
                self.tableView.reloadData()
                self.viewZreportMoreDetailview.setConfigure(model: self.zReportData ?? GetReportDataResponseModel.init())
                
                self.zReportNo = self.zReportData?.zReportNo ?? ""
                self.zReportDateTime = self.zReportData?.reportDateTime ?? ""
                self.zReportGuide = self.zReportData?.guide ?? ""
                self.zReportCreatedBy = self.zReportData?.createdUser ?? ""
                self.zReportCollettor = self.zReportData?.collector ?? ""
            }else {
                let alert = UIAlertController(title: "Error", message: "Data Has not Recived", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ZReportTotalTableViewCell.nib, forCellReuseIdentifier: ZReportTotalTableViewCell.identifier)
        self.tableView.register(ZReportPriviewTableViewCell.nib, forCellReuseIdentifier: ZReportPriviewTableViewCell.identifier)
        self.tableView.register(DailyReportTableViewCell.nib, forCellReuseIdentifier: DailyReportTableViewCell.identifier)
        self.tableView.register(HotelsandFlightsTableViewCell.nib, forCellReuseIdentifier: HotelsandFlightsTableViewCell.identifier)
    }
    
    func updateConnectedAccessories(){
        self.connectedAccessories = EAAccessoryManager.shared().connectedAccessories
    }
    
    @IBAction func printButtonClicked(_ sender: Any) {
      
        
        if self.connectedAccessories.count > 0{
            self.connectEaAccessory(eaAccessory: self.connectedAccessories[0])
            if let topVC = UIApplication.getTopViewController() {
                   topVC.otiPushViewController(viewController: MainPAgeViewController())
               }
        }else{
            let alert = UIAlertController.init(title: "Warning", message: "Connect Zebra device", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let topVC = UIApplication.getTopViewController() {
                topVC.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    init(zReportNumberInZReportDetailPage : String? ) {
        self.zReportNumberInZReportDetailPage = zReportNumberInZReportDetailPage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZReportMoreDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if self.zReportPreview.count > 0 {
                return self.zReportPreview.count
            }
            return 1
        }else if section == 1{
            if self.zReportTotal.count > 0 {
                return self.zReportTotal.count
            }
            return 1
        }else {
            if self.zReportRefund.count > 0 {
                return self.zReportRefund.count
            }
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ZReport Preview"
        }else if section == 1 {
            return "ZReport Net Total"
        }else if section == 2 {
            return "ZReport Tour Refund Details"
        }else {
            return "Hotels and Flight Ticket"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.font = UIFont.init(name: "Montserrat-Regular", size: 14)
        header?.textLabel?.textColor = .black
        // header?.backgroundView?.backgroundColor = UIColor.grayColor
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ZReportPriviewTableViewCell.identifier) as! ZReportPriviewTableViewCell
            if self.zReportPreview.count > 0 {
                cell.labelType.text = self.zReportPreview[indexPath.row].saleType
                cell.labelPaymentType.text = self.zReportPreview[indexPath.row].paymentType
                cell.labelSale.text = self.zReportPreview[indexPath.row].saleAmount
                cell.labelRefund.text = self.zReportPreview[indexPath.row].refundAmount
                cell.labelTotal.text = self.zReportPreview[indexPath.row].balanceAmount
                cell.labelCurrency.text = self.zReportPreview[indexPath.row].currencyType
                return cell
            }else {
                cell.labelType.text = self.tempReportPreview[indexPath.row]
                cell.labelPaymentType.text = self.tempReportPreview[indexPath.row]
                cell.labelSale.text = self.tempReportPreview[indexPath.row]
                cell.labelRefund.text = self.tempReportPreview[indexPath.row]
                cell.labelTotal.text = self.tempReportPreview[indexPath.row]
                cell.labelCurrency.text = self.tempReportPreview[indexPath.row]
                return cell
            }
        }else if indexPath.section == 1{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ZReportTotalTableViewCell.identifier) as! ZReportTotalTableViewCell
            if self.zReportTotal.count > 0 {
                cell.labelPaymentType.text = self.zReportTotal[indexPath.row].paymentType
                cell.labelAmount.text = self.zReportTotal[indexPath.row].amount
                cell.labelCurrencyType.text = self.zReportTotal[indexPath.row].currencyType
                return cell
            }else {
                cell.labelPaymentType.text = self.tempReportTotal[indexPath.row]
                cell.labelAmount.text = self.tempReportTotal[indexPath.row]
                cell.labelCurrencyType.text = self.tempReportTotal[indexPath.row]
                return cell
            }
        } else if indexPath.section == 2{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: DailyReportTableViewCell.identifier) as! DailyReportTableViewCell
            if self.zReportRefund.count > 0 {
                cell.labelPaymentType.text = self.zReportRefund[indexPath.row].paymentType
                cell.labelRefund.text = self.zReportRefund[indexPath.row].refundTypeDesc
                cell.labelAmount.text = self.zReportRefund[indexPath.row].refundAmount
                cell.labelCurrencyType.text = self.zReportRefund[indexPath.row].currencyType
                return cell
            }else {
                cell.labelPaymentType.text = self.tempReportRefund[indexPath.row]
                cell.labelRefund.text = self.tempReportRefund[indexPath.row]
                cell.labelAmount.text = self.tempReportRefund[indexPath.row]
                cell.labelCurrencyType.text = self.tempReportRefund[indexPath.row]
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelsandFlightsTableViewCell.identifier) as! HotelsandFlightsTableViewCell
            return cell
        }
    }
}

extension ZReportMoreDetailViewController: EAAccessoryManagerConnectionStatusDelegate {
    func changeLabelStatus() {
       /*if printManager.isConnected {
            printerConnectionStatus.text = "Connected"
        } else {
            printerConnectionStatus.text = "Not Connected"
        }*/
    }
}

extension ZReportMoreDetailViewController{
 
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
        
        // iade kuralleri diller
        
        let odeonLabel = "^FO10,20^GFA,2425,2425,25,,:::00hKFE,007hJFE,:::::::::007gUF80JF3FFE,007LF81JFC3OFE1KF83IF807FFE0FFE,007LF01JF8007MF803IFE01IF803FFC07FE,007KFCI01FEJ03KFCI0IFCI03FC01FFC07FE,007KF8J07L07JF8I0IFK0FE01FFE03FE,007KFK03L01IFEJ07FEK07E00FFE03FE,007JFCS0IFCJ07FCK03F00IF03FE,007JF8S07FF8J07F8K01F807FF03FE,007JF8007EK0FF803FF007E07FI07E01F807FF03FE,007JF001FF80080FFE03FE03FFCFE001FF00F803FF03FE,007IFE001FF80780FFE01FC07JFC003FF80F001FF03FE,007IFC003FFC0781IF01F80KFC007FF80F001FF83FE,007IF8087FFC0781IF00F01KF8107FFC0FI0FF83FE,007IF81CIFE0781IF00F03KF018IFC0E0807F83FE,007IF01JFE0781IF00E07KF03JFC0E0C07F83FE,007IF03JFE0781IF80C07FFC7E03JFC0E0C03F83FE,007IF03JFE0781IF80C0F8003E07JFC0E0E03F83FE,007FFE03JFE0781IF808K03E07JFC0E1E01F83FE,007FFE07JFE0781IF808K03C07JFC0C1F00F83FE,007FFC07JFC0781IF01L03C0KFC0C1F80F83FE,007FFC07JFC0F81IF01L03C0KF81C1F80783FE,007FFC07JFC0F81IF01L07C0KF81C1FC0787FE,007FFC07JF81F81IF0203KFC0KF8181FE0387FE,007FFC07JF81F81FFE0203KF80KF0383FE0187FE,007FFC07JF03F81FFE0603KF80JFE0783FF0187FE,007FFC07IFE03F81FFC0603KF80JFE0703FF8087FE,007FFC07IFE07F81FF80E03KF807IFC0F07FF8007FE,007FFC03IF80FF81FF01E03JFC007IF81E07FFC007FE,007FFC01FFE01FF81F803E01IFEI03FFE01E07FFE00FFE,007FFE007F803F801E007E007FFK0FF807E07FFE00FFE,007FFEL07F8K0FFT0FC0JF00FFE,007IFL0FF8J03FFM06K01FC0JF80FFE,007IF8J03FF8J07FF8K01FK03F00JFC1FFE,007IFCJ0IF8I03IFCK0FF8J0FE00JFE3FFE,007IFEI03IFCI0JFEJ07FFEI03FE01NFE,007JF800JFE007KF8003JF001FFE01NFE,007gSFE03NFE,007gTF03NFE,007gTFC7NFE,007hJFE,007gPFDSFE,007FFEgY07FE,007FFCgY07FE,:007FFEgY07FE,007hJFE,::::007RFE3gLFC7FFE,007FFC001LF00MF8707KFC00LFE00FFE,007FFC001KFE007LF0707KF800LFC00FFE,007FFC001KFE003LF0707KF8007KFC007FE,007FFE003KFC083LF0707KF8007KF8107FE,007IFC1LFC183LF0707KF8307KF8187FE,007IFC1LFC183LF0707KF8307KF81CFFE,007IFC1LFC1C1LF0707KF8107KFC07FFE,007IFC1LFC1C1LF0707KF8007KFC01FFE,007IFC1LFC1C1LF0707KF800LFE00FFE,007IFC1LFC1C1LF0707KF8007LF807FE,007IFC1LFC181LF0707KF8007LFE07FE,007IFC1LFC183LF0707KF8307KF8303FE,007IFC1LFC183LF0307KF8387KF8303FE,007IFC1LFC083LF8007KF8387KF8007FE,007IFC1LFE003LF800LF8387KF8007FE,007IFC1MF007LFC00LF8383KFC00FFE,007IFE1MF80MFE03LFC387KFE01FFE,007hJFE,::::::00hKFE,007hJFC,,::::^FS"
        
        
        var labelSizeNumber = 180
        if  self.zReportPreview.count > 0 {
            self.zReportPreviewLabel = "^CF0,25^FO20,\(labelSizeNumber)^FDZReport Preview^FS"
            labelSizeNumber += 10
            for i in 0...self.zReportPreview.count - 1 {
                var label = ""
                label = "^CF1,14^FO20,\(labelSizeNumber + 30))^FD\( self.zReportPreview[i].saleType ?? "" )^FS^CF1,14^FO100,\(labelSizeNumber + 30))^FD\( self.zReportPreview[i].paymentType ?? "" )^FS^CF1,14^FO180,\(labelSizeNumber + 30))^FD\( self.zReportPreview[i].saleAmount ?? "" )^FS^CF1,14^FO300,\(labelSizeNumber + 30))^FD\( self.zReportPreview[i].refundAmount ?? "" )^FS^CF1,14^FO420,\(labelSizeNumber +  30))^FD\( self.zReportPreview[i].balanceAmount ?? "" )^FS^CF1,14^FO530,\(labelSizeNumber + 30))^FD\( self.zReportPreview[i].currencyType ?? "" )^FS"
                self.zReportPreviewLabel.append(label)
                labelSizeNumber += 30
            }
        }
        
        if  self.zReportTotal.count > 0 {
            labelSizeNumber += 80
            self.zReportTotalLabel = "^CF0,25^FO20,\(labelSizeNumber)^FDZReport Net Total^FS"
            labelSizeNumber += 10
            for i in 0...self.zReportTotal.count - 1 {
                var label = ""
                label = "^CF1,14^FO20,\(labelSizeNumber + 30))^FD\( self.zReportTotal[i].paymentType ?? "" )^FS^CF1,14^FO120,\(labelSizeNumber + 30))^FD\( self.zReportTotal[i].amount ?? "" )^FS^CF1,14^FO250,\(labelSizeNumber + 30))^FD\( self.zReportTotal[i].currencyType ?? "" )^FS"
                self.zReportTotalLabel.append(label)
                labelSizeNumber += 30
            }
        }
        
        if  self.zReportRefund.count > 0 {
            labelSizeNumber += 80
            self.zReportRefundLabel = "^CF0,25^FO20,\(labelSizeNumber)^FDZReport Refund Details^FS"
            labelSizeNumber += 10
            for i in 0...self.zReportRefund.count - 1 {
                var label = ""
                label = "^CF1,14^FO20,\(labelSizeNumber + 30))^FD\( self.zReportRefund[i].paymentType ?? "" )^FS^CF1,14^FO100,\(labelSizeNumber + 30))^FD\( self.zReportRefund[i].refundTypeDesc ?? "" )^FS^CF1,14^FO180,\(labelSizeNumber + 30))^FD\( self.zReportRefund[i].refundAmount ?? "" )^FS^CF1,14^FO260,\(labelSizeNumber + 30))^FD\( self.zReportRefund[i].currencyType ?? "" )^FS"
                self.zReportRefundLabel.append(label)
                labelSizeNumber += 30
            }
        }
        
        
        labelSizeNumber += 50
        self.bottomDataLabel = "^CF0,25^FO20,\(labelSizeNumber)^FDGuide ^FS^CF1,14^FO20,\(labelSizeNumber + 30)^FD\( self.zReportGuide)^FS^CF0,25^FO20,\(labelSizeNumber + 80)^FDCollector ^FS^CF1,14^FO20,\(labelSizeNumber + 110)^FD\( self.zReportCollettor)^FS^CF0,25^FO400,\(labelSizeNumber + 80)^FDCreated By ^FS^CF1,14^FO400,\(labelSizeNumber + 110)^FD\( self.zReportCreatedBy)^FS"
   
        self.addedNumber += labelSizeNumber
                
        self.printString = "^XA^PON^LL\(self.addedNumber)^XGMyFormat^FS^CF0,20^FO20,130^FD Date:^FS^CF0,20^FO100,130^FD\(self.zReportDateTime)^FS^FO250,20^BY2^BCN,50,Y,N,N^FD\(self.zReportNo)^FS\(self.zReportPreviewLabel)\(self.zReportTotalLabel)\(self.zReportRefundLabel)\(self.bottomDataLabel)\(odeonLabel)^XZ"
              //  self.printListStringType.append(printString)
                sendStrToPrinter(self.printString, connection: connection)
         
    }
}

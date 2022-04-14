//
//  ScanDeviceCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 5.04.2022.
//

import Foundation
import UIKit


class ScanDeviceCustomView : UIView {
    @IBOutlet var viewMainView: UIView!
    @IBOutlet weak var buttonScan: UIButton!
    @IBOutlet weak var buttonReconnect: UIButton!
    @IBOutlet weak var buttonPrint: UIButton!
    @IBOutlet weak var buttonNewExcSale: UIButton!
    @IBOutlet weak var buttonNewInd_Shop: UIButton!

    var connectedDeviceName = ""
    
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
    }
    
    func getNotConnectionDevices() {
        EAAccessoryManager.shared().showBluetoothAccessoryPicker(withNameFilter: nil) { success in
            self.connectedDeviceName = EAAccessoryManager.shared().connectedAccessories[0].name
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
       
      
        // get devices diye func yaz kodu bu func içine yaz func bool dönecek
    }
    
    @IBAction func printButtonTapped(_ sender: Any) {
       // self.excProceedCustomView = ExcProceedCustomView()
    
    }
    
    @IBAction func newExcSaleButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func newIndShopSaleTapped(_ sender: Any) {
        
    }
}

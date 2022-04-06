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
    var deviceListCustomView : DeviceListCustomView?
    
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
    }
    
    @IBAction func scanButtonTapped(_ sender: Any) {
        if let topVC = UIApplication.getTopViewController() {
            UIView.animate(withDuration: 0, animations: {
                self.deviceListCustomView = DeviceListCustomView()
               /* self.tempTouristAddView?.tempPaxesList = self.sendingListofPaxes
                self.tempTouristAddView?.changeCounterValue = self.tempValue
                self.tempTouristAddView?.temppAddPaxesListDelegate = self*/
                self.deviceListCustomView!.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 1200)
                topVC.view.addSubview(self.deviceListCustomView!)
            }, completion: { (finished) in
                if finished{
                    
                }
            })
        }
    }
    
    @IBAction func reconnectButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func printButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func newExcSaleButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func newIndShopSaleTapped(_ sender: Any) {
        
    }
}

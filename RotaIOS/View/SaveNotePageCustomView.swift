//
//  SaveNotePageCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.03.2022.
//

import Foundation

import UIKit

class SaveNotePageCustomView : UIView {
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var viewRemove: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var buttonSend: UIButton!
    var toursaleId = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
        self.headerView.backgroundColor = UIColor.grayColor
        self.textView.backgroundColor = UIColor.mainTextColor
        self.buttonSend.backgroundColor = UIColor.greenColor
        self.buttonSend.layer.cornerRadius = 10
        self.viewRemove.layer.cornerRadius = 5
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(removeView))
        self.viewRemove.addGestureRecognizer(gesture)
    }
    
    @objc func removeView() {
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: SaveNotePageCustomView.self), owner: self, options: nil)
        headerView.addCustomContainerView(self)
   
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        let tourSalecRequestModel = GetUpdateSaleNoteforMobileRequestModel.init(TourSaleId: self.toursaleId, Note: self.textView.text)
        NetworkManager.sendGetRequest(url: NetworkManager.BASEURL, endPoint: .GetUpdateSaleNoteforMobile, method: .get, parameters: tourSalecRequestModel.requestPathString()) { (response : GetUpdateSaleNoteforMobileResponseModel) in
            if response.isSuccesful == true {
                if let topVC = UIApplication.getTopViewController() {
                    let alert = UIAlertController(title: "SUCCESS", message: response.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    topVC.present(alert, animated: true, completion: nil)
                    self.buttonColor(isEnable: false, button: self.buttonSend)
                }
            }else{
                if let topVC = UIApplication.getTopViewController() {
                    let alert = UIAlertController(title: "ERROR", message: response.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    topVC.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
}

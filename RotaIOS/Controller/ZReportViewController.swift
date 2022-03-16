//
//  ZReportViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 20.09.2021.
//

import UIKit

class ZReportViewController: UIViewController {
    @IBOutlet var viewZReportView: ZReportView!
    var zReportList : [GetZReportResponseModel] = []
    var zReportDate = ""
    let zReportDateToolBar = UIToolbar()
    var ZReportNumber = ""
    var guideList : [GuideGetSelectListResponseModel] = []
    var zreportDatePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return datePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ZReportNumber = self.viewZReportView.viewZreportNumberView.mainText.text ?? ""
        self.createCurrentDatePicker()
    }
    
    func createCurrentDatePicker() {
        self.viewZReportView.viewDateView.mainText.textAlignment = .left
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(zReportDatetDatePickerDonePressed))
        self.zReportDateToolBar.setItems([doneButton], animated: true)
        self.zReportDateToolBar.sizeToFit()
        self.viewZReportView.viewDateView.mainText.inputAccessoryView = self.zReportDateToolBar
        self.viewZReportView.viewDateView.mainText.inputView = self.zreportDatePicker
        self.zreportDatePicker.datePickerMode = .date
    }
    
    @objc func zReportDatetDatePickerDonePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "MM-dd-yyyy"
        print(formatter.string(from: self.zreportDatePicker.date))
        self.zReportDate = formatter.string(from: self.zreportDatePicker.date)
        formatter.dateFormat = "dd-MM-yyy"
        self.viewZReportView.viewDateView.mainText.text = "\(formatter.string(from: self.zreportDatePicker.date))"
        self.viewZReportView.endEditing(true)
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        self.ZReportNumber = self.viewZReportView.viewZreportNumberView.mainText.text ?? ""
        let zReportRequestModel = GetZReportRequestModel.init(reportCreateDateStart: self.zReportDate, reportCreateDateEnd: self.zReportDate, zReportNumber: self.ZReportNumber, guideId: String(userDefaultsData.getGuideId()))
        NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetSearchZReport, method: .get, parameters: zReportRequestModel.requestPathString()) { (response : [GetZReportResponseModel]) in
            if response.count > 0 {
                self.zReportList = response
                NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetGuideSelectList, method:.get, parameters: "") { (response : [GuideGetSelectListResponseModel]) in
                    if response.count > 0 {
                        self.guideList = response
                        for i in 0...self.zReportList.count - 1 {
                            var filter : [GuideGetSelectListResponseModel] = []
                            filter = self.guideList.filter{$0.value == self.zReportList[i].guideRef}
                            if filter.count > 0 {
                                self.zReportList[i].guideName = filter[0].text ?? ""
                            }
                        }
                        
                        self.otiPushViewController(viewController: ZReportDetailViewController.init(zReportDetailListInZReportDetailPage: self.zReportList), animated: true)
                    }else{
                        print("guidelist data has not recived")
                    }
                }
               
               
                
            }else {
                let alert = UIAlertController(title: "Error", message: "Please Check Date and ZReport No", preferredStyle:UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
}

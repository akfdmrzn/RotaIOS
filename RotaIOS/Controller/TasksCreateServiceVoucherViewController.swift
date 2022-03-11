//
//  TasksCreateServiceVoucherViewController.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import UIKit

class TasksCreateServiceVoucherViewController: BaseViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    public var ids: String = ""
    public var stepId: String = ""
    var companyUserList: [GetStepDetail] = []
    var username: String = ""
    var action: String = ""
    var stepsDetailList: [GetStepDetail] = [] 
    var jsonModelList: [JsonModelList] = []
    @IBOutlet weak var pickerView: PickerView!
    var pickerList: [PickerList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCompanyUsers()
        if stepsDetailList.count > 0{
            for index in 0...self.stepsDetailList.count - 1{
                self.jsonModelList.append(JsonModelList.init(serviceType: self.stepsDetailList[index].serviceType ?? "", realTotal: self.stepsDetailList[index].realTotal ?? "", realAdult: self.stepsDetailList[index].realAdult ?? "", realChild: self.stepsDetailList[index].realChild ?? "", realToodle: self.stepsDetailList[index].realToodle ?? "", realInfant: self.stepsDetailList[index].realInfant ?? "", freeAdult: self.stepsDetailList[index].freeAdult ?? "", freeChild: self.stepsDetailList[index].freeChild ?? "", freeToodle: self.stepsDetailList[index].freeToodle ?? "", freeInfant: self.stepsDetailList[index].freeInfant ?? "", totalAdult: self.stepsDetailList[index].totalAdult ?? "", totalChild: self.stepsDetailList[index].totalChild ?? "", totalToodle: self.stepsDetailList[index].totalToodle ?? "", totalInfant: self.stepsDetailList[index].totalInfant ?? "", realAmount: self.stepsDetailList[index].realAmount ?? "", freeAmount: self.stepsDetailList[index].freeAmount ?? "", freeTotal: self.stepsDetailList[index].freeTotal ?? "", totalAmount: self.stepsDetailList[index].totalAmount ?? "", grandTotal: self.stepsDetailList[index].grandTotal ?? ""))
            }
        }
    }

    func getCompanyUsers(){
        let getCompanyUsersRequestModel = GetCompanyUsersRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetCompanyUsers, method: .get, parameters: getCompanyUsersRequestModel.requestPathString()) { (response : GetCompanyUsersResponseModel) in
            if response.isSuccesful ?? false {
                self.pickerView.delegate = self
                self.pickerView.commonInit()
                self.pickerView.setPickerConfigure()
                self.pickerView.list = self.pickerList
            }else {
               print("error")
            }
        }
    }
    
    func isCompanyUserValid(){
        let isCompanyUserValidRequestModel = IsCompanyUserValidRequestModel.init(ids: self.ids, stepId: self.stepId, username: self.username, password: self.passwordTextField.text ?? "")
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .IsCompanyUserValid, method: .get, parameters: isCompanyUserValidRequestModel.requestPathString()) { (response : IsCompanyUserValidResponseModel) in
            if response.isSuccesful ?? false{
                self.createServiceVoucher()
            }else {
               print("error")
            }
        }
    }
    
    func createServiceVoucher(){
        let createServiceVoucherRequestModel = CreateServiceVoucherRequestModel.init(ids: self.ids, stepId: self.stepId, action: self.action, jsonStr: jsonModelList.toJSONString() ?? "")
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .CreateServiceVoucher, requestModel: createServiceVoucherRequestModel) { (response : CreateServiceVoucherResponseModel) in
            if response.isSuccesful == true {
                UIApplication.getTopViewController()?.showAlertMsg(msg: "Created voucher number is " + (response.message ?? ""), finished: {
                })
            }
        }
    }
        
    @IBAction func buttonTappedLogin(_ sender: Any) {
        if self.username != "" && self.passwordTextField.text != ""{
            self.isCompanyUserValid()
        }
        else{
            UIApplication.getTopViewController()?.showAlertMsg(msg: "Please, enter username and password!", finished: {
            })
        }
    }
}

extension TasksCreateServiceVoucherViewController: PickerViewDelegate {
    func selectCompany(id: Int, name: String) {
        self.username = name
    }
}


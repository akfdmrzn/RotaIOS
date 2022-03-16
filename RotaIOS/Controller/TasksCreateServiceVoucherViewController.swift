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
                self.jsonModelList.append(JsonModelList.init(serviceType: self.stepsDetailList[index].serviceType ?? "", realTotal: self.stepsDetailList[index].realTotal ?? "", realAdult: self.stepsDetailList[index].realAdult ?? "", realChild: self.stepsDetailList[index].realChild ?? "", realToodle: self.stepsDetailList[index].realToodle ?? "", realInfant: self.stepsDetailList[index].realInfant ?? "", freeAdult: self.stepsDetailList[index].freeAdult ?? "", freeChild: self.stepsDetailList[index].freeChild ?? "", freeToodle: self.stepsDetailList[index].freeToodle ?? "", freeInfant: self.stepsDetailList[index].freeInfant ?? "", totalAdult: self.stepsDetailList[index].totalAdult ?? "", totalChild: self.stepsDetailList[index].totalChild ?? "", totalToodle: self.stepsDetailList[index].totalToodle ?? "", totalInfant: self.stepsDetailList[index].totalInfant ?? "", realAmount: self.stepsDetailList[index].realAmount ?? "", freeAmount: self.stepsDetailList[index].freeAmount ?? "", freeTotal: self.stepsDetailList[index].freeTotal ?? "", totalAmount: self.stepsDetailList[index].totalAmount ?? "", grandTotal: self.stepsDetailList[index].grandTotal ?? "", action: "1", serviceId: self.stepsDetailList[index].serviceId ?? "", isExtraService: self.stepsDetailList[index].isExtraService ?? "", stepId: self.stepId, ids: self.ids, extraServiceId: self.stepsDetailList[index].extraServiceId ?? "", ID: self.stepsDetailList[index].iD ?? "", tourTransferPlanArrAndDepId: self.stepsDetailList[index].tourTransferPlanArrAndDepId ?? "", companyId: self.stepsDetailList[index].companyId ?? "", sV_CreatedBy: "", id: self.stepsDetailList[index]._id ?? ""))
                
            }
        }
    }

    func getCompanyUsers(){
        let getCompanyUsersRequestModel = GetCompanyUsersRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetCompanyUsers, method: .get, parameters: getCompanyUsersRequestModel.requestPathString()) { (response : [GetCompanyUsersResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.pickerList.append(PickerList.init(id: item.id ?? "", name: item.username ?? ""))
                }
                self.pickerView.delegate = self
                self.pickerView.commonInit()
                self.pickerView.setPickerConfigure()
                self.pickerView.list = self.pickerList
                self.username = self.pickerList[0].name
                self.pickerView.textFieldCompanyUser.text = self.pickerList[0].name
            }else {
               print("error")
            }
        }
    }
    
    func isCompanyUserValid(){
        
        self.pickerView.delegate = self
        let isCompanyUserValidRequestModel = IsCompanyUserValidRequestModel.init(ids: self.ids, stepId: self.stepId, username: self.username, password: self.passwordTextField.text ?? "")
        NetworkManager.sendGetRequestTextResponse(url:NetworkManager.BASEURL, endPoint: .IsCompanyUserValid, method: .get, parameters: isCompanyUserValidRequestModel.requestPathString()) { (response : String) in
            if response == "true" {
                self.createServiceVoucher()
            }
            else{
                
            }
        }
        
    }
    
    func createServiceVoucher(){
        let createServiceVoucherRequestModel = CreateServiceVoucherRequestModel.init(ids: self.ids, stepId: self.stepId, action: "1", jsonStr: jsonModelList.toJSONString() ?? "")
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .CreateServiceVoucher, requestModel: createServiceVoucherRequestModel) { (response : CreateServiceVoucherResponseModel) in
            if response.isSuccesful == true {
                UIApplication.getTopViewController()?.showAlertMsg(msg: "Created voucher number is " + String(response.record ?? 0), finished: {
                    self.dismiss(animated: true, completion: nil)
                    self.otiPushViewController(viewController: MainPAgeViewController())
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
    func selectCompany(id: String, name: String) {
        self.username = name
    }
}

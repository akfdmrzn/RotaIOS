//
//  TasksCreateServiceVoucherViewController.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import UIKit

class TasksCreateServiceVoucherViewController: BaseViewController {
    enum ServiceType: Int {
        case EXC = 1
        case COL = 2
        case DEL = 3
        case ARR = 4
        case DEP = 5
        case INT = 6
        case INFO = 7
        case SHOP = 10
    }
    @IBOutlet weak var passwordTextField: UITextField!
    public var ids: String = ""
    public var stepId: String = ""
    var companyUserList: [GetStepDetail] = []
    var username: String = ""
    var action: String = ""
    var stepsDetailList: [GetStepDetail] = []
    var stepsDetailPaxesList: [GetStepDetailPaxesList] = []
    var jsonModelList: [JsonModelList] = []
    var jsonModelPaxList: [JsonModelPaxList] = []
    var paxes: [PaxesList] = []
    var newPaxes: [PaxesListStr] = []
    public var serviceType: Int = 0
    public var supplierType: String = "0"
    @IBOutlet weak var pickerView: PickerView!
    var pickerList: [PickerList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCompanyUsers()
        if self.supplierType == "2"{
            if stepsDetailPaxesList.count > 0{
                for index in 0...self.paxes.count - 1 {
                    self.newPaxes.append(PaxesListStr.init(_id: self.paxes[index]._id ?? "", oprShopPaxesID: String(self.paxes[index].oprShopPaxesID ?? 0), oprTouristID: self.paxes[index].oprTouristID ?? "", paxNameSurname: self.paxes[index].paxNameSurname ?? "", operatorId: String(self.paxes[index].operatorId ?? 0), operatorName: self.paxes[index].operatorName ?? "", marketId: String(self.paxes[index].marketId ?? 0), marketName: self.paxes[index].marketName ?? "", paxType: self.paxes[index].paxType ?? "", unselectable: String(self.paxes[index].unselectable ?? false), isGoShow: String(self.paxes[index].isGoShow ?? false), userSelected: "true"))
                }
                let list: GetStepDetailPaxesList = stepsDetailPaxesList[0]
                self.jsonModelPaxList.append(JsonModelPaxList.init(_id: list._id ?? "", ids: list.ids ?? "", stepId: self.stepId, companyId: String(list.companyId ?? 0), tourTransferPlanArrAndDepId: list.tourTransferPlanArrAndDepId ?? "", realAdult: String(list.realAdult ?? 0), realChild: String(list.realChild ?? 0), realToodle: String(list.realToodle ?? 0), realInfant: String(list.realInfant ?? 0), realTotal: String(list.realTotal ?? 0), serviceType:"Shop",paxesLists: self.newPaxes))
            }
        }
        else{
            if stepsDetailList.count > 0{
                for index in 0...self.stepsDetailList.count - 1{
                    self.jsonModelList.append(JsonModelList.init(serviceType: self.stepsDetailList[index].serviceType ?? "", realTotal: self.stepsDetailList[index].realTotal ?? "", realAdult: self.stepsDetailList[index].realAdult ?? "", realChild: self.stepsDetailList[index].realChild ?? "", realToodle: self.stepsDetailList[index].realToodle ?? "", realInfant: self.stepsDetailList[index].realInfant ?? "", freeAdult: self.stepsDetailList[index].freeAdult ?? "", freeChild: self.stepsDetailList[index].freeChild ?? "", freeToodle: self.stepsDetailList[index].freeToodle ?? "", freeInfant: self.stepsDetailList[index].freeInfant ?? "", totalAdult: self.stepsDetailList[index].totalAdult ?? "", totalChild: self.stepsDetailList[index].totalChild ?? "", totalToodle: self.stepsDetailList[index].totalToodle ?? "", totalInfant: self.stepsDetailList[index].totalInfant ?? "", realAmount: self.stepsDetailList[index].realAmount ?? "", freeAmount: self.stepsDetailList[index].freeAmount ?? "", freeTotal: self.stepsDetailList[index].freeTotal ?? "", totalAmount: self.stepsDetailList[index].totalAmount ?? "", grandTotal: self.stepsDetailList[index].grandTotal ?? "", action: "1", serviceId: self.stepsDetailList[index].serviceId ?? "", isExtraService: self.stepsDetailList[index].isExtraService ?? "", stepId: self.stepId, ids: self.ids, extraServiceId: self.stepsDetailList[index].extraServiceId ?? "", ID: self.stepsDetailList[index].iD ?? "", tourTransferPlanArrAndDepId: self.stepsDetailList[index].tourTransferPlanArrAndDepId ?? "", companyId: self.stepsDetailList[index].companyId ?? "", sV_CreatedBy: "", id: self.stepsDetailList[index]._id ?? ""))
                    
                }
            }
        }
        
    }

    func getCompanyUsers(){
        var endPoint: ServiceEndPoint?
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            endPoint = .GetCompanyUsers
        case ServiceType.ARR.rawValue:
            endPoint = .GetCompanyUsers_ArrDepH2H
        case ServiceType.DEP.rawValue:
            endPoint = .GetCompanyUsers_ArrDepH2H
        case ServiceType.INT.rawValue:
            endPoint = .GetCompanyUsers_ArrDepH2H
        case ServiceType.SHOP.rawValue:
            break
        default:
            break
        }
        let getCompanyUsersRequestModel = GetCompanyUsersRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: endPoint ?? .GetCompanyUsers, method: .get, parameters: getCompanyUsersRequestModel.requestPathString()) { (response : [GetCompanyUsersResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.pickerList.append(PickerList.init(id: item.id ?? "", name: item.username ?? ""))
                }
                self.pickerView.delegate = self
                self.pickerView.status = true
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
        var endPoint: ServiceEndPoint?
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            endPoint = .IsCompanyUserValid
        case ServiceType.ARR.rawValue:
            endPoint = .IsCompanyUserValid_ArrDepH2H
        case ServiceType.DEP.rawValue:
            endPoint = .IsCompanyUserValid_ArrDepH2H
        case ServiceType.INT.rawValue:
            endPoint = .IsCompanyUserValid_ArrDepH2H
        case ServiceType.SHOP.rawValue:
            endPoint = .IndShopIsCompanyUserValid
        default:
            break
        }
        self.pickerView.delegate = self
        let isCompanyUserValidRequestModel = IsCompanyUserValidRequestModel.init(ids: self.ids, stepId: self.stepId, username: self.pickerView.textFieldCompanyUser.text ?? "", password: self.passwordTextField.text ?? "")
        NetworkManager.sendGetRequestTextResponse(url:NetworkManager.BASEURL, endPoint: endPoint ?? .IsCompanyUserValid, method: .get, parameters: isCompanyUserValidRequestModel.requestPathString()) { (response : String) in
            if response == "true" {
                self.createServiceVoucher()
            }
            else{
                
            }
        }
    }
    
    func createServiceVoucher(){
        var json = ""
        var endPoint: ServiceEndPoint?
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            if supplierType == "2"{
                endPoint = .CreateServiceVoucher_ShopSupplier
                json = jsonModelPaxList[0].toJSONString() ?? ""
            }
            else{
                endPoint = .CreateServiceVoucher
                json = jsonModelList.toJSONString() ?? ""
            }
        case ServiceType.ARR.rawValue:
            if supplierType == "2"{
                endPoint = .CreateServiceVoucher_ArrDepH2H_ShopSupplier
                json = jsonModelPaxList[0].toJSONString() ?? ""
            }
            else{
                endPoint = .CreateServiceVoucher_ArrDepH2H
                json = jsonModelList.toJSONString() ?? ""
            }
        case ServiceType.DEP.rawValue:
            if supplierType == "2"{
                endPoint = .CreateServiceVoucher_ArrDepH2H_ShopSupplier
                json = jsonModelPaxList[0].toJSONString() ?? ""
            }
            else{
                endPoint = .CreateServiceVoucher_ArrDepH2H
                json = jsonModelList.toJSONString() ?? ""
            }
        case ServiceType.INT.rawValue:
            if supplierType == "2"{
                endPoint = .CreateServiceVoucher_ArrDepH2H_ShopSupplier
                json = jsonModelPaxList[0].toJSONString() ?? ""
            }
            else{
                endPoint = .CreateServiceVoucher_ArrDepH2H
                json = jsonModelList.toJSONString() ?? ""
            }
        case ServiceType.SHOP.rawValue:
            endPoint = .CreateServiceVoucher_IndShopSupplier
            json = jsonModelPaxList[0].toJSONString() ?? ""
        default:
            break
        }
        
        let createServiceVoucherRequestModel = CreateServiceVoucherRequestModel.init(ids: self.ids, stepId: self.stepId, action: "1", jsonStr: json)
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: endPoint ?? .CreateServiceVoucher, requestModel: createServiceVoucherRequestModel) { (response : CreateServiceVoucherResponseModel) in
            if response.isSuccesful == true {
                if response.record == 0{
                    UIApplication.getTopViewController()?.showAlertMsg(msg: "Voucher has been created", finished: {
                        self.dismiss(animated: true, completion: nil)
                        self.otiPushViewController(viewController: MainPAgeViewController())
                    })
                }
                else{
                    UIApplication.getTopViewController()?.showAlertMsg(msg: "Created voucher number is " + String(response.record ?? 0), finished: {
                        self.dismiss(animated: true, completion: nil)
                        self.otiPushViewController(viewController: MainPAgeViewController())
                    })
                }
            }
        }
    }
        
    @IBAction func buttonTappedLogin(_ sender: Any) {
        if self.pickerView.textFieldCompanyUser.text != "" && self.passwordTextField.text != ""{
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
        if self.pickerList.count > 0{
            self.username = name
        }
        else{
            self.username = ""
        }
    }
}

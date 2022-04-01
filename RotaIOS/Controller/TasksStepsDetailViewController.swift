//
//  TasksStepsDetailViewController.swift
//  RotaIOS
//
//  Created by odeon on 8.03.2022.
//

import UIKit

class TasksStepsDetailViewController: BaseViewController {
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
    enum PaxType: String{
        case ADL = "ADL"
        case CHD = "CHD"
        case TDL = "TDL"
        case INF = "INF"
    }
    @IBOutlet weak var tableViewTasksStepsDetail: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTasksStepsDetailPaxes: UITableView!
    @IBOutlet weak var tasksPaxesTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewPaxes: UIView!
    @IBOutlet weak var viewLine: UIView!
    public var ids: String = ""
    public var stepId: String = ""
    public var serviceType: Int = 0
    public var isSVCreatedBeforeForShopSupplier: Bool = false
    public var supplierType: String = "0"
    var stepsDetailList: [GetStepDetail] = [] {
        didSet {
            self.tableViewTasksStepsDetail.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksStepsDetail.contentSize.height
        }
    }
    var getStepDetailPaxesList: [GetStepDetailPaxesList] = []
    var stepsDetailPaxesList: [PaxesList] = [] {
        didSet {
            self.tableViewTasksStepsDetailPaxes.reloadData()
            self.tasksPaxesTableViewHeightConstraint.constant = self.tableViewTasksStepsDetailPaxes.contentSize.height
        }
    }
    var paxesLists: [PaxesLists] = [] 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksStepsDetail.delegate = self
        self.tableViewTasksStepsDetail.dataSource = self
        self.tableViewTasksStepsDetail.register(TasksStepsDetailTableViewCell.nib, forCellReuseIdentifier: TasksStepsDetailTableViewCell.identifier)
        self.tableViewTasksStepsDetailPaxes.delegate = self
        self.tableViewTasksStepsDetailPaxes.dataSource = self
        self.tableViewTasksStepsDetailPaxes.register(TasksStepsDetailPaxesTableViewCell.nib, forCellReuseIdentifier: TasksStepsDetailPaxesTableViewCell.identifier)
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            if self.supplierType == "2"{
                self.viewPaxes.isHidden = false
                self.viewLine.isHidden = false
                self.getStepDetail_ShopSupplier()
            }
            else{
                self.viewPaxes.isHidden = true
                self.viewLine.isHidden = true
                self.getStepsDetail()
            }
        case ServiceType.ARR.rawValue:
            if self.supplierType == "2"{
                self.viewPaxes.isHidden = false
                self.viewLine.isHidden = false
                self.getStepDetail_ArrDepH2H_ShopSupplier()
            }
            else{
                self.viewPaxes.isHidden = true
                self.viewLine.isHidden = true
                self.getStepsDetail_ArrDepH2H()
            }
        case ServiceType.DEP.rawValue:
            if self.supplierType == "2"{
                self.viewPaxes.isHidden = false
                self.viewLine.isHidden = false
                self.getStepDetail_ArrDepH2H_ShopSupplier()
            }
            else{
                self.viewPaxes.isHidden = true
                self.viewLine.isHidden = true
                self.getStepsDetail_ArrDepH2H()
            }
        case ServiceType.INT.rawValue:
            if self.supplierType == "2"{
                self.viewPaxes.isHidden = false
                self.viewLine.isHidden = false
                self.getStepDetail_ArrDepH2H_ShopSupplier()
            }
            else{
                self.viewPaxes.isHidden = true
                self.viewLine.isHidden = true
                self.getStepsDetail_ArrDepH2H()
            }
        case ServiceType.SHOP.rawValue:
            self.viewPaxes.isHidden = false
            self.viewLine.isHidden = false
            self.GetStepDetail_IndShopSupplier()
        default:
            break
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tableViewTasksStepsDetail.contentSize.height
        self.tasksPaxesTableViewHeightConstraint.constant = self.tableViewTasksStepsDetailPaxes.contentSize.height
    }
    
    func getStepsDetail(){
        let getStepsDetailRequestModel = GetStepDetailRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetStepDetail, method: .get, parameters: getStepsDetailRequestModel.requestPathString()) { (response : [GetStepDetailResponseModel]) in
            if response.count > 0 {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "Free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                for item in response {
                    self.stepsDetailList.append(GetStepDetail.init(_id: item._id ?? "", ids: item.ids ?? "", stepId: String(item.stepId ?? 0), companyId: String(item.companyId ?? 0), serviceId: String(item.serviceId ?? 0), isExtraService: String(item.isExtraService ?? false), extraServiceId: String(item.extraServiceId ?? 0), tourTransferPlanArrAndDepId: String(item.tourTransferPlanArrAndDepId ?? 0), serviceType: String(item.serviceType ?? ""), realTotal: String(item.realTotal ?? 0), realAdult: String(item.realAdult ?? 0), realChild: String(item.realChild ?? 0), realToodle: String(item.realToodle ?? 0), realInfant: String(item.realInfant ?? 0), freeAdult: String(item.freeAdult ?? 0), freeChild: String(item.freeChild ?? 0), freeToodle: String(item.freeToodle ?? 0), freeInfant: String(item.freeInfant ?? 0), totalAdult: String(item.totalInfant ?? 0), totalChild: String(item.totalChild ?? 0), totalToodle: String(item.totalToodle ?? 0), totalInfant: String(item.totalInfant ?? 0), realAmount: String(item.realAmount ?? 0), freeAmount: String(item.freeAmount ?? 0), freeTotal: String(item.freeTotal ?? 0), totalAmount: String(item.totalAmount ?? 0), grandTotal: String(item.grandTotal ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getStepDetail_ShopSupplier(){
        let getStepDetail_ShopSupplierRequestModel = GetStepDetail_ShopSupplierRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetStepDetail_ShopSupplier, method: .get, parameters: getStepDetail_ShopSupplierRequestModel.requestPathString()) { (response : GetStepDetail_ShopSupplierResponseModel) in
            if response._id != "" {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "Free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                self.paxesLists.append(PaxesLists.init(_id: "", oprShopPaxesID: "", oprTouristID: "", paxNameSurname: "Name Surname", operatorId: "", operatorName: "Operator", marketId: "", marketName: "Market", paxType: "Age Type", unselectable: "", isGoShow: "", userSelected: "", check: false))
                self.stepsDetailList.append(GetStepDetail.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: String(response.stepId ?? 0), companyId: String(response.companyId ?? 0), serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", serviceType: "Shop", realTotal: String(response.realTotal ?? 0), realAdult: String(response.realAdult ?? 0), realChild: String(response.realChild ?? 0), realToodle: String(response.realToodle ?? 0), realInfant: String(response.realInfant ?? 0), freeAdult: "", freeChild: "", freeToodle: "", freeInfant: "", totalAdult: "", totalChild: "", totalToodle: "", totalInfant: "", realAmount: "", freeAmount: "", freeTotal: "", totalAmount: "", grandTotal: "", iD: "", action: ""))
                self.stepsDetailPaxesList = response.paxesList ?? []
                for item in self.stepsDetailPaxesList {
                    self.paxesLists.append(PaxesLists.init(_id: item._id ?? "", oprShopPaxesID: String(item.oprShopPaxesID ?? 0) , oprTouristID: item.oprTouristID ?? "", paxNameSurname: item.paxNameSurname ?? "", operatorId: String(item.operatorId ?? 0) , operatorName: item.operatorName ?? "", marketId: String(item.marketId ?? 0) , marketName: item.marketName ?? "", paxType: item.paxType ?? "", unselectable: String(item.unselectable ?? false) , isGoShow: String(item.isGoShow ?? false), userSelected: String(item.userSelected ?? false), check: item.userSelected ?? false))
                }
                self.getStepDetailPaxesList.append(GetStepDetailPaxesList.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: response.stepId ?? 0, companyId: response.companyId ?? 0, tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", realAdult: response.realAdult ?? 0, realChild: response.realChild ?? 0, realToodle: response.realToodle ?? 0, realInfant: response.realInfant ?? 0, realTotal: response.realTotal ?? 0, paxesLists: self.paxesLists))
                self.tableViewTasksStepsDetailPaxes.reloadData()
            }else {
               print("error")
            }
        }
    }
    
    func getStepsDetail_ArrDepH2H(){
        let getStepDetail_ArrDepH2HRequestModel = GetStepDetail_ArrDepH2HRequestModel.init(tourTransferPlanArrAndDepId: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetStepDetail_ArrDepH2H, method: .get, parameters: getStepDetail_ArrDepH2HRequestModel.requestPathString()) { (response : [GetStepDetail_ArrDepH2HResponseModel]) in
            if response.count > 0 {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "Free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                for item in response {
                    self.stepsDetailList.append(GetStepDetail.init(_id: item._id ?? "", ids: item.ids ?? "", stepId: String(item.stepId ?? 0), companyId: String(item.companyId ?? 0), serviceId: String(item.serviceId ?? 0), isExtraService: String(item.isExtraService ?? false), extraServiceId: String(item.extraServiceId ?? 0), tourTransferPlanArrAndDepId: String(item.tourTransferPlanArrAndDepId ?? 0), serviceType: String(item.serviceType ?? ""), realTotal: String(item.realTotal ?? 0), realAdult: String(item.realAdult ?? 0), realChild: String(item.realChild ?? 0), realToodle: String(item.realToodle ?? 0), realInfant: String(item.realInfant ?? 0), freeAdult: String(item.freeAdult ?? 0), freeChild: String(item.freeChild ?? 0), freeToodle: String(item.freeToodle ?? 0), freeInfant: String(item.freeInfant ?? 0), totalAdult: String(item.totalInfant ?? 0), totalChild: String(item.totalChild ?? 0), totalToodle: String(item.totalToodle ?? 0), totalInfant: String(item.totalInfant ?? 0), realAmount: String(item.realAmount ?? 0), freeAmount: String(item.freeAmount ?? 0), freeTotal: String(item.freeTotal ?? 0), totalAmount: String(item.totalAmount ?? 0), grandTotal: String(item.grandTotal ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getStepDetail_ArrDepH2H_ShopSupplier(){
        let getStepDetail_ArrDepH2H_ShopSupplierRequestModel = GetStepDetail_ArrDepH2H_ShopSupplierRequestModel.init(tourTransferPlanArrAndDepId: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetStepDetail_ArrDepH2H_ShopSupplier, method: .get, parameters: getStepDetail_ArrDepH2H_ShopSupplierRequestModel.requestPathString()) { (response : GetStepDetail_ArrDepH2H_ShopSupplierResponseModel) in
            if response._id != "" {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "Free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                self.paxesLists.append(PaxesLists.init(_id: "", oprShopPaxesID: "", oprTouristID: "", paxNameSurname: "Name Surname", operatorId: "", operatorName: "Operator", marketId: "", marketName: "Market", paxType: "Age Type", unselectable: "", isGoShow: "", userSelected: "", check: false))
                self.stepsDetailList.append(GetStepDetail.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: String(response.stepId ?? 0), companyId: String(response.companyId ?? 0), serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", serviceType: "Shop", realTotal: String(response.realTotal ?? 0), realAdult: String(response.realAdult ?? 0), realChild: String(response.realChild ?? 0), realToodle: String(response.realToodle ?? 0), realInfant: String(response.realInfant ?? 0), freeAdult: "", freeChild: "", freeToodle: "", freeInfant: "", totalAdult: "", totalChild: "", totalToodle: "", totalInfant: "", realAmount: "", freeAmount: "", freeTotal: "", totalAmount: "", grandTotal: "", iD: "", action: ""))
                self.stepsDetailPaxesList = response.paxesList ?? []
                for item in self.stepsDetailPaxesList {
                    self.paxesLists.append(PaxesLists.init(_id: item._id ?? "", oprShopPaxesID: String(item.oprShopPaxesID ?? 0) , oprTouristID: item.oprTouristID ?? "", paxNameSurname: item.paxNameSurname ?? "", operatorId: String(item.operatorId ?? 0) , operatorName: item.operatorName ?? "", marketId: String(item.marketId ?? 0) , marketName: item.marketName ?? "", paxType: item.paxType ?? "", unselectable: String(item.unselectable ?? false) , isGoShow: String(item.isGoShow ?? false), userSelected: String(item.userSelected ?? false), check: item.userSelected ?? false))
                }
                self.getStepDetailPaxesList.append(GetStepDetailPaxesList.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: response.stepId ?? 0, companyId: response.companyId ?? 0, tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", realAdult: response.realAdult ?? 0, realChild: response.realChild ?? 0, realToodle: response.realToodle ?? 0, realInfant: response.realInfant ?? 0, realTotal: response.realTotal ?? 0, paxesLists: self.paxesLists))
                self.tableViewTasksStepsDetailPaxes.reloadData()
            }else {
               print("error")
            }
        }
    }
        
    func GetStepDetail_IndShopSupplier(){
        let getStepDetail_IndShopSupplierRequestModel = GetStepDetail_IndShopSupplierRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetStepDetail_IndShopSupplier, method: .get, parameters: getStepDetail_IndShopSupplierRequestModel.requestPathString()) { (response : GetStepDetail_IndShopSupplierResponseModel) in
            if response._id != "" {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "Free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                self.paxesLists.append(PaxesLists.init(_id: "", oprShopPaxesID: "", oprTouristID: "", paxNameSurname: "Name Surname", operatorId: "", operatorName: "Operator", marketId: "", marketName: "Market", paxType: "Age Type", unselectable: "", isGoShow: "", userSelected: "", check: false))
                self.stepsDetailList.append(GetStepDetail.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: String(response.stepId ?? 0), companyId: String(response.companyId ?? 0), serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", serviceType: "Shop", realTotal: String(response.realTotal ?? 0), realAdult: String(response.realAdult ?? 0), realChild: String(response.realChild ?? 0), realToodle: String(response.realToodle ?? 0), realInfant: String(response.realInfant ?? 0), freeAdult: "", freeChild: "", freeToodle: "", freeInfant: "", totalAdult: "", totalChild: "", totalToodle: "", totalInfant: "", realAmount: "", freeAmount: "", freeTotal: "", totalAmount: "", grandTotal: "", iD: "", action: ""))
                self.stepsDetailPaxesList = response.paxesList ?? []
                for item in self.stepsDetailPaxesList {
                    self.paxesLists.append(PaxesLists.init(_id: item._id ?? "", oprShopPaxesID: String(item.oprShopPaxesID ?? 0) , oprTouristID: item.oprTouristID ?? "", paxNameSurname: item.paxNameSurname ?? "", operatorId: String(item.operatorId ?? 0) , operatorName: item.operatorName ?? "", marketId: String(item.marketId ?? 0) , marketName: item.marketName ?? "", paxType: item.paxType ?? "", unselectable: String(item.unselectable ?? false) , isGoShow: String(item.isGoShow ?? false), userSelected: String(item.userSelected ?? false), check: item.userSelected ?? false))
                }
                self.getStepDetailPaxesList.append(GetStepDetailPaxesList.init(_id: response._id ?? "", ids: response.ids ?? "", stepId: response.stepId ?? 0, companyId: response.companyId ?? 0, tourTransferPlanArrAndDepId: response.tourTransferPlanArrAndDepId ?? "", realAdult: response.realAdult ?? 0, realChild: response.realChild ?? 0, realToodle: response.realToodle ?? 0, realInfant: response.realInfant ?? 0, realTotal: response.realTotal ?? 0, paxesLists: self.paxesLists))
                self.tableViewTasksStepsDetailPaxes.reloadData()
            }else {
               print("error")
            }
        }
    }
           
    @IBAction func buttonTappedSendOffice(_ sender: Any) {
        let topVC = UIApplication.getTopViewController()
        let viewController = TasksCreateServiceVoucherViewController()
        viewController.serviceType = self.serviceType
        if self.supplierType == "2"{
            viewController.stepsDetailPaxesList = self.getStepDetailPaxesList
            viewController.paxes = self.stepsDetailPaxesList
        }
        else{
            viewController.action = self.stepsDetailList.count > 0 ? (self.stepsDetailList[0].action ?? "") : ""
            var list : [GetStepDetail] = []
            if self.stepsDetailList.count > 0 {
                for index in 1...self.stepsDetailList.count - 1 {
                    let indexPath = IndexPath(row: index, section: 0)
                    if let cell = self.tableViewTasksStepsDetail.cellForRow(at: indexPath) as? TasksStepsDetailTableViewCell {
                    list.append(GetStepDetail.init(_id: self.stepsDetailList[index]._id ?? "", ids: self.stepsDetailList[index].ids ?? "", stepId: self.stepsDetailList[index].stepId ?? "", companyId: self.stepsDetailList[index].companyId ?? "", serviceId: self.stepsDetailList[index].serviceId ?? "", isExtraService: self.stepsDetailList[index].isExtraService ?? "", extraServiceId: self.stepsDetailList[index].extraServiceId ?? "", tourTransferPlanArrAndDepId : self.stepsDetailList[index].tourTransferPlanArrAndDepId ?? "", serviceType: self.stepsDetailList[index].serviceType ?? "", realTotal: cell.textFieldRealTotal.text ?? "", realAdult: cell.textFieldRealAdult.text ?? "", realChild: cell.textFieldRealChild.text ?? "", realToodle: cell.textFieldRealToodle.text ?? "", realInfant: cell.textFieldRealInfant.text ?? "", freeAdult: cell.textFieldFreeAdult.text ?? "", freeChild: cell.textFieldFreeChild.text ?? "", freeToodle: cell.textFieldFreeToodle.text ?? "", freeInfant: cell.textFieldFreeInfant.text ?? "", totalAdult: cell.textFieldTotalAdult.text ?? "", totalChild: cell.textFieldTotalChild.text ?? "", totalToodle: cell.textFieldTotalToodle.text ?? "", totalInfant: cell.textFieldTotalInfant.text ?? "", realAmount: cell.textFieldRealAmount.text ?? "", freeAmount: cell.textFieldFreeAmount.text ?? "", freeTotal: cell.textFieldFreeTotal.text ?? "", totalAmount: cell.textFieldTotalAmount.text ?? "", grandTotal: cell.textFieldGrandTotal.text ?? "", iD: self.stepsDetailList[index].iD ?? "", action: self.stepsDetailList[index].action ?? ""))
                    }
                }
                viewController.stepsDetailList = list
            }
            else{
                viewController.stepsDetailList = []
            }
        }
        
        viewController.ids = ids
        viewController.stepId = stepId
        viewController.supplierType = self.supplierType
        topVC?.otiPushViewController(viewController: viewController)
    }
}

extension TasksStepsDetailViewController : TasksStepsDetailPaxesTableViewCellDelegate{
    func updatedList(index: Int, check: Bool) {
        self.paxesLists[index].check = check
        if check == true{
            switch self.paxesLists[index].paxType {
            case PaxType.ADL.rawValue:
                self.stepsDetailList[1].realAdult = String((Int(self.stepsDetailList[1].realAdult ?? "0") ?? 0) + 1)
                self.getStepDetailPaxesList[0].realAdult = Int(self.stepsDetailList[1].realAdult ?? "0")
            case PaxType.CHD.rawValue:
                self.stepsDetailList[1].realChild = String((Int(self.stepsDetailList[1].realChild ?? "0") ?? 0) + 1)
                self.getStepDetailPaxesList[0].realChild = Int(self.stepsDetailList[1].realChild ?? "0")
            case PaxType.TDL.rawValue:
                self.stepsDetailList[1].realToodle = String((Int(self.stepsDetailList[1].realToodle ?? "0") ?? 0) + 1)
                self.getStepDetailPaxesList[0].realToodle = Int(self.stepsDetailList[1].realToodle ?? "0")
            case PaxType.INF.rawValue:
                self.stepsDetailList[1].realInfant = String((Int(self.stepsDetailList[1].realInfant ?? "0") ?? 0) + 1)
                self.getStepDetailPaxesList[0].realInfant = Int(self.stepsDetailList[1].realInfant ?? "0")
            default:
                break
            }
            self.stepsDetailList[1].realTotal = String((Int(self.stepsDetailList[1].realTotal ?? "0") ?? 0) + 1)
            self.getStepDetailPaxesList[0].realTotal = Int(self.stepsDetailList[1].realTotal ?? "0")
        }
        else{
            switch self.paxesLists[index].paxType {
            case PaxType.ADL.rawValue:
                self.stepsDetailList[1].realAdult = (self.stepsDetailList[1].realAdult != "0") ? String((Int(self.stepsDetailList[1].realAdult ?? "0") ?? 0) - 1) : "0"
                self.getStepDetailPaxesList[0].realAdult = Int(self.stepsDetailList[1].realAdult ?? "0")
            case PaxType.CHD.rawValue:
                self.stepsDetailList[1].realChild = (self.stepsDetailList[1].realChild != "0") ? String((Int(self.stepsDetailList[1].realChild ?? "0") ?? 0) - 1) : "0"
                self.getStepDetailPaxesList[0].realChild = Int(self.stepsDetailList[1].realChild ?? "0")
            case PaxType.TDL.rawValue:
                self.stepsDetailList[1].realToodle = (self.stepsDetailList[1].realToodle != "0") ? String((Int(self.stepsDetailList[1].realToodle ?? "0") ?? 0) - 1) : "0"
                self.getStepDetailPaxesList[0].realToodle = Int(self.stepsDetailList[1].realToodle ?? "0")
            case PaxType.INF.rawValue:
                self.stepsDetailList[1].realInfant = (self.stepsDetailList[1].realInfant != "0") ? String((Int(self.stepsDetailList[1].realInfant ?? "0") ?? 0) - 1) : "0"
                self.getStepDetailPaxesList[0].realInfant = Int(self.stepsDetailList[1].realInfant ?? "0")
            default:
                break
            }
            self.stepsDetailList[1].realTotal = (self.stepsDetailList[1].realTotal != "0") ? String((Int(self.stepsDetailList[1].realTotal ?? "0") ?? 0) - 1) : "0"
            self.getStepDetailPaxesList[0].realTotal = Int(self.stepsDetailList[1].realTotal ?? "0")
        }
        self.tableViewTasksStepsDetail.reloadData()
    }
}

extension TasksStepsDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableViewTasksStepsDetail:
            return self.stepsDetailList.count
        case self.tableViewTasksStepsDetailPaxes:
            return self.paxesLists.count
        default:
            return self.stepsDetailList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch tableView {
        case self.tableViewTasksStepsDetail:
            let cell = tableView.dequeueReusableCell(withIdentifier: TasksStepsDetailTableViewCell.identifier, for: indexPath) as! TasksStepsDetailTableViewCell
            
            if indexPath.row == 0{
                cell.setTextColor(color: .medGrayColor)
            }
            else{
                cell.setTextColor(color: .white)
            }
            
            if self.supplierType == "2"{
                cell.isEditingTextField(status: false)
            }
            else{
                cell.isEditingTextField(status: true)
            }
            cell.setInfo(type: self.stepsDetailList[indexPath.row].serviceType ?? "", realTotal: self.stepsDetailList[indexPath.row].realTotal ?? "", realAdult: self.stepsDetailList[indexPath.row].realAdult ?? "", realChild: self.stepsDetailList[indexPath.row].realChild ?? "", realToodle: self.stepsDetailList[indexPath.row].realToodle ?? "", realInfant: self.stepsDetailList[indexPath.row].realInfant ?? "", freeAdult: self.stepsDetailList[indexPath.row].freeAdult ?? "", freeChild: self.stepsDetailList[indexPath.row].freeChild ?? "", freeToodle: self.stepsDetailList[indexPath.row].freeToodle ?? "", freeInfant: self.stepsDetailList[indexPath.row].freeInfant ?? "", totalAdult: self.stepsDetailList[indexPath.row].totalAdult ?? "", totalChild: self.stepsDetailList[indexPath.row].totalChild ?? "", totalToodle: self.stepsDetailList[indexPath.row].totalToodle ?? "", totalInfant: self.stepsDetailList[indexPath.row].totalInfant ?? "", realAmount: self.stepsDetailList[indexPath.row].realAmount ?? "", freeAmount: self.stepsDetailList[indexPath.row].freeAmount ?? "", freeTotal: self.stepsDetailList[indexPath.row].freeTotal ?? "", totalAmount:  self.stepsDetailList[indexPath.row].totalAmount ?? "", grandTotal: self.stepsDetailList[indexPath.row].grandTotal ?? "")
            return cell
        case self.tableViewTasksStepsDetailPaxes:
            let cell = tableView.dequeueReusableCell(withIdentifier: TasksStepsDetailPaxesTableViewCell.identifier, for: indexPath) as! TasksStepsDetailPaxesTableViewCell
            
            if indexPath.row == 0{
                cell.setTextColor(color: .medGrayColor)
            }
            else{
                cell.setTextColor(color: .white)
            }
            
            if indexPath.row == 0{
                cell.imageViewCheck.isHidden = true
                cell.imageViewCheck.isUserInteractionEnabled = false
            }
            else{
                cell.imageViewCheck.isHidden = false
                cell.imageViewCheck.isUserInteractionEnabled = true
            }
            cell.delegate = self
            cell.setInfo(index: indexPath.row, nameSurname: self.paxesLists[indexPath.row].paxNameSurname ?? "", ageType: self.paxesLists[indexPath.row].paxType ?? "", operatorName: self.paxesLists[indexPath.row].operatorName ?? "", market: self.paxesLists[indexPath.row].marketName ?? "", check: self.paxesLists[indexPath.row].check ?? false)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TasksStepsDetailTableViewCell.identifier, for: indexPath) as! TasksStepsDetailTableViewCell
            
            if indexPath.row == 0{
                cell.setTextColor(color: .medGrayColor)
            }
            else{
                cell.setTextColor(color: .white)
            }
            cell.setInfo(type: self.stepsDetailList[indexPath.row].serviceType ?? "", realTotal: self.stepsDetailList[indexPath.row].realTotal ?? "", realAdult: self.stepsDetailList[indexPath.row].realAdult ?? "", realChild: self.stepsDetailList[indexPath.row].realChild ?? "", realToodle: self.stepsDetailList[indexPath.row].realToodle ?? "", realInfant: self.stepsDetailList[indexPath.row].realInfant ?? "", freeAdult: self.stepsDetailList[indexPath.row].freeAdult ?? "", freeChild: self.stepsDetailList[indexPath.row].freeChild ?? "", freeToodle: self.stepsDetailList[indexPath.row].freeToodle ?? "", freeInfant: self.stepsDetailList[indexPath.row].freeInfant ?? "", totalAdult: self.stepsDetailList[indexPath.row].totalAdult ?? "", totalChild: self.stepsDetailList[indexPath.row].totalChild ?? "", totalToodle: self.stepsDetailList[indexPath.row].totalToodle ?? "", totalInfant: self.stepsDetailList[indexPath.row].totalInfant ?? "", realAmount: self.stepsDetailList[indexPath.row].realAmount ?? "", freeAmount: self.stepsDetailList[indexPath.row].freeAmount ?? "", freeTotal: self.stepsDetailList[indexPath.row].freeTotal ?? "", totalAmount:  self.stepsDetailList[indexPath.row].totalAmount ?? "", grandTotal: self.stepsDetailList[indexPath.row].grandTotal ?? "")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

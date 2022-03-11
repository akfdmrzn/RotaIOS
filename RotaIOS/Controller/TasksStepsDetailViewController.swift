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
    @IBOutlet weak var tableViewTasksCreateServiceVoucher: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    public var ids: String = ""
    public var stepId: String = ""
    public var serviceType: Int = 0
    var stepsDetailList: [GetStepDetail] = [] {
        didSet {
            self.tableViewTasksCreateServiceVoucher.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksCreateServiceVoucher.contentSize.height
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksCreateServiceVoucher.delegate = self
        self.tableViewTasksCreateServiceVoucher.dataSource = self
        self.tableViewTasksCreateServiceVoucher.register(TasksStepsDetailTableViewCell.nib, forCellReuseIdentifier: TasksStepsDetailTableViewCell.identifier)
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            self.getStepsDetail()
        case ServiceType.ARR.rawValue:
            self.getStepsDetail_ArrDepH2H()
        case ServiceType.DEP.rawValue:
            self.getStepsDetail_ArrDepH2H()
        case ServiceType.INT.rawValue:
            self.getStepsDetail_ArrDepH2H()
        default:
            break
        }
    }
    
    func getStepsDetail(){
        let getStepsDetailRequestModel = GetStepDetailRequestModel.init(ids: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetStepDetail, method: .get, parameters: getStepsDetailRequestModel.requestPathString()) { (response : [GetStepDetailResponseModel]) in
            if response.count > 0 {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                for item in response {
                    self.stepsDetailList.append(GetStepDetail.init(_id: item._id ?? "", ids: item.ids ?? "", stepId: String(item.stepId ?? 0), companyId: String(item.companyId ?? 0), serviceId: String(item.serviceId ?? 0), isExtraService: String(item.isExtraService ?? false), extraServiceId: String(item.extraServiceId ?? 0), tourTransferPlanArrAndDepId: String(item.tourTransferPlanArrAndDepId ?? 0), serviceType: String(item.serviceType ?? ""), realTotal: String(item.realTotal ?? 0), realAdult: String(item.realAdult ?? 0), realChild: String(item.realChild ?? 0), realToodle: String(item.realToodle ?? 0), realInfant: String(item.realInfant ?? 0), freeAdult: String(item.freeAdult ?? 0), freeChild: String(item.freeChild ?? 0), freeToodle: String(item.freeToodle ?? 0), freeInfant: String(item.freeInfant ?? 0), totalAdult: String(item.totalInfant ?? 0), totalChild: String(item.totalChild ?? 0), totalToodle: String(item.totalToodle ?? 0), totalInfant: String(item.totalInfant ?? 0), realAmount: String(item.realAmount ?? 0), freeAmount: String(item.freeAmount ?? 0), freeTotal: String(item.freeTotal ?? 0), totalAmount: String(item.totalAmount ?? 0), grandTotal: String(item.grandTotal ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                        self.view.layoutIfNeeded()
                        self.viewWillLayoutSubviews()
                }
            }else {
               print("error")
            }
        }
    }
    
    func getStepsDetail_ArrDepH2H(){
        let getStepDetail_ArrDepH2HRequestModel = GetStepDetail_ArrDepH2HRequestModel.init(tourTransferPlanArrAndDepId: self.ids, stepId: self.stepId)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetStepDetail_ArrDepH2H, method: .get, parameters: getStepDetail_ArrDepH2HRequestModel.requestPathString()) { (response : [GetStepDetail_ArrDepH2HResponseModel]) in
            if response.count > 0 {
                self.stepsDetailList.append(GetStepDetail.init(_id: "", ids: "", stepId: "", companyId: "", serviceId: "", isExtraService: "", extraServiceId: "", tourTransferPlanArrAndDepId: "", serviceType: "Type", realTotal: "Real Total", realAdult: "Real Adult", realChild: "Real Child", realToodle: "Real Toodle", realInfant: "Real Infant", freeAdult: "free Adult", freeChild: "Free Child", freeToodle: "Free Toodle", freeInfant: "Free Infant", totalAdult: "Total Adult", totalChild: "Total Child", totalToodle: "Total Toodle", totalInfant: "Total Infant", realAmount: "Real Amount", freeAmount: "Free Amount", freeTotal: "Free Total", totalAmount: "Total Amount", grandTotal: "Grand Total", iD: "", action: ""))
                for item in response {
                    self.stepsDetailList.append(GetStepDetail.init(_id: item._id ?? "", ids: item.ids ?? "", stepId: String(item.stepId ?? 0), companyId: String(item.companyId ?? 0), serviceId: String(item.serviceId ?? 0), isExtraService: String(item.isExtraService ?? false), extraServiceId: String(item.extraServiceId ?? 0), tourTransferPlanArrAndDepId: String(item.tourTransferPlanArrAndDepId ?? 0), serviceType: String(item.serviceType ?? ""), realTotal: String(item.realTotal ?? 0), realAdult: String(item.realAdult ?? 0), realChild: String(item.realChild ?? 0), realToodle: String(item.realToodle ?? 0), realInfant: String(item.realInfant ?? 0), freeAdult: String(item.freeAdult ?? 0), freeChild: String(item.freeChild ?? 0), freeToodle: String(item.freeToodle ?? 0), freeInfant: String(item.freeInfant ?? 0), totalAdult: String(item.totalInfant ?? 0), totalChild: String(item.totalChild ?? 0), totalToodle: String(item.totalToodle ?? 0), totalInfant: String(item.totalInfant ?? 0), realAmount: String(item.realAmount ?? 0), freeAmount: String(item.freeAmount ?? 0), freeTotal: String(item.freeTotal ?? 0), totalAmount: String(item.totalAmount ?? 0), grandTotal: String(item.grandTotal ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                        self.view.layoutIfNeeded()
                        self.viewWillLayoutSubviews()
                }
            }else {
               print("error")
            }
        }
    }
    
    @IBAction func buttonTappedSendOffice(_ sender: Any) {
        let topVC = UIApplication.getTopViewController()
        let viewController = TasksCreateServiceVoucherViewController()
        viewController.action = self.stepsDetailList.count > 0 ? (self.stepsDetailList[0].action ?? "") : ""
        viewController.stepsDetailList = self.stepsDetailList.count > 0 ? (self.stepsDetailList ) : []
        topVC?.otiPushViewController(viewController: viewController)
    }
}

extension TasksStepsDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepsDetailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksStepsDetailTableViewCell.identifier, for: indexPath) as! TasksStepsDetailTableViewCell
        
        if indexPath.row == 0{
            cell.setTextColor(color: .medGrayColor)
        }
        else{
            cell.setTextColor(color: .white)
        }
        cell.setInfo(labelType: self.stepsDetailList[indexPath.row].serviceType ?? "", realTotal: self.stepsDetailList[indexPath.row].realTotal ?? "", realAdult: self.stepsDetailList[indexPath.row].realAdult ?? "", realChild: self.stepsDetailList[indexPath.row].realChild ?? "", realToodle: self.stepsDetailList[indexPath.row].realToodle ?? "", realInfant: self.stepsDetailList[indexPath.row].realInfant ?? "", freeAdult: self.stepsDetailList[indexPath.row].freeAdult ?? "", freeChild: self.stepsDetailList[indexPath.row].freeChild ?? "", freeToodle: self.stepsDetailList[indexPath.row].freeToodle ?? "", freeInfant: self.stepsDetailList[indexPath.row].freeInfant ?? "", totalAdult: self.stepsDetailList[indexPath.row].totalAdult ?? "", totalChild: self.stepsDetailList[indexPath.row].totalChild ?? "", totalToodle: self.stepsDetailList[indexPath.row].totalToodle ?? "", totalInfant: self.stepsDetailList[indexPath.row].totalInfant ?? "", realAmount: self.stepsDetailList[indexPath.row].realAmount ?? "", freeAmount: self.stepsDetailList[indexPath.row].freeAmount ?? "", freeTotal: self.stepsDetailList[indexPath.row].freeTotal ?? "", totalAmount:  self.stepsDetailList[indexPath.row].totalAmount ?? "", grandTotal: self.stepsDetailList[indexPath.row].grandTotal ?? "")
        return cell
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

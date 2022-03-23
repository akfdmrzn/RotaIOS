//
//  TasksStepsViewController.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import UIKit

class TasksStepsViewController: BaseViewController {
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
    @IBOutlet weak var tableViewTasksSteps: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    public var ids: String = ""
    public var serviceType: Int = 0
    public var indShopVoucherNo: String = ""
    public var isSVCreatedBeforeForShopSupplier: Bool = false
    public var supplierType: String = "0"
    var stepsList: [StepsList] = [] {
        didSet {
            self.tableViewTasksSteps.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksSteps.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksSteps.delegate = self
        self.tableViewTasksSteps.dataSource = self
        self.tableViewTasksSteps.register(TasksStepsTableViewCell.nib, forCellReuseIdentifier: TasksStepsTableViewCell.identifier)
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            self.getSteps()
        case ServiceType.ARR.rawValue:
            self.getSteps_ArrDepH2H()
        case ServiceType.DEP.rawValue:
            self.getSteps_ArrDepH2H()
        case ServiceType.INT.rawValue:
            self.getSteps_ArrDepH2H()
        case ServiceType.SHOP.rawValue:
            self.getStepsForIndShop()
        default:
            break
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tableViewTasksSteps.contentSize.height
    }
    
    func getSteps(){
        let getStepsRequestModel = GetStepsRequestModel.init(ids: self.ids)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetSteps, method: .get, parameters: getStepsRequestModel.requestPathString()) { (response : [GetStepsResponseModel]) in
            if response.count > 0 {
                self.stepsList.append(StepsList.init(_id: "", stepId: "", ids: "", companyId: "", stepName: "Step", serviceType: "Service Type", supplierName: "Supplier Name", realPax: "Real Pax", sVPax: "SV Pax", supplierType: "", isSVCreatedBeforeForShopSupplier: "false", realTotalPax: "", realAdultPax: "", realChildPax: "", realInfantPax: "", sVTotalPax: "", sVAdultPax: "", sVChildPax: "", sVInfantPax: "", iD: "", action: ""))
                for item in response {
                    self.stepsList.append(StepsList.init(_id: item._id ?? "", stepId: String(item.stepId ?? 0), ids: item.ids ?? "", companyId: String(item.companyId ?? 0), stepName: item.stepName ?? "", serviceType: item.serviceType ?? "", supplierName: item.supplierName ?? "", realPax: item.realPax ?? "", sVPax: item.sVPax ?? "", supplierType: String(item.supplierType ?? 0), isSVCreatedBeforeForShopSupplier: String(item.isSVCreatedBeforeForShopSupplier ?? false), realTotalPax: String(item.realTotalPax ?? 0), realAdultPax: String(item.realAdultPax ?? 0), realChildPax: String(item.realChildPax ?? 0), realInfantPax: String(item.realInfantPax ?? 0), sVTotalPax: String(item.sVTotalPax ?? 0), sVAdultPax: String(item.sVAdultPax ?? 0), sVChildPax: String(item.sVChildPax ?? 0), sVInfantPax: String(item.sVInfantPax ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getSteps_ArrDepH2H(){
        let getSteps_ArrDepH2HRequestModel = GetSteps_ArrDepH2HRequestModel.init(tourTransferPlanArrAndDepId: self.ids)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetSteps_ArrDepH2H, method: .get, parameters: getSteps_ArrDepH2HRequestModel.requestPathString()) { (response : [GetSteps_ArrDepH2HResponseModel]) in
            if response.count > 0 {
                self.stepsList.append(StepsList.init(_id: "", stepId: "", ids: "", companyId: "", stepName: "Step", serviceType: "Service Type", supplierName: "Supplier Name", realPax: "Real Pax", sVPax: "SV Pax", supplierType: "", isSVCreatedBeforeForShopSupplier: "false", realTotalPax: "", realAdultPax: "", realChildPax: "", realInfantPax: "", sVTotalPax: "", sVAdultPax: "", sVChildPax: "", sVInfantPax: "", iD: "", action: ""))
                for item in response {
                    self.stepsList.append(StepsList.init(_id: item._id ?? "", stepId: String(item.stepId ?? 0), ids: item.ids ?? "", companyId: String(item.companyId ?? 0), stepName: item.stepName ?? "", serviceType: item.serviceType ?? "", supplierName: item.supplierName ?? "", realPax: item.realPax ?? "", sVPax: item.sVPax ?? "", supplierType: String(item.supplierType ?? 0), isSVCreatedBeforeForShopSupplier: String(item.isSVCreatedBeforeForShopSupplier ?? false), realTotalPax: String(item.realTotalPax ?? 0), realAdultPax: String(item.realAdultPax ?? 0), realChildPax: String(item.realChildPax ?? 0), realInfantPax: String(item.realInfantPax ?? 0), sVTotalPax: String(item.sVTotalPax ?? 0), sVAdultPax: String(item.sVAdultPax ?? 0), sVChildPax: String(item.sVChildPax ?? 0), sVInfantPax: String(item.sVInfantPax ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getStepsForIndShop(){
        let getStepsForIndShopRequestModel = GetStepsForIndShopRequestModel.init(ids: self.ids, indShopVoucherNo: self.indShopVoucherNo)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetStepsForIndShop, method: .get, parameters: getStepsForIndShopRequestModel.requestPathString()) { (response : [GetStepsForIndShopResponseModel]) in
            if response.count > 0 {
                self.stepsList.append(StepsList.init(_id: "", stepId: "", ids: "", companyId: "", stepName: "Step", serviceType: "Service Type", supplierName: "Supplier Name", realPax: "Real Pax", sVPax: "SV Pax", supplierType: "", isSVCreatedBeforeForShopSupplier: "false", realTotalPax: "", realAdultPax: "", realChildPax: "", realInfantPax: "", sVTotalPax: "", sVAdultPax: "", sVChildPax: "", sVInfantPax: "", iD: "", action: ""))
                for item in response {
                    self.stepsList.append(StepsList.init(_id: item._id ?? "", stepId: String(item.stepId ?? 0), ids: item.ids ?? "", companyId: String(item.companyId ?? 0), stepName: item.stepName ?? "", serviceType: item.serviceType ?? "", supplierName: item.supplierName ?? "", realPax: item.realPax ?? "", sVPax: item.sVPax ?? "", supplierType: String(item.supplierType ?? 0), isSVCreatedBeforeForShopSupplier: String(item.isSVCreatedBeforeForShopSupplier ?? false), realTotalPax: String(item.realTotalPax ?? 0), realAdultPax: String(item.realAdultPax ?? 0), realChildPax: String(item.realChildPax ?? 0), realInfantPax: String(item.realInfantPax ?? 0), sVTotalPax: String(item.sVTotalPax ?? 0), sVAdultPax: String(item.sVAdultPax ?? 0), sVChildPax: String(item.sVChildPax ?? 0), sVInfantPax: String(item.sVInfantPax ?? 0), iD: String(item.iD ?? 0), action: String(item.action ?? 0)))
                }
            }else {
               print("error")
            }
        }
    }
}

extension TasksStepsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksStepsTableViewCell.identifier, for: indexPath) as! TasksStepsTableViewCell
        if indexPath.row == 0{
            cell.setColor(color: .medGrayColor)
        }
        else{
            cell.setColor(color: .white)
        }
        cell.setInfo(stepName: self.stepsList[indexPath.row].stepName ?? "", serviceType: self.stepsList[indexPath.row].serviceType ?? "", supplierName: self.stepsList[indexPath.row].supplierName ?? "", realPax: self.stepsList[indexPath.row].realPax ?? "", sVPax: self.stepsList[indexPath.row].sVPax ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            if !self.isSVCreatedBeforeForShopSupplier{
                let topVC = UIApplication.getTopViewController()
                let viewController = TasksStepsDetailViewController()
                viewController.ids = ids
                viewController.stepId = self.stepsList[indexPath.row].stepId ?? ""
                viewController.serviceType = serviceType
                viewController.supplierType = self.stepsList[indexPath.row].supplierType ?? "0"
                topVC?.otiPushViewController(viewController: viewController)
            }
            else{
                UIApplication.getTopViewController()?.showAlertMsg(msg: "The service voucher was created for the selected company", finished: {
                })
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

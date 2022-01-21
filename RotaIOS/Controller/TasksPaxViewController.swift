//
//  TasksPaxViewController.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import UIKit

class TasksPaxViewController: BaseViewController {
    enum ServiceType: Int {
        case EXC = 1
        case COL = 2
        case DEL = 3
        case ARR = 4
        case DEP = 5
        case SHOP = 6
        case INT = 7
        case INFO = 8
    }
    
    @IBOutlet weak var tableViewTasksPax: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var viewTasksPax: TasksPaxView!
    var serviceType: Int?
    var workNo: String?
    var hotelName: String?
    var excursionName: String?
    var id: String = ""
    var infoPlanId: String = ""
    var planId: String = ""
    var hotelId: String = ""
    var typeInt: String = ""
    var noShowList: [NoShowList] = []
    var updateNoShowList: [UpdateNoShow] = []
    var data: String = ""
    var paxList: [PaxList] = []{
        didSet{
            self.tableViewTasksPax.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksPax.contentSize.height + 40
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksPax.delegate = self
        self.tableViewTasksPax.dataSource = self
        self.tableViewTasksPax.register(TasksPaxTableViewCell.nib, forCellReuseIdentifier: TasksPaxTableViewCell.identifier)
        self.viewTasksPax.labelWorkNo.text = self.workNo
        self.viewTasksPax.labelHotelName.text = self.hotelName
        self.viewTasksPax.labelExcursionName.text = self.excursionName
        self.viewTasksPax.labelPax.text = "Paxes".localizedCapitalized
        
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            self.getTourPaxesService()
        case ServiceType.COL.rawValue:
            self.getColAndDelPaxesService()
        case ServiceType.DEL.rawValue:
            self.getColAndDelPaxesService()
        case ServiceType.ARR.rawValue:
            self.getArrAndDepPaxesService()
        case ServiceType.DEP.rawValue:
         self.getArrAndDepPaxesService()
        case ServiceType.SHOP.rawValue:
            self.getIndShopPaxesService()
        case ServiceType.INT.rawValue:
            self.getInterPaxesService()
        case ServiceType.INFO.rawValue:
            self.getInfoPaxesService()
        default:
            break
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tableViewTasksPax.contentSize.height + 40
    }
    
    func getSendOfficeData(){
        
    }
    
    func getInterPaxesService(){
        let getInterPaxesRequestModel = GetInterPaxesRequestModel.init(id: id)
        NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetInterPaxes, method: .get, parameters: getInterPaxesRequestModel.requestPathString()) { (response : [GetInterPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Operator", incResNo: "Opr Res No", operator_: "Inc Res No", voucherNo: "Flight Code", room: "Show", oprResNo: "Survey No", noShow: "Check Out Date", infoRep: "Flight Time", guideNote: "Note", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index: 0, paxName: item.name, ageGroup: item.operatorList, incResNo: item.oprResNo, operator_: item.incResNo, voucherNo: item.flightCode, room: String(item.show), oprResNo: item.surveyNo, noShow: item.checkOutDateStr, infoRep: item.flightTimeStr, guideNote: item.note, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getInfoPaxesService(){
        let getInfoPaxesRequestModel = GetInfoPaxesRequestModel.init(infoPlanId: infoPlanId)
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetInfoPaxes, method: .get, parameters: getInfoPaxesRequestModel.requestPathString()) { (response : [GetInfoPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", noShow: "Show", infoRep: "Info Rep", guideNote: "Res Note", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: item.oprResNo, noShow: String(item.show), infoRep: item.infoRep, guideNote: item.resNote, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                
            }else {
               print("error")
            }
        }
    }
    
    func getArrAndDepPaxesService(){
        let getArrAndDepPaxesRequestModel = GetArrAndDepPaxesRequestModel.init(planId: planId, hotelId: hotelId, typeInt: typeInt)
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetArrAndDepPaxes, method: .get, parameters: getArrAndDepPaxesRequestModel.requestPathString()) { (response : [GetArrAndDepPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Survey No", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Flight Code", room: "Flight Time", oprResNo: "Terminal", noShow: "Show", infoRep: "Opr Res No", guideNote: "Note", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.surveyNo, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.flightCode, room: item.checkOutDateStr + " " + item.flightTimeStr, oprResNo: item.terminal, noShow: String(item.show), infoRep: item.oprResNo, guideNote: item.note, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                
            }else {
               print("error")
            }
        }
    }
    
    func getTourPaxesService(){
        let getArrAndDepPaxesRequestModel = GetTourPaxesRequestModel.init(planId: planId, hotelId: hotelId)
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetTourPaxes, method: .get, parameters: getArrAndDepPaxesRequestModel.requestPathString()) { (response : [GetTourPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", noShow: "Show", infoRep: "Info Rep", guideNote: "Note", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: item.oprResNo, noShow: String(item.show), infoRep: item.infoRep, guideNote: item.note, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                
            }else {
               print("error")
            }
        }
    }
    
    func getColAndDelPaxesService(){
        let getColAndDelPaxesRequestModel = GetColAndDelPaxesRequestModel.init(planId: planId, hotelId: hotelId, typeId: typeInt)
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetColAndDelPaxes, method: .get, parameters: getColAndDelPaxesRequestModel.requestPathString()) { (response : [GetTourPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", noShow: "Show", infoRep: "Info Rep", guideNote: "-", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: String(item.incResNo), operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: String(item.oprResNo), noShow: String(item.show), infoRep: item.infoRep, guideNote: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                
            }else {
               print("error")
            }
        }
    }
    
    func getIndShopPaxesService(){
        let getIndShopPaxesRequestModel = GetIndShopPaxesRequestModel.init(planId: planId, hotelId: hotelId, typeInt: typeInt)
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetIndShopPaxes, method: .get, parameters: getIndShopPaxesRequestModel.requestPathString()) { (response : [GetIndShopPaxesResponseModel]) in
            if response.count > 0 {
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", noShow: "Show", infoRep: "Info Rep", guideNote: "Note", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: String(item.incResNo), operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: String(item.oprResNo), noShow: String(item.show), infoRep: item.infoRep + " " + item.infoRepPhone, guideNote: item.shoppingGuideNote, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                
            }else {
               print("error")
            }
        }
    }
    
    @IBAction func buttonTappedSendOffice(_ sender: Any) {
        self.sendOffice()
    }
    
    func sendOffice(){
        switch self.serviceType {
        case ServiceType.EXC.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 1, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.COL.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 2, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.DEL.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 3, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.ARR.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 4, noShowList: self.noShowList)
            let UpdateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, method: .get, parameters: UpdateArrAndDepPlanNoShowRequestModel.requestPathString()) { (response : UpdateNoShowResponseModel) in
                if response.message != "" {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.DEP.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 5, noShowList: self.noShowList)
            let UpdateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, method: .get, parameters: UpdateArrAndDepPlanNoShowRequestModel.requestPathString()) { (response : UpdateNoShowResponseModel) in
                if response.message != "" {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.SHOP.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 10, noShowList: self.noShowList)
            let UpdateIndShopNoShowRequestModel = UpdateIndShopNoShowRequestModel.init(data: updateNoShowModel.toJSONString(prettyPrint: true) ?? "")
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .UpdateIndShopNoShow, method: .get, parameters: UpdateIndShopNoShowRequestModel.requestPathString()) { (response : UpdateNoShowResponseModel) in
                if response.message != "" {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.INT.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 6, noShowList: self.noShowList)
            let UpdateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString(prettyPrint: true) ?? "")
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, method: .get, parameters: UpdateArrAndDepPlanNoShowRequestModel.requestPathString()) { (response : UpdateNoShowResponseModel) in
                if response.message != "" {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        case ServiceType.INFO.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: 7, noShowList: self.noShowList)
            let UpdateInfoPlanNoShowRequestModel = UpdateInfoPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString(prettyPrint: true) ?? "")
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .UpdateInfoPlanNoShow, method: .get, parameters: UpdateInfoPlanNoShowRequestModel.requestPathString()) { (response : UpdateNoShowResponseModel) in
                if response.message != "" {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                    })
                }
            }
        default:
            break
        }
    }
}

extension TasksPaxViewController: TasksPaxTableViewCellDelegate {
    func updatedList(index: Int, check: Bool) {
        self.paxList[index].check = check
        self.noShowList[index-1].show = check
    }
}

extension TasksPaxViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paxList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksPaxTableViewCell.identifier, for: indexPath) as! TasksPaxTableViewCell
        if indexPath.row == 0{
            cell.imageViewCheck.isHidden = true
        }
        else{
            cell.imageViewCheck.isHidden = false
        }
        cell.delegate = self
        cell.setInfo(index: indexPath.row, paxName: self.paxList[indexPath.row].paxName, ageGroup: self.paxList[indexPath.row].ageGroup, incResNo: self.paxList[indexPath.row].incResNo, operator_: self.paxList[indexPath.row].operatorList, voucherNo: self.paxList[indexPath.row].voucherNo, room: self.paxList[indexPath.row].room, oprResNo: self.paxList[indexPath.row].oprResNo, noShow: self.paxList[indexPath.row].show, infoRep: self.paxList[indexPath.row].infoRep, guideNote: self.paxList[indexPath.row].shoppingGuideNote, check: self.paxList[indexPath.row].check)
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

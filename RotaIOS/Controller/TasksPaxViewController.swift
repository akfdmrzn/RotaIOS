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
        case INT = 6
        case INFO = 7
        case SHOP = 10
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
    var i = 0
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
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.excursionColor
            self.viewTasksPax.labelWorkType.text = "EXC"
        case ServiceType.COL.rawValue:
            self.getColAndDelPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.collectionColor
            self.viewTasksPax.labelWorkType.text = "COL"
        case ServiceType.DEL.rawValue:
            self.getColAndDelPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.deliveryColor
            self.viewTasksPax.labelWorkType.text = "DEL"
        case ServiceType.ARR.rawValue:
            self.getArrAndDepPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.arrivalColor
            self.viewTasksPax.labelWorkType.text = "ARR"
        case ServiceType.DEP.rawValue:
            self.getArrAndDepPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.departureColor
            self.viewTasksPax.labelWorkType.text = "DEP"
        case ServiceType.SHOP.rawValue:
            self.getIndShopPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.indShopForMobileColor
            self.viewTasksPax.labelWorkType.text = "SHOP"
        case ServiceType.INT.rawValue:
            self.getInterPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.internColor
            self.viewTasksPax.labelWorkType.text = "INT"
        case ServiceType.INFO.rawValue:
            self.getInfoPaxesService()
            self.viewTasksPax.viewTaksType.backgroundColor = UIColor.infoPlanColor
            self.viewTasksPax.labelWorkType.text = "INFO"
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Operator", incResNo: "Opr Res No", operator_: "Inc Res No", voucherNo: "Flight Code", room: "Birthday", oprResNo: "Survey No", birthday: "Check Out Date", infoRep: "Flight Time", guideNote: "Note", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index: 0, paxName: item.name, ageGroup: item.operatorList, incResNo: item.oprResNo, operator_: item.incResNo, voucherNo: item.flightCode, room: "-", oprResNo: item.surveyNo, birthday: item.checkOutDateStr, infoRep: item.flightTimeStr, guideNote: item.note, arrInfoNote: "-", transferGuideName: "-", transferGuidePhoneNumber: "-", favouriteExcursionDesc: "-", checkDatesStr: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", birthday: "Birthday", infoRep: "Info Rep", guideNote: "Res Note", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: item.oprResNo, birthday: item.birtDayStr, infoRep: item.infoRep, guideNote: item.resNote, arrInfoNote: item.arrInfoNote, transferGuideName: item.transferGuideName, transferGuidePhoneNumber: item.transferGuidePhoneNumber, favouriteExcursionDesc: item.favouriteExcursionDesc, checkDatesStr: item.checkDatesStr, check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.paxId, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Survey No", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Flight Code", room: "Flight Time", oprResNo: "Terminal", birthday: "Birthday", infoRep: "Opr Res No", guideNote: "Note", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.surveyNo, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.flightCode, room: item.checkOutDateStr + " " + item.flightTimeStr, oprResNo: item.terminal, birthday: "-", infoRep: item.oprResNo, guideNote: item.note, arrInfoNote: "-", transferGuideName: "-", transferGuidePhoneNumber: "-", favouriteExcursionDesc: "-", checkDatesStr: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", birthday: "Birthday", infoRep: "Info Rep", guideNote: "Note", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: item.incResNo, operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: item.oprResNo, birthday: "-", infoRep: item.infoRep, guideNote: item.note, arrInfoNote: "-", transferGuideName: "-", transferGuidePhoneNumber: "-", favouriteExcursionDesc: "-", checkDatesStr: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.paxId, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", birthday: "Birthday", infoRep: "Info Rep", guideNote: "-", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: String(item.incResNo), operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: String(item.oprResNo), birthday: "-", infoRep: item.infoRep, guideNote: "-", arrInfoNote: "-", transferGuideName: "-", transferGuidePhoneNumber: "-", favouriteExcursionDesc: "-", checkDatesStr: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.paxId, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
                self.paxList.append(PaxList.init(index:0, paxName: "Name", ageGroup: "Age Group", incResNo: "Inc Res No", operator_: "Operator", voucherNo: "Voucher No", room: "Room", oprResNo: "Opr Res No", birthday: "Birthday", infoRep: "Info Rep", guideNote: "Note", arrInfoNote: "Transfer Rep Note", transferGuideName: "Transfer Guide Name", transferGuidePhoneNumber: "Transfer Guide Phone", favouriteExcursionDesc: "Favourite Exc", checkDatesStr: " Check-in/Check-out Date", check: false))
                for item in response {
                    self.paxList.append(PaxList.init(index:0, paxName: item.name, ageGroup: item.ageGroup, incResNo: String(item.incResNo), operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: String(item.oprResNo), birthday: "-", infoRep: item.infoRep + " " + item.infoRepPhone, guideNote: item.shoppingGuideNote, arrInfoNote: "-", transferGuideName: "-", transferGuidePhoneNumber: "-", favouriteExcursionDesc: "-", checkDatesStr: "-", check: item.show))
                    self.noShowList.append(NoShowList.init(paxId: item.id, show: item.show))
                }
                for item in self.paxList{
                    if item.check == true{
                        self.i = self.i + 1
                    }
                    else{
                        
                    }
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
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.EXC.rawValue, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.COL.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.COL.rawValue, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.DEL.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.DEL.rawValue, noShowList: self.noShowList)
            let updateNoShowRequestModel = UpdateNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateNoShow, requestModel: updateNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.ARR.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.ARR.rawValue, noShowList: self.noShowList)
            let updateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, requestModel: updateArrAndDepPlanNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.DEP.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.DEP.rawValue, noShowList: self.noShowList)
            let updateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, requestModel: updateArrAndDepPlanNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.INT.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.INT.rawValue, noShowList: self.noShowList)
            let updateArrAndDepPlanNoShowRequestModel = UpdateArrAndDepPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateArrAndDepPlanNoShow, requestModel: updateArrAndDepPlanNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.INFO.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.INFO.rawValue, noShowList: self.noShowList)
            let updateInfoPlanNoShowRequestModel = UpdateInfoPlanNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateInfoPlanNoShow, requestModel: updateInfoPlanNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
        case ServiceType.SHOP.rawValue:
            let updateNoShowModel = UpdateNoShow.init(typeInt: ServiceType.SHOP.rawValue, noShowList: self.noShowList)
            let updateIndShopNoShowRequestModel = UpdateIndShopNoShowRequestModel.init(data: updateNoShowModel.toJSONString() ?? "")
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .UpdateIndShopNoShow, requestModel: updateIndShopNoShowRequestModel) { (response : UpdateNoShowResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
                        self.dismiss(animated: true, completion: nil)
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
        self.i = -1
        if index == 0{
            for item in self.paxList{
                item.check = check
            }
            for item in self.noShowList{
                item.show = check
            }
        }
        else{
            self.paxList[index].check = check
            self.noShowList[index-1].show = check
        }
        for item in self.paxList{
            if item.check == true{
                self.i = self.i + 1
            }
            else{
                
            }
        }
        self.tableViewTasksPax.reloadData()
    }
}

extension TasksPaxViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paxList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksPaxTableViewCell.identifier, for: indexPath) as! TasksPaxTableViewCell
        cell.delegate = self
        if indexPath.row == 0{
            cell.imageViewCheck.image = (self.i == self.paxList.count - 1) ? UIImage(named: "check") : UIImage(named: "square")
            cell.setInfo(index: indexPath.row, paxName: self.paxList[indexPath.row].paxName, ageGroup: self.paxList[indexPath.row].ageGroup, incResNo: self.paxList[indexPath.row].incResNo, operator_: self.paxList[indexPath.row].operatorList, voucherNo: self.paxList[indexPath.row].voucherNo, room: self.paxList[indexPath.row].room, oprResNo: self.paxList[indexPath.row].oprResNo, birthday: self.paxList[indexPath.row].birthday, infoRep: self.paxList[indexPath.row].infoRep, guideNote: self.paxList[indexPath.row].shoppingGuideNote, arrInfoNote: self.paxList[indexPath.row].arrInfoNote, transferGuideName: self.paxList[indexPath.row].transferGuideName, transferGuidePhoneNumber: self.paxList[indexPath.row].transferGuidePhoneNumber, favouriteExcursionDesc: self.paxList[indexPath.row].favouriteExcursionDesc, checkDatesStr: self.paxList[indexPath.row].checkDatesStr,check: (self.i == self.paxList.count - 1) ? true : false)
        }
        
        else{
            cell.setInfo(index: indexPath.row, paxName: self.paxList[indexPath.row].paxName, ageGroup: self.paxList[indexPath.row].ageGroup, incResNo: self.paxList[indexPath.row].incResNo, operator_: self.paxList[indexPath.row].operatorList, voucherNo: self.paxList[indexPath.row].voucherNo, room: self.paxList[indexPath.row].room, oprResNo: self.paxList[indexPath.row].oprResNo, birthday: self.paxList[indexPath.row].birthday, infoRep: self.paxList[indexPath.row].infoRep, guideNote: self.paxList[indexPath.row].shoppingGuideNote, arrInfoNote: self.paxList[indexPath.row].arrInfoNote, transferGuideName: self.paxList[indexPath.row].transferGuideName, transferGuidePhoneNumber: self.paxList[indexPath.row].transferGuidePhoneNumber, favouriteExcursionDesc: self.paxList[indexPath.row].favouriteExcursionDesc, checkDatesStr: self.paxList[indexPath.row].checkDatesStr,check: self.paxList[indexPath.row].check)
        }
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

//
//  TasksHotelViewController.swift
//  RotaIOS
//
//  Created by odeon on 23.12.2021.
//

import UIKit

class TasksHotelViewController: BaseViewController {
    enum ServiceType: Int {
        case COLEXCDEL = 1
        case ARRDEP = 2
        case SHOP = 3
        case INT = 4
    }
    
    @IBOutlet weak var tableViewTasksHotel: UITableView!
    @IBOutlet weak var tasksHotelTableViewHeightConstraint: NSLayoutConstraint!
    var shortCode: String = ""
    var serviceType: Int?
    var lineColor: UIColor?
    var arrAndDepHotelListForMobileList: [GetArrAndDepHotelListForMobileResponseModel] = []
    var workNo: String?
    var hotelName: String?
    var excursionName: String?
    var list: [HotelList] = []{
        didSet {
            self.tableViewTasksHotel.reloadData()
            self.tasksHotelTableViewHeightConstraint.constant = self.tableViewTasksHotel.contentSize.height + 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(shortCode)
        self.tableViewTasksHotel.delegate = self
        self.tableViewTasksHotel.dataSource = self
        self.tableViewTasksHotel.register(TasksHotelTableViewCell.nib, forCellReuseIdentifier: TasksHotelTableViewCell.identifier)
        switch self.serviceType {
        case ServiceType.COLEXCDEL.rawValue:
            self.getHotelListForMobileService()
        case ServiceType.ARRDEP.rawValue:
            self.getArrAndDepHotelListForMobileService()
        case ServiceType.SHOP.rawValue:
            self.getIndShopHotelListForMobileService()
        case ServiceType.INT.rawValue:
            self.getInterService()
        default:
            break
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksHotelTableViewHeightConstraint.constant = self.tableViewTasksHotel.contentSize.height + 20
    }
    
    func getHotelListForMobileService(){
        let getHotelListForMobileRequestModel = GetHotelListForMobileRequestModel.init(guideId: String(userDefaultsData.getGuideId()), ids: "496533", typeInt: "1")
            NetworkManager.sendGetRequestArray(url: NetworkManager.BASEURL, endPoint: .GetHotelListForMobile, method: .get, parameters: getHotelListForMobileRequestModel.requestPathString()) { (response : [GetHotelListForMobileResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.list.append(HotelList.init(hotel: item.hotelName, place: item.place, date: item.timeSpan, time: item.market, info: "-", title1: "Reel Pax", title2: "Plan Pax", title3: "", title4: "", body1: item.reelPax, body2: item.planPax, body3: "", body4: ""))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getArrAndDepHotelListForMobileService(){
        let getArrAndDepHotelListForMobileRequestModel = GetArrAndDepHotelListForMobileRequestModel.init(planId: "433854", typeInt: "5")
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetArrAndDepHotelListForMobile, method: .get, parameters: getArrAndDepHotelListForMobileRequestModel.requestPathString()) { (response : [GetArrAndDepHotelListForMobileResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.list.append(HotelList.init(hotel: item.hotel, place: item.flightInfoStr, date: item.transferDateStr, time: item.guidePickUpTimeStr, info: item.pickUpTimeStr, title1: "Reel Pax", title2: "Plan Pax", title3: "", title4: "", body1: item.reelPax, body2: item.planPax, body3: "", body4: ""))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getIndShopHotelListForMobileService(){
        let getIndShopHotelListForMobileRequestModel = GetIndShopHotelListForMobileRequestModel.init(planIds: "15257", typeInt: "5")
            NetworkManager.sendGetRequestArray(url: "https://rota-eg.odeontours.com", endPoint: .GetIndShopHotelListForMobile, method: .get, parameters: getIndShopHotelListForMobileRequestModel.requestPathString()) { (response : [GetIndShopHotelListForMobileResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.list.append(HotelList.init(hotel: item.hotel, place: item.place, date: item.pickUpTimeStr, time: item.voucherNumber, info: "-", title1: "Reel Pax", title2: "Plan Pax", title3: "", title4: "", body1: String(item.reelPax), body2: item.planPax, body3: "", body4: ""))
                }
            }else {
               print("error")
            }
        }
    }
    
    func getInterService(){
        let getInterRequestModel = GetInterRequestModel.init(id: 433742)
            NetworkManager.sendGetRequest(url: "https://rota.odeontours.com", endPoint: .GetInter, method: .get, parameters: getInterRequestModel.requestPathString()) { (response : GetInterResponseModel) in
                if response.id != 0 {
                    self.list.append(HotelList.init(hotel: response.firstHotel + " - " + response.lastHotel, place: response.meetinPoint, date: response.transferDateStr, time: response.guidePickupTime, info: response.pickupTime, title1: "Pax", title2: "Vehicle Type", title3: "Plate", title4: "Service Name", body1: String(response.pax), body2: response.vehicleType, body3: response.plate, body4: response.serviceName))
                
            }else {
               print("error")
            }
        }
    }
}

extension TasksHotelViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksHotelTableViewCell.identifier, for: indexPath) as! TasksHotelTableViewCell
        cell.setInfo(viewColor: self.lineColor ?? UIColor.blue, hotel: self.list[indexPath.row].hotel, place: self.list[indexPath.row].place, date: self.list[indexPath.row].date, time: self.list[indexPath.row].time, info: self.list[indexPath.row].info, title1: self.list[indexPath.row].title1, title2: self.list[indexPath.row].title2, title3: self.list[indexPath.row].title3, title4: self.list[indexPath.row].title4, body1: self.list[indexPath.row].body1, body2: self.list[indexPath.row].body2, body3: self.list[indexPath.row].body3, body4: self.list[indexPath.row].body4)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topVC = UIApplication.getTopViewController()
        let viewController = TasksPaxViewController()
        viewController.hotelName = self.list[indexPath.row].hotel
        viewController.workNo = self.workNo
        viewController.excursionName = self.excursionName
        topVC?.otiPushViewController(viewController: viewController)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

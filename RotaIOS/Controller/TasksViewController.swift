//
//  TasksViewController.swift
//  RotaIOS
//
//  Created by odeon on 20.12.2021.
//

import UIKit

class TasksViewController: BaseViewController {
    enum ShortCode: String {
        case COL = "COL"
        case EXC = "EXC"
        case ARR = "ARR"
        case DEP = "DEP"
        case INFO = "INFO"
        case SHOP = "SHOP"
        case INT = "INT"
        case DEL = "DEL"
    }
    
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var taskCustomView: TasksCustomView!
    var tasksList: GetGuideDutiesResponseModel?
    var collection: [Collection] = []
    var excursion : [Excursion] = []
    var delivery : [Delivery] = []
    var arrival : [Arrival] = []
    var departure : [Departure] = []
    var intern : [Intern] = []
    var speakTime : [SpeakTime] = []
    var infoPlan : [InfoPlan] = []
    var indShopForMobile : [Shop] = []
    var newList : [NewList]?
    var yesterdayList:[TotalList] = []
    var todayList:[TotalList] = []
    var tomorrowList:[TotalList] = []
    var shList:[TotalList] = []
    var flag: Int = 0
    var dateString = ""
    var yesterdayDateString = ""
    var tomorrowDateString = ""
    var workNo: String?
    var hotelName: String?
    var excursionName: String?
    var totalList:[TotalList] = [] {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        dateString = df.string(from: date)
        dateString = "01-05-2022"
        let yesterday = Date.yesterday
        let ydf = DateFormatter()
        ydf.dateFormat = "MM-dd-yyyy"
        yesterdayDateString = df.string(from: yesterday)
        yesterdayDateString = "01-04-2022"
        let tomorrow = Date.tomorrow
        let tdf = DateFormatter()
        tdf.dateFormat = "MM-dd-yyyy"
        tomorrowDateString = tdf.string(from: tomorrow)
        tomorrowDateString = "01-06-2022"
        self.taskCustomView.delegate = self
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        self.tasksTableView.register(TaskTableViewCell.nib, forCellReuseIdentifier: TaskTableViewCell.identifier)
        getGuideDutiesService()
    }
    
    func getGuideDutiesService(){
        let GetGuideDutiesRequestModel = GetGuideDutiesRequestModel.init(guideId: String(userDefaultsData.getGuideId()), date: dateString, langId: String(userDefaultsData.getLanguageId()))
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetGuideDuties, method: .get, parameters: GetGuideDutiesRequestModel.requestPathString()) { (response : GetGuideDutiesResponseModel) in
            if response._id != "" {
                self.collection = response.collection
                self.excursion = response.excursion
                self.delivery = response.delivery
                self.arrival = response.arrival
                self.departure = response.departure
                self.intern = response.intern
                self.speakTime = response.speakTime
                self.infoPlan = response.infoPlan
                self.indShopForMobile = response.indShopForMobile
                self.addList()
                self.tasksTableView.reloadData()
                self.tasksTableViewHeightConstraint.constant = self.tasksTableView.contentSize.height + 40
            }else {
               print("error")
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tasksTableView.contentSize.height + 40
    }
    
    func addList(){
        self.yesterdayList.removeAll()
        self.todayList.removeAll()
        self.tomorrowList.removeAll()
        self.shList.removeAll()
        for item in self.collection {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 28/255, green: 38/255, blue: 183/255, alpha: 1.0) , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 28/255, green: 38/255, blue: 183/255, alpha: 1.0) , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 28/255, green: 38/255, blue: 183/255, alpha: 1.0) , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.excursion {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.delivery {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 3/255, green: 93/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 3/255, green: 93/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 3/255, green: 93/255, blue: 0/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.arrival {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 38/255, green: 196/255, blue: 85/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 38/255, green: 196/255, blue: 85/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 38/255, green: 196/255, blue: 85/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.departure {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 183/255, green: 28/255, blue: 28/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 183/255, green: 28/255, blue: 28/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 183/255, green: 28/255, blue: 28/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.intern {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.speakTime {
            self.shList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: "-", excursion: item.hotelName, transferType: "-", pax: "-", vehicle: "-", meetingPointAndTime: item.beginDate, meetingTime: item.startTime, extra: "-", driverName: item.endDate, driverPhone: item.days, color: UIColor(red: 0/255, green: 201/255, blue: 195/255, alpha: 1.0)  , noteColor: UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: ""))
            
        }
        for item in self.infoPlan {
            switch item.dateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor(red: 184/255, green: 0/255, blue: 172/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor(red: 184/255, green: 0/255, blue: 172/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor(red: 184/255, green: 0/255, blue: 172/255, alpha: 1.0)  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        for item in self.indShopForMobile {
            switch item.dateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0), noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0), noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
                
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0), noteColor: (item.note != "") ? UIColor.greenColor : UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1.0), note: (item.note != "") ? item.note : ""))
            default:
                break
            }
        }
        switch flag {
        case 0:
            self.totalList = self.yesterdayList
        case 1:
            self.totalList = self.todayList
        case 2:
            self.totalList = self.tomorrowList
        case 3:
            self.totalList = self.shList
        default:
            break
        }
    }
}

extension TasksViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.totalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        cell.setInfo(shortCode: self.totalList[indexPath.row].shortCode, workNo: self.totalList[indexPath.row].workNo, tourDateStr: self.totalList[indexPath.row].tourDateStr, excursion: self.totalList[indexPath.row].excursion, transferType: self.totalList[indexPath.row].transferType, pax: self.totalList[indexPath.row].pax, vehicle: self.totalList[indexPath.row].vehicle, meetingPointAndTime: self.totalList[indexPath.row].meetingPointAndTime, meetingTime: self.totalList[indexPath.row].meetingTime, extra: self.totalList[indexPath.row].extra, driverName: self.totalList[indexPath.row].driverName, driverPhone: self.totalList[indexPath.row].driverPhone, color: self.totalList[indexPath.row].color, noteColor: self.totalList[indexPath.row].noteColor, note: self.totalList[indexPath.row].note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topVC = UIApplication.getTopViewController()
        let viewController = TasksHotelViewController()
        switch self.totalList[indexPath.row].shortCode {
        case ShortCode.COL.rawValue:
            viewController.shortCode = "COL"
            viewController.lineColor = UIColor(red: 28/255, green: 38/255, blue: 183/255, alpha: 1.0)
            viewController.serviceType = 1
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.EXC.rawValue:
            viewController.shortCode = "EXC"
            viewController.lineColor = UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1.0)
            viewController.serviceType = 1
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.ARR.rawValue:
            viewController.shortCode = "ARR"
            viewController.lineColor = UIColor(red: 38/255, green: 196/255, blue: 85/255, alpha: 1.0)
            viewController.serviceType = 2
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.DEP.rawValue:
            viewController.shortCode = "DEP"
            viewController.lineColor = UIColor(red: 183/255, green: 28/255, blue: 28/255, alpha: 1.0)
            viewController.serviceType = 2
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.INFO.rawValue:
            viewController.shortCode = "INFO"
            viewController.lineColor = UIColor(red: 184/255, green: 0/255, blue: 172/255, alpha: 1.0)
        case ShortCode.SHOP.rawValue:
            viewController.shortCode = "SHOP"
            viewController.lineColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
            viewController.serviceType = 3
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.INT.rawValue:
            viewController.shortCode = "INT"
            viewController.lineColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
            viewController.serviceType = 4
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.DEL.rawValue:
            viewController.shortCode = "DEL"
            viewController.lineColor = UIColor(red: 3/255, green: 93/255, blue: 0/255, alpha: 1.0)
            viewController.serviceType = 1
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            topVC?.otiPushViewController(viewController: viewController)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension TasksViewController : TasksCustomViewDelegate{
    func tappedYesterday(){
        DispatchQueue.main.async() {
            // your UI update code
            self.totalList.removeAll()
            self.flag = 0
            self.getGuideDutiesService()
        }
    }
    
    func tappedToday(){
        DispatchQueue.main.async() {
            self.totalList.removeAll()
            self.flag = 1
            self.getGuideDutiesService()
        }
    }
    
    func tappedTomorrow(){
        DispatchQueue.main.async() {
            self.totalList.removeAll()
            self.flag = 2
            self.getGuideDutiesService()
        }
    }
    
    func tappedSH(){
        self.totalList.removeAll()
        self.flag = 3
        getGuideDutiesService()
    }
}

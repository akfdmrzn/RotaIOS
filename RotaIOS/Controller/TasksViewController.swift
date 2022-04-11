//
//  TasksViewController.swift
//  RotaIOS
//
//  Created by odeon on 20.12.2021.
//

import UIKit

class TasksViewController: BaseViewController {
    enum ShortCode: String {
        case EXC = "EXC" //1
        case COL = "COL" //2
        case DEL = "DEL" //3
        case ARR = "ARR" //4
        case DEP = "DEP" //5
        case INT = "INT" //6
        case INFO = "INFO" //7
        case SHOP = "SHOP" //10
    }
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
    var flag: Int = 1
    var dateString = ""
    var yesterdayDateString = ""
    var tomorrowDateString = ""
    var workNo: String?
    var hotelName: String?
    var excursionName: String?
    var getGuideDutiesList: [GetGuideDutiesList] = []
    var getGuideDutiesYesterdayList: [GetGuideDutiesList] = []
    var getGuideDutiesTodayList: [GetGuideDutiesList] = []
    var getGuideDutiesTomorrowList: [GetGuideDutiesList] = []
    var totalList:[TotalList] = [] {
        didSet {
            self.tasksTableView.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tasksTableView.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.date()
        self.taskCustomView.delegate = self
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        self.tasksTableView.register(TaskTableViewCell.nib, forCellReuseIdentifier: TaskTableViewCell.identifier)
        getGuideDutiesService()
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(TasksViewController.longPress(longPressGestureRecognizer:)))
        self.tasksTableView.addGestureRecognizer(longPressRecognizer)
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tasksTableView.contentSize.height
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: self.tasksTableView)
            if let indexPath = self.tasksTableView.indexPathForRow(at: touchPoint) {
                switch self.totalList[indexPath.row].shortCode {
                case ShortCode.EXC.rawValue:
                    self.showAlertMenu(msg: "EXC", isCreateReport: true, isSendMeetingTime: true, isTourDetail: true, isSteps: true, index: indexPath.row, typeInt: ServiceType.EXC.rawValue, finished: {
                    })
                case ShortCode.COL.rawValue:
                    self.showAlertMenu(msg: "COL", isCreateReport: true, isSendMeetingTime: true, isTourDetail: true, isSteps: false, index: indexPath.row, typeInt: ServiceType.COL.rawValue, finished: {
                    })
                case ShortCode.DEL.rawValue:
                    self.showAlertMenu(msg: "DEL", isCreateReport: true, isSendMeetingTime: true, isTourDetail: true, isSteps: false, index: indexPath.row, typeInt: ServiceType.DEL.rawValue, finished: {
                    })
                case ShortCode.ARR.rawValue:
                    self.showAlertMenu(msg: "ARR", isCreateReport: true, isSendMeetingTime: true, isTourDetail: false, isSteps: true, index: indexPath.row, typeInt: ServiceType.ARR.rawValue, finished: {
                    })
                case ShortCode.DEP.rawValue:
                    self.showAlertMenu(msg: "DEP", isCreateReport: true, isSendMeetingTime: true, isTourDetail: false, isSteps: true, index: indexPath.row, typeInt: ServiceType.DEP.rawValue, finished: {
                    })
                case ShortCode.INT.rawValue:
                    self.showAlertMenu(msg: "INT", isCreateReport: true, isSendMeetingTime: true, isTourDetail: false, isSteps: true, index: indexPath.row, typeInt: ServiceType.INT.rawValue, finished: {
                    })
                case ShortCode.INFO.rawValue:
                    self.showAlertMenu(msg: "INFO", isCreateReport: true, isSendMeetingTime: false, isTourDetail: false, isSteps: false, index: indexPath.row, typeInt: ServiceType.INFO.rawValue, finished: {
                    })
                case ShortCode.SHOP.rawValue:
                    self.showAlertMenu(msg: "SHOP", isCreateReport: true, isSendMeetingTime: true, isTourDetail: false, isSteps: false, index: indexPath.row, typeInt: ServiceType.SHOP.rawValue, finished: {
                    })
                    break
                default:
                    break
                }
            }
        }
    }
    
    public func showAlertMenu(msg : String, isCreateReport: Bool, isSendMeetingTime: Bool, isTourDetail: Bool, isSteps: Bool, index: Int, typeInt: Int, finished: @escaping () -> Void){
        let alertController = UIAlertController(title: "Actions", message: nil, preferredStyle: .actionSheet)
        let createReportAction = UIAlertAction(title: "Create Report", style: .default) { _ in
            self.showAlertMsgWithTxtField(msg: "Create Report", workNo: self.totalList[index].workNo, typeInt: self.getGuideDutiesList[index].typeInt, relatedId: self.getGuideDutiesList[index].ids, tourDate: self.totalList[index].tourDateStr, finished: {
            })
        }
        let sendMeetingTimeAction = UIAlertAction(title: "Send Meeting Time", style: .default) { _ in
            self.showAlertButton(msg: "Send Meeting Time", workNo: self.totalList[index].workNo, typeInt: self.getGuideDutiesList[index].typeInt, relatedId: self.getGuideDutiesList[index].ids, tourDate: self.totalList[index].tourDateStr, finished: {
            })
        }
        let tourDetailAction = UIAlertAction(title: "Tour Detail", style: .default) { _ in
            let topVC = UIApplication.getTopViewController()
            let viewController = TasksTourDetailViewController()
            viewController.ids = self.getGuideDutiesList[index].ids
            viewController.typeInt = self.getGuideDutiesList[index].typeInt
            topVC?.otiPushViewController(viewController: viewController)
        }
        let stepsAction = UIAlertAction(title: "Steps", style: .default) { _ in
            let topVC = UIApplication.getTopViewController()
            let viewController = TasksStepsViewController()
            viewController.ids = (typeInt == ServiceType.ARR.rawValue || typeInt == ServiceType.DEP.rawValue || typeInt == ServiceType.INT.rawValue) ?  self.getGuideDutiesList[index].planId : self.getGuideDutiesList[index].ids
            viewController.serviceType = typeInt
            topVC?.otiPushViewController(viewController: viewController)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
                    (alertAction: UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
                }))
        isCreateReport == true ? alertController.addAction(createReportAction) : nil
        isSendMeetingTime == true ? alertController.addAction(sendMeetingTimeAction) : nil
        isTourDetail == true ? alertController.addAction(tourDetailAction) : nil
        isSteps == true ? alertController.addAction(stepsAction) : nil
        self.present(alertController, animated: true)
    }
    
    public func showAlertMsgWithTxtField(msg : String, workNo: String, typeInt: String,
                                         relatedId: String, tourDate: String, finished: @escaping () -> Void){
        let alertController = UIAlertController(title: "Note", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Note"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Plate"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Glass Number"
        }
        let continueAction = UIAlertAction(title: "Save", style: .default) { [weak alertController] _ in
            guard let textFields = alertController?.textFields else { return }
            if let noteText = textFields[0].text, let plateText = textFields[1].text, let glassText = textFields[2].text  {
                self.saveGuideMeetingTimeAndReport(workNo: workNo, guide: String(userDefaultsData.getGuideId()), typeInt: typeInt, note: noteText, isReport: "true", action: "1", plate: plateText, state: "", relatedId: relatedId, tourDate: tourDate, glassNumber: glassText)
            }
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
                    (alertAction: UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
                }))
        alertController.addAction(continueAction)
        self.present(alertController, animated: true)
    }
    
    public func showAlertButton(msg : String, workNo: String, typeInt: String,
                               relatedId: String, tourDate: String, finished: @escaping () -> Void){
        let alertController = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        let sendAction = UIAlertAction(title: "Send", style: .default) { _ in
            self.saveGuideMeetingTimeAndReport(workNo: workNo, guide: String(userDefaultsData.getGuideId()), typeInt: typeInt, note: "", isReport: "false", action: "1", plate: "Test", state: "1", relatedId: relatedId, tourDate: tourDate, glassNumber: "")
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
                    (alertAction: UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
                }))
        alertController.addAction(sendAction)
        self.present(alertController, animated: true)
    }
    
    func saveGuideMeetingTimeAndReport(workNo : String, guide: String, typeInt: String, note: String, isReport: String, action: String, plate: String, state: String, relatedId: String, tourDate: String, glassNumber : String){
        let saveGuideMeetingTimeAndReportRequestModel = SaveGuideMeetingTimeAndReportRequestModel.init(workNo: workNo, guide: guide, typeInt: typeInt, note: note, isReport: isReport, action: action, plate: plate, state: state, relatedId: relatedId, tourDate: tourDate.getDateFormatStr(), glassNumber : glassNumber, eventEntryRef : "")
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .SaveGuideMeetingTimeAndReport, requestModel: saveGuideMeetingTimeAndReportRequestModel) { (response : SaveGuideMeetingTimeAndReportResponseModel) in
            UIApplication.getTopViewController()?.showAlertMsg(msg: response.message, finished: {
            })
        }
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
                self.view.layoutIfNeeded()
                self.viewWillLayoutSubviews()
            }else {
               print("error")
            }
        }
    }
    
    func date(){
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        dateString = df.string(from: date)
        let yesterday = Date.yesterday
        let ydf = DateFormatter()
        ydf.dateFormat = "MM-dd-yyyy"
        yesterdayDateString = df.string(from: yesterday)
        let tomorrow = Date.tomorrow
        let tdf = DateFormatter()
        tdf.dateFormat = "MM-dd-yyyy"
        tomorrowDateString = tdf.string(from: tomorrow)
        //tomorrowDateString = "01-06-2022"
    }
    
    func addList(){
        self.yesterdayList.removeAll()
        self.todayList.removeAll()
        self.tomorrowList.removeAll()
        self.shList.removeAll()
        self.getGuideDutiesYesterdayList.removeAll()
        self.getGuideDutiesTodayList.removeAll()
        self.getGuideDutiesTomorrowList.removeAll()
        for item in self.collection {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.collectionColor , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.collectionColor , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.collectionColor , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            default:
                break
            }
        }
        for item in self.excursion {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.excursionColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.excursionColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.excursionColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            default:
                break
            }
        }
        for item in self.delivery {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.deliveryColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.deliveryColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.excursion, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: item.extraTotalPax, driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.deliveryColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: item.ids, typeInt: String(item.typeInt), planId: "", planIds: ""))
            default:
                break
            }
        }
        for item in self.arrival {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.arrivalColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.arrivalColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.arrivalColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            default:
                break
            }
        }
        for item in self.departure {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.departureColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.departureColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: String(item.workNo), tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.departureColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: String(item.id), planIds: ""))
            default:
                break
            }
        }
        for item in self.intern {
            switch item.tourDateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.internColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: item.id, ids: "", typeInt: "", planId: "", planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.internColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: item.id, ids: "", typeInt: "", planId: "", planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.tourDateStr, excursion: item.flightCodes + " - " + item.fromTo, transferType: item.transferType, pax: item.pax, vehicle: item.vehicle, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.internColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: item.id, ids: "", typeInt: "", planId: "", planIds: ""))
            default:
                break
            }
        }
        for item in self.speakTime {
            self.shList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: "-", excursion: item.hotelName, transferType: "-", pax: "-", vehicle: "-", meetingPointAndTime: item.beginDate.dateToString().dateFormatStr(), meetingTime: item.startTime, extra: "-", driverName: item.endDate.dateToString().dateFormatStr(), driverPhone: item.days, color: UIColor.speakTimeColor  , noteColor: UIColor.noteGrayColor, note: ""))
            
        }
        for item in self.infoPlan {
            switch item.dateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor.infoPlanColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: "", planId: String(item.id), planIds: ""))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor.infoPlanColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: "", planId: String(item.id), planIds: ""))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: "-", tourDateStr: item.dateStr, excursion: item.hotelName, transferType: item.market, pax: item.pax, vehicle: item.reelPax, meetingPointAndTime: "-", meetingTime: item.infoTime, extra: "-", driverName: "-", driverPhone: "-", color: UIColor.infoPlanColor  , noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: "", planId: String(item.id), planIds: ""))
            default:
                break
            }
        }
        for item in self.indShopForMobile {
            switch item.dateStr {
            case self.yesterdayDateString.dateFormat():
                self.yesterdayList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.indShopForMobileColor, noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesYesterdayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: "", planIds: item.id))
            case self.dateString.dateFormat():
                self.todayList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.indShopForMobileColor, noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTodayList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: "", planIds: item.id))
            case self.tomorrowDateString.dateFormat():
                self.tomorrowList.append(TotalList.init(shortCode: item.shortCode, workNo: item.workNo, tourDateStr: item.dateStr, excursion: item.meetingPoint, transferType: "-", pax: item.pax, vehicle: item.vehiclePlate, meetingPointAndTime: item.meetingPointAndTime, meetingTime: item.meetingTime, extra: "-", driverName: item.driverName, driverPhone: item.driverPhone, color: UIColor.indShopForMobileColor, noteColor: (item.note != "") ? UIColor.greenColor : UIColor.noteGrayColor, note: (item.note != "") ? item.note : ""))
                self.getGuideDutiesTomorrowList.append(GetGuideDutiesList.init(id: 0, ids: "", typeInt: String(item.typeInt), planId: "", planIds: item.id))
            default:
                break
            }
        }
        switch flag {
        case 0:
            self.totalList = self.yesterdayList
            self.getGuideDutiesList = self.getGuideDutiesYesterdayList
        case 1:
            self.totalList = self.todayList
            self.getGuideDutiesList = self.getGuideDutiesTodayList
        case 2:
            self.totalList = self.tomorrowList
            self.getGuideDutiesList = self.getGuideDutiesTomorrowList
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
        case ShortCode.EXC.rawValue:
            viewController.lineColor = UIColor.excursionColor
            viewController.shortCode = ShortCode.EXC.rawValue
            viewController.serviceType = ServiceType.EXC.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.ids = self.getGuideDutiesList[indexPath.row].ids
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.COL.rawValue:
            viewController.lineColor = UIColor.collectionColor
            viewController.shortCode = ShortCode.COL.rawValue
            viewController.serviceType = ServiceType.COL.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.ids = self.getGuideDutiesList[indexPath.row].ids
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.DEL.rawValue:
            viewController.lineColor = UIColor.deliveryColor
            viewController.shortCode = ShortCode.DEL.rawValue
            viewController.serviceType = ServiceType.DEL.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.ids = self.getGuideDutiesList[indexPath.row].ids
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.ARR.rawValue:
            viewController.lineColor = UIColor.arrivalColor
            viewController.shortCode = ShortCode.ARR.rawValue
            viewController.serviceType = ServiceType.ARR.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.planId = String(self.getGuideDutiesList[indexPath.row].planId)
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.DEP.rawValue:
            viewController.lineColor = UIColor.departureColor
            viewController.shortCode = ShortCode.DEP.rawValue
            viewController.serviceType = ServiceType.DEP.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.planId = String(self.getGuideDutiesList[indexPath.row].planId)
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.SHOP.rawValue:
            viewController.lineColor = UIColor.indShopForMobileColor
            viewController.shortCode = ShortCode.SHOP.rawValue
            viewController.serviceType = ServiceType.SHOP.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.planIds = self.getGuideDutiesList[indexPath.row].planIds
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.INT.rawValue:
            viewController.lineColor = UIColor.internColor
            viewController.shortCode = ShortCode.INT.rawValue
            viewController.serviceType = ServiceType.INT.rawValue
            viewController.workNo = self.totalList[indexPath.row].workNo
            viewController.excursionName = self.totalList[indexPath.row].excursion
            viewController.id = self.getGuideDutiesList[indexPath.row].id
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
            topVC?.otiPushViewController(viewController: viewController)
        case ShortCode.INFO.rawValue:
            let viewController = TasksPaxViewController()
            viewController.hotelName = self.totalList[indexPath.row].meetingPointAndTime
            viewController.workNo = self.workNo
            viewController.serviceType = ServiceType.INFO.rawValue
            viewController.excursionName = self.excursionName
            viewController.infoPlanId = self.getGuideDutiesList[indexPath.row].planId
            viewController.typeInt = String(self.getGuideDutiesList[indexPath.row].typeInt)
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
        self.totalList.removeAll()
        self.getGuideDutiesList.removeAll()
        self.flag = 0
        self.getGuideDutiesService()
    }
    
    func tappedToday(){
        self.totalList.removeAll()
        self.getGuideDutiesList.removeAll()
        self.flag = 1
        self.getGuideDutiesService()
    }
    
    func tappedTomorrow(){
        self.totalList.removeAll()
        self.getGuideDutiesList.removeAll()
        self.flag = 2
        self.getGuideDutiesService()
    }
    
    func tappedSH(){
        self.totalList.removeAll()
        self.flag = 3
        getGuideDutiesService()
    }
}

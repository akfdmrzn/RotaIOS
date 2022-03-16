//
//  TasksTourDetailViewController.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import UIKit

class TasksTourDetailViewController: BaseViewController {
    @IBOutlet weak var tableViewTasksTourDetail: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    public var ids: String = ""
    public var typeInt: String = ""
    var tourDetailList: [TourDetailList] = [] {
        didSet {
            self.tableViewTasksTourDetail.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksTourDetail.contentSize.height
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksTourDetail.delegate = self
        self.tableViewTasksTourDetail.dataSource = self
        self.tableViewTasksTourDetail.register(TasksTourDetailTableViewCell.nib, forCellReuseIdentifier: TasksTourDetailTableViewCell.identifier)
        self.getTourEventDetail()
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tableViewTasksTourDetail.contentSize.height
    }
    
    func getTourEventDetail(){
        let getTourEventDetailRequestModel = GetTourEventDetailRequestModel.init(ids: self.ids, typeInt: self.typeInt)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetTourEventDetail, method: .get, parameters: getTourEventDetailRequestModel.requestPathString()) { (response : [GetTourEventDetailResponseModel]) in
            if response.count > 0 {
                self.tourDetailList.append(TourDetailList.init(id: "", plate: "Plate", driver: "Driver Name", driverPhone: "Driver Phone", guideName: "Guide Name", guidePhone: "Guide Phone", meetingPoint: "Meeting Point", typeInt: "Type", vehicleNo: "Vehicle No", kokartGuideName: "Kokart Guide Name", kokartGuidePhone: "Kokart Guide Phone", plate_ColOrDes: "", drive_ColOrDes: "", driverPhone_ColOrDes: "", meetingPoint_ColOrDes: "", col: [], del: [], exc: []))
                for item in response {
                    self.tourDetailList.append(TourDetailList.init(id: item.id, plate: item.plate == "" ? "-" : item.plate, driver: item.driver == "" ? "-" : item.driver, driverPhone: item.driverPhone == "" ? "-" : item.driverPhone, guideName: item.guideName == "" ? "-" : item.guideName, guidePhone: item.guidePhone == "" ? "-" : item.guideName, meetingPoint: item.meetingPoint == "" ? "-" : item.meetingPoint, typeInt: String(item.typeInt) == "0" ? "-" : String(item.typeInt), vehicleNo: String(item.vehicleNo) == "0" ? "0" : String(item.vehicleNo), kokartGuideName: item.kokartGuideName == "" ? "-" : item.kokartGuideName, kokartGuidePhone: item.kokartGuidePhone == "" ? "-" : item.kokartGuidePhone, plate_ColOrDes: item.plate_ColOrDes, drive_ColOrDes: item.drive_ColOrDes, driverPhone_ColOrDes: item.driverPhone_ColOrDes, meetingPoint_ColOrDes: item.meetingPoint_ColOrDes, col: item.col, del: item.del, exc: item.exc))
                }
            }else {
               print("error")
            }
        }
    }
}

extension TasksTourDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tourDetailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksTourDetailTableViewCell.identifier, for: indexPath) as! TasksTourDetailTableViewCell
        if indexPath.row == 0{
            cell.labelTypeInt.text = self.tourDetailList[indexPath.row].typeInt
            cell.labelTypeInt.textColor = .noteGrayColor
            cell.labelPlate.textColor = .noteGrayColor
            cell.labelDriver.textColor = .noteGrayColor
            cell.labelDriverPhone.textColor = .noteGrayColor
            cell.labelMeetinPoint.textColor = .noteGrayColor
            cell.labelVehicleNo.textColor = .noteGrayColor
            cell.labelGuideName.textColor = .noteGrayColor
            cell.labelGuidePhone.textColor = .noteGrayColor
            cell.labelKokartGuideName.textColor = .noteGrayColor
            cell.labelKokartGuidePhone.textColor = .noteGrayColor
        }
        else{
            cell.labelTypeInt.textColor = .white
            cell.labelPlate.textColor = .white
            cell.labelDriver.textColor = .white
            cell.labelDriverPhone.textColor = .white
            cell.labelMeetinPoint.textColor = .white
            cell.labelVehicleNo.textColor = .white
            cell.labelGuideName.textColor = .white
            cell.labelGuidePhone.textColor = .white
            cell.labelKokartGuideName.textColor = .white
            cell.labelKokartGuidePhone.textColor = .white
            if self.tourDetailList[indexPath.row].typeInt != "1" {
                cell.labelTypeInt.text = self.tourDetailList[indexPath.row].typeInt == "2" ? "COL" : "DEL"
            }
            else{
                cell.labelTypeInt.text = "EXC"
            }
        }
        cell.labelPlate.text = self.tourDetailList[indexPath.row].plate
        cell.labelDriver.text = self.tourDetailList[indexPath.row].driver
        cell.labelDriverPhone.text = self.tourDetailList[indexPath.row].driverPhone
        cell.labelMeetinPoint.text = self.tourDetailList[indexPath.row].meetingPoint_ColOrDes
        cell.labelVehicleNo.text = self.tourDetailList[indexPath.row].vehicleNo
        cell.labelGuideName.text = self.tourDetailList[indexPath.row].guideName
        cell.labelGuidePhone.text = self.tourDetailList[indexPath.row].guidePhone
        cell.labelKokartGuideName.text = self.tourDetailList[indexPath.row].kokartGuideName
        cell.labelKokartGuidePhone.text = self.tourDetailList[indexPath.row].kokartGuidePhone
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

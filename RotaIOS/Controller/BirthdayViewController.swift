//
//  BirthdayViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 31.03.2022.
//

import UIKit

class BirthdayViewController: UIViewController {
    @IBOutlet var birthDayView: BirthdayView!
    @IBOutlet weak var tableView: UITableView!
    var currentDate = ""
    var hotelList : [GetHotelsMobileResponseModel] = []
    var hotelIdList : [String] = []
    var hotelIds = ""
    var birtDayList : [GetBirtDaysResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentDate = userDefaultsData.getSaleDate() ?? ""
        
        let getHotelsMobileRequestModel = GetHotelsMobileRequestModel.init(userId: userDefaultsData.getGuideId(), saleDate: self.currentDate)
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetHotelsMobie, method: .get, parameters: getHotelsMobileRequestModel.requestPathString()) { (response : [GetHotelsMobileResponseModel] ) in
            if response.count > 0 {
                //   let filter = response.filter{($0.text?.contains("ADONIS HOTEL ANTALYA") ?? false)}
                self.hotelList = response
              
                let filtered = response.filter({return ($0.guideHotel != 0)})
                print("\(filtered)")
                var tempGuideNumber = 0
                
                if filtered.count > 0 {
                    tempGuideNumber = filtered[0].guideHotel ?? 0
                }
                
                if  tempGuideNumber != 0 {
                    self.hotelList = filtered
                    if self.hotelList.count > 0 {
                        for i in 0...self.hotelList.count - 1 {
                            self.hotelIdList.append(String(self.hotelList[i].value ?? 0))
                        }
                        self.hotelIds = self.hotelIdList.joined(separator: ",")
                    }
                    
                    let getBirtDayReqModel = GetBirthDaysRequestModel.init(date: self.currentDate, hotelIds: self.hotelIds)
                    NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetBirthDays, method: .get, parameters: getBirtDayReqModel.requestPathString()) { (response : [GetBirtDaysResponseModel] ) in
                        if response.count > 0 {
                           
                            self.birtDayList = response
                            self.tableView.reloadData()
                  
                        }else{
                            print("data has not recived")
                        }
                    }
                    
                }
      
            }else{
                print("data has not recived")
            }
        }
        

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(BirtDayTableViewCell.nib, forCellReuseIdentifier: BirtDayTableViewCell.identifier)
    }

}

extension BirthdayViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.birtDayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BirtDayTableViewCell.identifier) as! BirtDayTableViewCell
        cell.labelMarket.text = self.birtDayList[indexPath.row].Market ?? ""
        cell.labelPaxType.text = self.birtDayList[indexPath.row].PaxType ?? ""
        cell.labelAgeGroup.text = self.birtDayList[indexPath.row].AgeGroup ?? ""
        cell.labelTouristName.text = self.birtDayList[indexPath.row].Name ?? ""
        return cell
    }
}

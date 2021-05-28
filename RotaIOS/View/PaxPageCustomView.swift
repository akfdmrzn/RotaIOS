//
//  PaxPageCustomView.swift
//  Rota
//
//  Created by Yasin Dalkilic on 21.04.2021.
//

import Foundation

import UIKit

protocol PaxesListDelegate {
    func paxesList(ischosen : Bool, sendingPaxesLis : [Paxes])
}

class PaxPageCustomView : UIView {
    
    var touristAddView : TouristAddCustomView?
    var tempTouristAddView : TempTouristAddCustomView?
    var addManuelListView : AddManuelTouristCustomView?
    var remember = true
    var isFilteredTextEmpty = true
    var filteredData : [String] = []
    var paxesListDelegate : PaxesListDelegate?
    var counter = 0
    var nameList : [String] = []
    var paxesNameList :[GetInHoseListResponseModel] = []
    var filteredPaxesList : [GetInHoseListResponseModel] = []
    var tempNameList : [String] = []
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewTouristAdded: UIView!
    @IBOutlet weak var labelTouristAdded: UILabel!
    var paxesListinPaxPage : [Paxes] = []
    var touristInfoList : [GetTouristInfoResponseModel] = []
    var getInTouristInfoRequestModelList : GetTouristInfoRequestModel?
    var paxID : [String] = [] //kullanıp kullanılmayacağı belli değil 0 aldım
    var oprID : [Int] = []
    var oprName : [String] = []
    //  var oprType : [Int] = [] // ne olduğu belli değil 1 aldım
    var reservationNo : [String] = []
    var hotelName : [String] = []
    var ageGroup : [String] = []
    var name : [String] = []
    var birthDay : [String] = []
    var passport : [String] = []
    var touristIdRef : [Int] = []
    var sendingListofPaxes : [Paxes] = []
    var paxesList : [Paxes] = []
    var equalableFilteredPaxList : [String] = []
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: PaxPageCustomView.self), owner: self, options: nil)
        self.headerView.addCustomContainerView(self)
        self.headerView.backgroundColor = UIColor.mainViewColor
        
        let getInHouseListRequestModel = GetInHouseListRequestModel(hotelId: userDefaultsData.getHotelId(), marketId: userDefaultsData.getMarketId())
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetInHouseList, method: .get, parameters: getInHouseListRequestModel.requestPathString()) { (response : [GetInHoseListResponseModel] ) in
            
            if response.count > 0 {
                print(response)
                //   let filter = response.filter{($0.text?.contains("ADONIS HOTEL ANTALYA") ?? false)}
                
                self.paxesNameList = response
                
                for listofArray in self.paxesNameList {
                    self.nameList.append(listofArray.text ?? "")
                }
                self.filteredData = self.nameList 
                print(self.nameList)
                
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
   
            }else{
                print("data has not recived")
            }
        }
        
        self.viewTouristAdded.layer.borderWidth = 1
        self.viewTouristAdded.layer.borderColor = UIColor.green.cgColor
        self.viewTouristAdded.layer.cornerRadius = 10
     
        self.searchBar.setImage(UIImage(), for: .search, state: .normal)
        self.searchBar.layer.cornerRadius = 10
    
        self.searchBar.compatibleSearchTextField.textColor = UIColor.white
        self.searchBar.compatibleSearchTextField.backgroundColor = UIColor.mainTextColor
        
        self.searchBar.delegate = self
        
        self.tableView.register(PaxPageTableViewCell.nib, forCellReuseIdentifier: PaxPageTableViewCell.identifier)
     
      
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.viewTouristAdded.addGestureRecognizer(tap)
        self.viewTouristAdded.isUserInteractionEnabled = true
        
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.alwaysBounceVertical = true
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshPaxses), for: .valueChanged)
       

    }
    
    @objc func refreshPaxses() {
        print("refresing")
      
       
        self.nameList.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            for listofArray in self.paxesNameList {
                self.nameList.append(listofArray.text ?? "")
            }
            self.filteredData = self.nameList
            print(self.nameList)
          
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
        
    }


  
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
 if let topVC = UIApplication.getTopViewController() {
     
     UIView.animate(withDuration: 0, animations: {
         self.tempTouristAddView = TempTouristAddCustomView()
         self.tempTouristAddView?.nameListed = self.tempNameList
         self.tempTouristAddView?.temppAddPaxesListDelegate = self
         self.tempTouristAddView!.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 1200)
         topVC.view.addSubview(self.tempTouristAddView!)
     }, completion: { (finished) in
         if finished{
             
         }
     })

    
 }
    }
}

extension PaxPageCustomView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            if isFilteredTextEmpty == false {
              
                 return self.filteredData.count
             }else{
               
                return self.nameList.count
             }
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PaxPageTableViewCell.identifier) as! PaxPageTableViewCell
        cell.paxPageCounterDelegate = self
        if isFilteredTextEmpty == false {
            if self.filteredData.count > 0 {
                cell.labelPaxNameListCell.text = filteredData[indexPath.row]
            }else{
                self.tableView.reloadData()
            }
        }else{
            if self.nameList.count > 0 {
                cell.labelPaxNameListCell.text = nameList[indexPath.row]
               
            }else{
                self.tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.nameList.count > 0 {
            let selectedName = nameList[indexPath.row]
            
           let filterSelectedName = self.paxesNameList.filter{($0.text?.elementsEqual(selectedName) ?? false)}
            
            let filterResNo = self.paxesNameList.filter{($0.resNo?.elementsEqual((filterSelectedName[0].resNo ?? "")) ?? false)}
            
            self.nameList.removeAll()
            
            for i in 0...(filterResNo.count) - 1 {
                
                self.nameList.append(filterResNo[i].text ?? "")
            }
            
            self.tableView.reloadData()
            
          
        }else{
            print("selected")
        }
      
    }
}

extension PaxPageCustomView : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  
        self.filteredData = []
        
        if searchText.elementsEqual(""){
            self.isFilteredTextEmpty = true
            self.filteredData = nameList
        }else {
            self.isFilteredTextEmpty = false
            for data in nameList{
                if data.description.lowercased().contains(searchText.lowercased()){
                    self.filteredData.append(data)
                }
            }
        }
        self.tableView.reloadData()
    }

}
extension PaxPageCustomView : PaxPageCounterDelegate {
    
    func checkboxCounter(checkCounter: Bool, touristName: String) {
      //  self.filteredPaxesList.removeAll()
        let filter = self.paxesNameList.filter{($0.text?.elementsEqual(touristName) ?? false)}
        if checkCounter {
            
            self.counter += 1
            print(self.counter)
            self.labelTouristAdded.text = "\(counter) Tourist Added"
            self.tempNameList.append(touristName)
            self.filteredPaxesList.append(filter[0])
        }
        else{
            self.counter -= 1
            print(self.counter)
            self.labelTouristAdded.text = "\(counter) Tourist Added"
            var tempIndex = 0
            for item in self.tempNameList {
                if item.elementsEqual(touristName) {
                    self.tempNameList.remove(object: touristName)

                    break
                }
                
            }
            
            for item in self.filteredPaxesList {
                if ((item.text?.elementsEqual(touristName)) != nil) {
                  self.filteredPaxesList.remove(at: tempIndex)
                   // let filter = self.filteredPaxesList.filter{($0.text?.elementsEqual(touristName) ?? false)}
        
                    break
                }
            }
            tempIndex += 1
        }
       
        var touristId : [Int] = []
        var resNo : [String] = []
        var tempGetInTouristInfoRequestModel : [GetTouristInfoRequestModel] = []
        
        touristId.removeAll()
        resNo.removeAll()
        
        if self.filteredPaxesList.count > 0 {
            for listarray in self.filteredPaxesList {
                touristId.append(listarray.value ?? 0)
                resNo.append(listarray.resNo ?? "")
            }
            
            tempGetInTouristInfoRequestModel.removeAll()
            
            for i in 0...filteredPaxesList.count - 1 {
                tempGetInTouristInfoRequestModel.append(GetTouristInfoRequestModel(touristId: touristId[i], resNo: resNo[i]))
            }
            
            self.getInTouristInfoRequestModelList = tempGetInTouristInfoRequestModel[0]
            
           
            NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetTouristInfo, method: .get, parameters: getInTouristInfoRequestModelList?.requestPathString() ?? "") { (response : [GetTouristInfoResponseModel] ) in
                    
                    if response.count > 0 {
                        print(response)
                        // let filter = response.filter{($0.text?.contains("ADONIS HOTEL ANTALYA") ?? false)}
                        
                        self.touristInfoList = response
                        
                        for listarray in self.touristInfoList {
                           // self.paxID.append(listarray.id ?? "")
                            self.oprID.append(listarray.oprId ?? 0)
                            self.oprName.append(listarray.operator ?? "")
                            self.reservationNo.append(listarray.resNo ?? "")
                            self.hotelName.append(listarray.hotelName ?? "")
                            self.ageGroup.append(listarray.ageGroup ?? "")
                            self.name.append(listarray.name ?? "")
                            self.birthDay.append(listarray.birthDay ?? "")
                            self.passport.append(listarray.passport ?? "")
                            self.touristIdRef.append(listarray.touristIdRef ?? 0)
                        }
                        
                        for i in 0...(self.touristInfoList.count) - 1 {
                            
                            self.paxesList.append(Paxes( pAX_CHECKOUT_DATE: "",  pAX_OPRID: self.oprID[i], pAX_OPRNAME: self.oprName[i], pAX_PHONE: "", hotelname: self.hotelName[i], pAX_GENDER: "MRS.", pAX_AGEGROUP: self.ageGroup[i], pAX_NAME: self.name[i], pAX_BIRTHDAY: self.birthDay[i], pAX_RESNO: self.reservationNo[i], pAX_PASSPORT: self.passport[i], pAX_ROOM: "1", pAX_TOURISTREF:self.touristIdRef[i], pAX_STATUS: 1 ))
                            
                            self.sendingListofPaxes.append(self.paxesList[i])
                        }
                        self.paxesListDelegate?.paxesList(ischosen: false, sendingPaxesLis: self.sendingListofPaxes)
                      
                        
                    }else{
                        print("data has not recived")
                    }
                }
            
            
        }
        print(filteredPaxesList)
    
    }
    
}

extension PaxPageCustomView : TempAddPaxesListDelegate {
    func tempAddList(listofpaxes: [Paxes]) {
        self.paxesListinPaxPage.removeAll()
        for listofArray in listofpaxes {
            self.paxesListinPaxPage.append(listofArray)
        }
        self.paxesListDelegate?.paxesList(ischosen: false, sendingPaxesLis: self.paxesListinPaxPage)
    }
    
    
}
    






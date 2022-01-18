//
//  TasksPaxViewController.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import UIKit

class TasksPaxViewController: BaseViewController {
    enum ServiceType: Int {
        case COLDEL = 1
        case EXC = 2
        case ARRDEP = 3
        case SHOP = 4
        case INT = 5
        case INFO = 6
    }
    
    @IBOutlet weak var labelWorkNo: UILabel!
    @IBOutlet weak var labelHotelName: UILabel!
    @IBOutlet weak var labelExcursionName: UILabel!
    @IBOutlet weak var collectionViewTasksPax: UICollectionView!
    @IBOutlet weak var tasksPaxInfoCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelPax: UILabel!
    var serviceType: Int?
    var workNo: String?
    var hotelName: String?
    var excursionName: String?
    var paxList: [PaxList] = []{
        didSet{
            self.tasksPaxInfoCollectionViewHeightConstraint.constant = self.collectionViewTasksPax.contentSize.height + 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewTasksPax.delegate = self
        self.collectionViewTasksPax.dataSource = self
        self.collectionViewTasksPax.register(TasksPaxCollectionViewCell.nib, forCellWithReuseIdentifier: TasksPaxCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionViewTasksPax.collectionViewLayout = layout
        self.labelWorkNo.text = "aswad"
        self.labelHotelName.text = self.hotelName
        self.labelExcursionName.text = self.excursionName
        self.labelPax.text = "Pax".localizedCapitalized
        getIndShopPaxesService()
        
        /*switch self.serviceType {
        case ServiceType.COLDEL.rawValue:
            self.getColAndDelPaxesService()
        case ServiceType.EXC.rawValue:
            self.getTourPaxesService()
        case ServiceType.ARRDEP.rawValue:
            self.getArrAndDepPaxesService()
        case ServiceType.SHOP.rawValue:
            self.getIndShopPaxesService()
        case ServiceType.INT.rawValue:
            self.getInterPaxesService()
        case ServiceType.INFO.rawValue:
            self.getInfoPaxesService()
        default:
            break
        }*/
    }

    override func viewWillLayoutSubviews() {
        self.tasksPaxInfoCollectionViewHeightConstraint.constant = self.collectionViewTasksPax.contentSize.height + 20
    }
    
    func getInterPaxesService(){
        let getInterPaxesRequestModel = GetInterPaxesRequestModel.init(id: 433742)
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetInterPaxes, method: .get, parameters: getInterPaxesRequestModel.requestPathString()) { (response : [GetInterPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    
                }
            }else {
               print("error")
            }
        }
    }
    
    func getInfoPaxesService(){
        let getInfoPaxesRequestModel = GetInfoPaxesRequestModel.init(infoPlanId: "874717")
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetInfoPaxes, method: .get, parameters: getInfoPaxesRequestModel.requestPathString()) { (response : [GetInfoPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    
                }
            }else {
               print("error")
            }
        }
    }
    
    func getArrAndDepPaxesService(){
        let getArrAndDepPaxesRequestModel = GetArrAndDepPaxesRequestModel.init(planId: "433871", hotelId: "8119", typeInt: "4")
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetArrAndDepPaxes, method: .get, parameters: getArrAndDepPaxesRequestModel.requestPathString()) { (response : [GetArrAndDepPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    
                }
            }else {
               print("error")
            }
        }
    }
    
    func getTourPaxesService(){
        let getArrAndDepPaxesRequestModel = GetTourPaxesRequestModel.init(planId: "505455", hotelId: "3435")
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetTourPaxes, method: .get, parameters: getArrAndDepPaxesRequestModel.requestPathString()) { (response : [GetTourPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    
                }
            }else {
               print("error")
            }
        }
    }
    
    func getColAndDelPaxesService(){
        let getColAndDelPaxesRequestModel = GetColAndDelPaxesRequestModel.init(planId: "505271", hotelId: "630", typeId: "2")
            NetworkManager.sendGetRequestArray(url: "https://rota.odeontours.com", endPoint: .GetColAndDelPaxes, method: .get, parameters: getColAndDelPaxesRequestModel.requestPathString()) { (response : [GetTourPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    
                }
            }else {
               print("error")
            }
        }
    }
    
    func getIndShopPaxesService(){
        let getIndShopPaxesRequestModel = GetIndShopPaxesRequestModel.init(planId: "15257", hotelId: "506", typeInt: 10)
            NetworkManager.sendGetRequestArray(url: "https://rota-eg.odeontours.com", endPoint: .GetIndShopPaxes, method: .get, parameters: getIndShopPaxesRequestModel.requestPathString()) { (response : [GetIndShopPaxesResponseModel]) in
            if response.count > 0 {
                for item in response {
                    self.paxList.append(PaxList.init(paxName: item.name, ageGroup: item.ageGroup, incResNo: String(item.incResNo), operator_: item.operatorList, voucherNo: item.voucherNo, room: item.room, oprResNo: String(item.oprResNo), noShow: String(item.show), infoRep: item.infoRep, guideNote: item.shoppingGuideNote))
                }
                self.collectionViewTasksPax.reloadData()
            }else {
               print("error")
            }
        }
    }
}

extension TasksPaxViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.paxList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:TasksPaxCollectionViewCell.identifier,for: indexPath) as! TasksPaxCollectionViewCell
          //cell.setInfo(paxName: self.paxList[indexPath.row].paxName, ageGroup: "", incResNo: "", operator_: self.paxList[indexPath.row].operatorList, voucherNo: self.paxList[indexPath.row].voucherNo, room: self.paxList[indexPath.row].room, oprResNo: self.paxList[indexPath.row].oprResNo, noShow: self.paxList[indexPath.row].show, infoRep: self.paxList[indexPath.row].infoRep, guideNote: self.paxList[indexPath.row].shoppingGuideNote)
          return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 1500.0, height: self.collectionViewTasksPax.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

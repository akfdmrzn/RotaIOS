//
//  AddManuelTouristCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.05.2021.
//


import Foundation
import UIKit
import DropDown

protocol SaveManuelListProtocol {
    func saveManuelList(manuelList : Paxes )
}

class AddManuelTouristCustomView : UIView {
    
    
    var genderMenu = DropDown()
    var genderList = ["MR.","MS."]
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var viewSlideUp: UIView!
    @IBOutlet weak var viewGender: MainTextCustomView!
    @IBOutlet weak var viewName: MainTextCustomView!
    @IBOutlet weak var viewBirthDay: MainTextCustomView!
    @IBOutlet weak var viewOperator: MainTextCustomView!
    @IBOutlet weak var viewRoom: MainTextCustomView!
    @IBOutlet weak var viewPhone: MainTextCustomView!
    @IBOutlet weak var viewCheckOut: MainTextCustomView!
    @IBOutlet weak var buttonAdd: UIButton!
    var tempTouristAddCustomView : TempTouristAddCustomView?
    var tempSaveManuelList : [String] = []
    var saveMAnuelListDelegate : SaveManuelListProtocol?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: AddManuelTouristCustomView.self), owner: self, options: nil)
        self.headerView.addCustomContainerView(self)
        
        self.genderMenu.dataSource = self.genderList
        self.genderMenu.backgroundColor = UIColor.grayColor
        self.genderMenu.separatorColor = UIColor.gray
        self.genderMenu.textColor = .white
        self.genderMenu.anchorView = self.viewGender.mainLabel
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTappedItem))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTouchesRequired = 1
        self.viewGender.addGestureRecognizer(gesture)
        
        self.contentView.backgroundColor = UIColor.mainViewColor
        
        self.genderMenu.selectionAction = { index, title in
            self.viewGender.mainLabel.text = title
            
        }
        
        self.contentView.backgroundColor = UIColor.mainViewColor
        self.buttonAdd.layer.cornerRadius = 10
        self.buttonAdd.layer.masksToBounds = true
        self.buttonAdd.backgroundColor = UIColor.greenColor
        
        self.viewGender.headerLAbel.text = "Gender"
        self.viewName.headerLAbel.text = "Name"
        self.viewBirthDay.headerLAbel.text = "BirthDate"
        self.viewOperator.headerLAbel.text = "Operator"
        self.viewRoom.headerLAbel.text = "Room"
        self.viewPhone.headerLAbel.text = "Phone"
        self.viewCheckOut.headerLAbel.text = "Check Out Date"
        
        
        self.viewName.mainLabel.isHidden = true
        self.viewName.mainText.isHidden = false
        self.viewName.imageMainText.isHidden = true
        self.viewBirthDay.imageMainText.isHidden = true
        self.viewBirthDay.mainLabel.isHidden = true
        self.viewBirthDay.mainText.isHidden = false
        self.viewOperator.mainText.isHidden = false
        self.viewOperator.mainLabel.isHidden = true
        self.viewOperator.imageMainText.isHidden = true
        self.viewRoom.mainLabel.isHidden = true
        self.viewRoom.mainText.isHidden = false
        self.viewRoom.imageMainText.isHidden = true
        self.viewPhone.imageMainText.isHidden = true
        self.viewPhone.mainLabel.isHidden = true
        self.viewCheckOut.mainText.isHidden = false
        self.viewCheckOut.imageMainText.isHidden = true
        self.viewCheckOut.mainLabel.isHidden = true
        self.viewCheckOut.mainText.isHidden = false
   
        
    }
    @objc func didTappedItem() {
        self.genderMenu.show()
        
    }
    
    
    
    @IBAction func addManuelButton(_ sender: Any) {
        
        //  self.tempSaveManuelList.append(self.viewGender.mainLabel.text ?? "")
      //  self.tempSaveManuelList.append(self.viewName.mainText.text ?? "")
        // self.tempSaveManuelList.append(self.viewBirthDay.mainText.text ?? "")
        // self.tempSaveManuelList.append(self.viewOperator.mainText.text ?? "")
        // self.tempSaveManuelList.append(self.viewRoom.mainText.text ?? "")
        // self.tempSaveManuelList.append(self.viewPhone.mainText.text ?? "")
        // self.tempSaveManuelList.append(self.viewCheckOut.mainText.text ?? "")
        
        
        let manuelAddPaxName = Paxes.init(pAX_CHECKOUT_DATE: self.viewCheckOut.mainText.text ?? "", pAX_OPRID: 0, pAX_OPRNAME: "", pAX_PHONE: self.viewPhone.mainText.text ?? "", hotelname: "", pAX_GENDER: self.viewGender.mainLabel.text ?? "" , pAX_AGEGROUP: "", pAX_NAME: self.viewName.mainText.text ?? "", pAX_BIRTHDAY: self.viewBirthDay.mainText.text ?? "", pAX_RESNO: "", pAX_PASSPORT: "", pAX_ROOM: self.viewRoom.mainText.text ?? "", pAX_TOURISTREF: 0, pAX_STATUS: 1)
        
        self.saveMAnuelListDelegate?.saveManuelList(manuelList: manuelAddPaxName)
        
    
        self.removeFromSuperview()
    }
}



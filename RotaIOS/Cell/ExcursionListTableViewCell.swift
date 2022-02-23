//
//  ExcursionListTableViewCell.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 3.12.2021.
//

import UIKit

protocol ExcursionListTableViewCellDelegate {
    func checkBoxTapped(checkCounter : Bool, tourid : Int, tourDate : String, tempPaxes : GetSearchTourResponseModel, priceTypeDesc : Int, pickUpTime : String, labelNameTapped : Bool)
}

class ExcursionListTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var imageCheckBox: UIImageView!
    @IBOutlet weak var labelExcursion: UILabel!
    @IBOutlet weak var labelTourdate: UILabel!
    @IBOutlet weak var labelPriceType: UILabel!
    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelAdultPrice: UILabel!
    @IBOutlet weak var labelChildPrice: UILabel!
    @IBOutlet weak var labelInfantPrice: UILabel!
    @IBOutlet weak var labelToodlePrice: UILabel!
    @IBOutlet weak var labelMinPrice: UILabel!
    @IBOutlet weak var labelMinPax: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var labelFlatPricw: UILabel!
    @IBOutlet weak var labelPickUpTime: UILabel!
    var excursionListInCell : GetSearchTourResponseModel?
    var excursionListTableViewCellDelegate : ExcursionListTableViewCellDelegate?
    var isTappedCheck = false
    var tourid = 0
    var priceTypeDesc = 0
    var pickuptime = ""
    var tourDate = ""
    @IBOutlet weak var textPickUpTime: UITextField!
    var timeString = ""
    var nameLabelTapped = false
    
    var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.locale = Locale.init(identifier: "en_GB")
        if #available(iOS 13.4, *) {
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return timePicker
    }()
    
    var timePickerToolBar: UIView = {
                let toolBar = UIToolbar()
                toolBar.barStyle = UIBarStyle.default
                toolBar.isTranslucent = true
                toolBar.tintColor = UIColor.black
                toolBar.sizeToFit()
                
                let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
                let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
                toolBar.setItems([cancelButton, flexSpace, doneButton], animated: false)
                return toolBar
        }()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.imageCheckBox.image = UIImage(named: "square")
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedChecBox))
        self.imageCheckBox.isUserInteractionEnabled = true
        self.imageCheckBox.addGestureRecognizer(gesture)
      /*  let gestureLabel = UITapGestureRecognizer(target: self, action: #selector(tappedChecBox))
        self.labelExcursion.isUserInteractionEnabled = true
        self.labelExcursion.addGestureRecognizer(gestureLabel)*/
     
        self.labelPickUpTime.isHidden = true
        
        self.textPickUpTime.inputView = timePicker
             let toolBar = UIToolbar()
             toolBar.barStyle = UIBarStyle.default
             toolBar.isTranslucent = true
             toolBar.tintColor = UIColor.black
             toolBar.sizeToFit()
             
             let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
             let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
             let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
             toolBar.setItems([cancelButton, flexSpace, doneButton], animated: false)
             toolBar.isUserInteractionEnabled = true
             self.textPickUpTime.inputAccessoryView = toolBar
    }
    
    
    @objc func cancelButtonTapped(){
        self.viewContentView.endEditing(true)
    }
    
    @objc func doneButtonTapped(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "HH:mm"
        self.textPickUpTime.text = "\(formatter.string(for: timePicker.date) ?? "00:00")"
        self.textPickUpTime.endEditing(true)
        print(formatter.string(from: timePicker.date))
        self.timeString = formatter.string(from: self.timePicker.date)
        self.pickuptime = self.timeString
        self.excursionListTableViewCellDelegate?.checkBoxTapped(checkCounter: self.isTappedCheck, tourid: self.tourid, tourDate: self.tourDate, tempPaxes: self.excursionListInCell!, priceTypeDesc : self.priceTypeDesc, pickUpTime: self.timeString, labelNameTapped: self.nameLabelTapped)
        self.viewContentView.endEditing(true)
        
    }
    
    @objc func tappedChecBox(){
        self.isTappedCheck = !self.isTappedCheck
     //   self.nameLabelTapped = !self.nameLabelTapped
        self.excursionListTableViewCellDelegate?.checkBoxTapped(checkCounter: self.isTappedCheck, tourid: self.tourid, tourDate: self.tourDate, tempPaxes: self.excursionListInCell!, priceTypeDesc : self.priceTypeDesc, pickUpTime: self.pickuptime, labelNameTapped: self.nameLabelTapped)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if self.isTappedCheck == true{
            print(tourid)
            self.imageCheckBox.image = UIImage(named: "check")
        }else {
            self.imageCheckBox.image = UIImage(named: "square")
        }
    }
    
}

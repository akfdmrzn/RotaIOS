//
//  PickerView.swift
//  RotaIOS
//
//  Created by odeon on 11.03.2022.
//

import Foundation
import UIKit

protocol PickerViewDelegate {
    func selectCompany(id: String, name: String)
}

class PickerView : UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var textFieldCompanyUser: UITextField!
    var pickerViewCompany : UIPickerView?
    var list: [PickerList] = []
    var id: String = ""
    var delegate: PickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: PickerView.self), owner: self, options: nil)
        self.view.addCustomContainerView(self)
        self.setPickerConfigure()
        self.textFieldCompanyUser.text = ""
    }
    
    func setPickerConfigure(){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapDoneBtnCountry))
        toolBar.setItems([flexSpace,doneButton], animated: false)
        self.pickerViewCompany = UIPickerView.init()
        self.pickerViewCompany?.delegate = self
        self.pickerViewCompany?.dataSource = self
        self.textFieldCompanyUser.inputAccessoryView = toolBar
        self.textFieldCompanyUser.inputView = self.pickerViewCompany
    }
    
    @objc func didTapDoneBtnCountry() {
        self.endEditing(true)
    }
}

extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.pickerViewCompany {
            return self.list.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.pickerViewCompany {
            self.textFieldCompanyUser.text = self.list[row].name
            self.id = self.list[row].id
            self.delegate?.selectCompany(id: self.list[row].id, name: self.list[row].name)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.pickerViewCompany {
            self.id = self.list[row].id
            return self.list[row].name
        }
        else{
            return ""
        }
    }
}

struct PickerList{
    var id: String = ""
    var name: String = ""
    
    mutating func setInfo(id: String, name: String){
        self.id = id
        self.name = name
    }
}

//
//  TasksGoShowViewController.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import UIKit
import Alamofire

class TasksGoShowViewController: BaseViewController {
    
    @IBOutlet weak var textFieldVoucher: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var tableViewTasksGoShow: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    
    var date: Date?
    var hotelId: String?
    var planId: String?
    var ind: Int = -1
    var goShowList: [GoShowList] = [] {
        didSet {
            self.tableViewTasksGoShow.reloadData()
            self.tasksTableViewHeightConstraint.constant = self.tableViewTasksGoShow.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTasksGoShow.delegate = self
        self.tableViewTasksGoShow.dataSource = self
        self.tableViewTasksGoShow.register(TasksGoShowTableViewCell.nib, forCellReuseIdentifier: TasksGoShowTableViewCell.identifier)
        self.textFieldDate.inputAccessoryView = datePickerToolBar
        self.textFieldDate.inputView = datePicker
    }
    
    override func viewWillLayoutSubviews() {
        self.tasksTableViewHeightConstraint.constant = self.tableViewTasksGoShow.contentSize.height
    }
    
    func getVoucherForGoShow(){
        let getVoucherForGoShowRequestModel = GetVoucherForGoShowRequestModel.init(voucher: self.textFieldVoucher.text ?? "", date: self.textFieldDate.text ?? "", hotelId: self.hotelId ?? "")
        NetworkManager.sendGetRequestArray(url:NetworkManager.BASEURL, endPoint: .GetVoucherForGoShow, method: .get, parameters: getVoucherForGoShowRequestModel.requestPathString()) { (response : [GetVoucherForGoShowResponseModel]) in
            if response.count > 0 {
                self.goShowList.append(GoShowList.init(_id: "", id: 0, voucher: "Voucher No", tourist: "Tourist", guide: "Guide", check: false))
                for item in response {
                    self.goShowList.append(GoShowList.init(_id: item._id ?? "", id: item.id ?? 0, voucher: item.voucher ?? "", tourist: item.tourist ?? "", guide: item.guide ?? "", check: false))
                }
            }else {
               print("error")
            }
        }
    }
    
    func setGoShowOnMobile(index: Int){
        if index != -1{
            let setGoShowOnMobileRequestModel = SetGoShowOnMobileRequestModel.init(planId: self.planId ?? "",   voucherId: String(self.goShowList[index].id ?? 0))
            NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .SetGoShowOnMobile, method:     .get, parameters: setGoShowOnMobileRequestModel.requestPathString()) { (response :  SetGoShowOnMobileResponseModel) in
                if response.isSuccesful == true {
                    UIApplication.getTopViewController()?.showAlertMsg(msg: response.message ?? "", finished: {
                        self.dismiss(animated: true, completion: nil)
                        self.otiPushViewController(viewController: MainPAgeViewController())
                    })
                }else {
                   print("error")
                }
            }
        }
    }
    
    @IBAction func buttonTappedSearch(_ sender: Any) {
        self.goShowList.removeAll()
        self.ind = -1
        self.getVoucherForGoShow()
    }
    
    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return datePicker
    }()
    
    var datePickerToolBar: UIView = {
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
    
    @objc func cancelButtonTapped() {
        date = nil
    }
    
    @objc func doneButtonTapped() {
        date = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.textFieldDate.text = formatter.string(from: datePicker.date)
    }
    
    @IBAction func buttonTappedAdd(_ sender: Any) {
        self.setGoShowOnMobile(index: self.ind)
    }
    
}

extension TasksGoShowViewController: TasksGoShowTableViewCellDelegate {
    func updatedList(index: Int) {
        for i in 1...self.goShowList.count - 1{
            if i == index{
                self.goShowList[i].check = true
                self.ind = index
            }
            else{
                self.goShowList[i].check = false
            }
        }
        self.tableViewTasksGoShow.reloadData()
    }
}

extension TasksGoShowViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goShowList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksGoShowTableViewCell.identifier, for: indexPath) as! TasksGoShowTableViewCell
        if indexPath.row == 0{
            cell.imageViewCheck.isHidden = true
            cell.setColor(color: .medGrayColor)
        }
        else{
            cell.imageViewCheck.isHidden = false
            cell.setColor(color: .white)
        }
        cell.delegate = self
        cell.setInfo(index: indexPath.row, voucher: self.goShowList[indexPath.row].voucher ?? "", tourist: self.goShowList[indexPath.row].tourist ?? "", guide: self.goShowList[indexPath.row].guide ?? "", check: self.goShowList[indexPath.row].check ?? false)
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

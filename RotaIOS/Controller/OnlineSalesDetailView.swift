//
//  OnlineSalesDetailView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 26.04.2022.
//

import Foundation
import Foundation
import UIKit

final class OnlineSalesDetailView : UIView {
    @IBOutlet weak var viewHeaderView: HeaderDetailCustomView!
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var imageExcursion: UIImageView!
    @IBOutlet weak var imageCurrency: UIImageView!
    @IBOutlet weak var imageTourist: UIImageView!
    @IBOutlet weak var imageExtra: UIImageView!
    @IBOutlet weak var labelExcursion: UILabel!
    @IBOutlet weak var labelExcursionDate: UILabel!
    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelTourist: UILabel!
    @IBOutlet weak var labelExtra: UILabel!
    @IBOutlet weak var labelExtraTourist: UILabel!
    @IBOutlet weak var viewType: MainTextCustomView!
    @IBOutlet weak var viewCurrency: MainTextCustomView!
    @IBOutlet weak var viewAmount: MainTextCustomView!
    @IBOutlet weak var viewTourist: MainTextCustomView!
    @IBOutlet weak var buttonAddPayment: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewBalanced: MainTextCustomView!
    @IBOutlet weak var viewPaid: MainTextCustomView!
    @IBOutlet weak var viewTotalAmount: MainTextCustomView!
    @IBOutlet weak var buttonPay: UIButton!
    @IBOutlet weak var viewFooter: UIView!
    
    
override func awakeFromNib() {
    self.viewHeaderView.labelHeaderDetailView.text = "Online Sales"
    self.viewContentView.backgroundColor = UIColor.tableViewColor
    self.viewContentView.layer.cornerRadius = 10
    self.viewContentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    
    self.tableView.backgroundColor = UIColor.tableViewColor
    
    self.viewFooter.layer.cornerRadius = 10
    self.viewFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    self.viewFooter.backgroundColor = UIColor.grayColor
    
    self.imageExcursion.image = UIImage(named: "excursion")
    self.imageExtra.image = UIImage(named: "extra")
    self.imageTourist.image = UIImage(named: "tourist")
    self.imageCurrency.image = UIImage(named: "currency")
    
    self.viewType.layer.cornerRadius = 10
    self.viewType.headerLAbel.text = "Type"
    self.viewType.mainText.isHidden = true
    self.viewType.imageMainText.isHidden = false
    self.viewType.viewMainView.backgroundColor = UIColor.tableViewColor
    self.viewType.mainLabel.isHidden = false
    
    self.viewCurrency.layer.cornerRadius = 10
    self.viewCurrency.headerLAbel.text = "Currency"
    self.viewCurrency.mainText.isHidden = true
    self.viewCurrency.imageMainText.isHidden = true
    self.viewCurrency.viewMainView.backgroundColor = UIColor.tableViewColor
    self.viewCurrency.mainLabel.isHidden = false
    
    self.viewAmount.layer.cornerRadius = 10
    self.viewAmount.headerLAbel.text = "Amount"
    self.viewAmount.mainText.isHidden = false
    self.viewAmount.imageMainText.isHidden = true
    self.viewAmount.viewMainView.backgroundColor = UIColor.tableViewColor
    self.viewAmount.mainLabel.isHidden = true
    
    self.viewTourist.layer.cornerRadius = 10
    self.viewTourist.headerLAbel.text = "Tourist"
    self.viewTourist.mainText.isHidden = true
    self.viewTourist.imageMainText.isHidden = false
    self.viewTourist.viewMainView.backgroundColor = UIColor.tableViewColor
    self.viewTourist.mainLabel.isHidden = false
    self.viewTourist.mainLabel.text = ""
    
    self.viewBalanced.layer.cornerRadius = 10
    self.viewBalanced.headerLAbel.text = "Balanced"
    self.viewBalanced.mainText.isHidden = true
    self.viewBalanced.imageMainText.isHidden = true
    self.viewBalanced.mainLabel.isHidden = false
    self.viewBalanced.mainLabel.text = ""
    
    self.viewPaid.layer.cornerRadius = 10
    self.viewPaid.headerLAbel.text = "Paid"
    self.viewPaid.mainText.isHidden = true
    self.viewPaid.imageMainText.isHidden = true
    self.viewPaid.mainLabel.isHidden = false
    self.viewPaid.mainLabel.text = ""
    
    self.viewTotalAmount.layer.cornerRadius = 10
    self.viewTotalAmount.headerLAbel.text = "Total Amount"
    self.viewTotalAmount.mainText.isHidden = true
    self.viewTotalAmount.imageMainText.isHidden = true
    self.viewTotalAmount.mainLabel.isHidden = false
    self.viewTotalAmount.mainLabel.text = ""
    
    self.buttonColor(isEnable: true, button: self.buttonAddPayment)
    self.buttonColor(isEnable: true, button: self.buttonPay)
}

required init(customParamArg: String) {
    super.init(frame: .zero)
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
}
}

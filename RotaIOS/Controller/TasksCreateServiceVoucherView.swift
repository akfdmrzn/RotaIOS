//
//  TasksCreateServiceVoucherView.swift
//  RotaIOS
//
//  Created by odeon on 10.03.2022.
//

import Foundation
import UIKit

final class TasksCreateServiceVoucherView : UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var pickerView: PickerView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.grayColor
        self.mainView.backgroundColor = UIColor.grayColor
        self.contentView.round(with: .top, radius: 20)
        self.view.backgroundColor = UIColor.grayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Create Service Voucher".localizedCapitalized
        self.buttonLogin.setTitle("LOGIN", for: .normal)
        self.buttonLogin.backgroundColor = UIColor.greenColor
        self.buttonLogin.round(with: .all, radius: 10)
        self.pickerView.round(with: .all, radius: 10)
        self.labelUsername.text = "Username"
        self.labelPassword.text = "Password"
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

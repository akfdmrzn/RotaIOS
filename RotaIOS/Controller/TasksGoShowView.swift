//
//  TasksGoShowView.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import Foundation
import UIKit

final class TasksGoShowView : UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var labelVoucher: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var textFieldVoucher: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var buttonAdd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.darkGrayColor
        self.mainView.backgroundColor = UIColor.darkGrayColor
        self.searchView.backgroundColor = .grayColor
        self.view.backgroundColor = UIColor.darkGrayColor
        self.addView.backgroundColor = UIColor.darkGrayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Go Show".localizedCapitalized
        self.buttonSearch.setTitle("SEARCH", for: .normal)
        self.buttonSearch.backgroundColor = UIColor.greenColor
        self.buttonSearch.round(with: .all, radius: 10)
        self.buttonAdd.setTitle("ADD", for: .normal)
        self.buttonAdd.backgroundColor = UIColor.clear
        self.buttonAdd.layer.borderWidth = 1.0
        self.buttonAdd.layer.borderColor = UIColor.greenColor.cgColor
        self.buttonAdd.layer.cornerRadius = 10
        self.labelVoucher.text = "Voucher"
        self.labelDate.text = "Date"
        self.textFieldVoucher.placeholder = "Voucher No"
        self.textFieldDate.placeholder = "Please use yyyy-mm-dd format"
    }
    
    override func layoutSubviews() {
        self.contentView.round(with: .top, radius: 20)
        self.searchView.round(with: .top, radius: 20)
        self.addView.round(with: .top, radius: 20)
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

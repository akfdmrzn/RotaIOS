//
//  BirthdayView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 31.03.2022.
//

import Foundation
import UIKit

final class BirthdayView : UIView {
    @IBOutlet weak var viewHeaderDetail: HeaderDetailCustomView!
    @IBOutlet weak var tableview: UITableView!
    
    override func awakeFromNib() {
        
        self.viewHeaderDetail.labelHeaderDetailView.text = "Birthday"
        self.tableview.backgroundColor = UIColor.mainViewColor
        self.tableview.layer.cornerRadius = 10
     
    }
    

    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

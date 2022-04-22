//
//  OnlineSalesView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 22.04.2022.
//

import Foundation
import UIKit

final class OnlineSalesView : UIView {
    @IBOutlet weak var viewHeaderView: HeaderDetailCustomView!
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var textPrebookingId: UITextField!
    @IBOutlet weak var buttonCheck: UIButton!
    
    override func awakeFromNib() {
        self.viewHeaderView.labelHeaderDetailView.text = "Online Sales"
        self.viewContentView.backgroundColor = UIColor.grayColor
        self.viewContentView.layer.cornerRadius = 10
        
        self.buttonCheck.backgroundColor = UIColor.greenColor
        self.buttonCheck.layer.cornerRadius = 10
     
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

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
    
override func awakeFromNib() {
    self.viewHeaderView.labelHeaderDetailView.text = "Online Sales"
    self.viewContentView.backgroundColor = UIColor.tableViewColor
    self.viewContentView.layer.cornerRadius = 10

}

required init(customParamArg: String) {
    super.init(frame: .zero)
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
}
}

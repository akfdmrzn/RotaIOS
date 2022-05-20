//
//  TasksPaxView.swift
//  RotaIOS
//
//  Created by odeon on 14.01.2022.
//

import Foundation
import UIKit

final class TasksPaxView : UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    @IBOutlet weak var buttonSendOffice: UIButton!
    @IBOutlet weak var labelWorkNo: UILabel!
    @IBOutlet weak var labelHotelName: UILabel!
    @IBOutlet weak var labelExcursionName: UILabel!
    @IBOutlet weak var labelPax: UILabel!
    @IBOutlet weak var viewPaxInfo: UIView!
    @IBOutlet weak var viewTaksType: UIView!
    @IBOutlet weak var labelWorkType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.darkGrayColor
        self.contentView.round(with: .top, radius: 20)
        self.view.backgroundColor = UIColor.darkGrayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Tasks".localizedCapitalized
        self.buttonSendOffice.setTitle("SEND OFFICE", for: .normal)
        self.buttonSendOffice.backgroundColor = UIColor.greenColor
        self.buttonSendOffice.round(with: .all, radius: 10)
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

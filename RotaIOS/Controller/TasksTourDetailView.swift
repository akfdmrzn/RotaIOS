//
//  TasksTourDetail.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import Foundation
import UIKit

final class TasksTourDetailView : UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tableViewTasksTourDetail: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.darkGrayColor
        self.contentView.round(with: .top, radius: 20)
        self.view.backgroundColor = UIColor.darkGrayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Tour Detail".localizedCapitalized
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

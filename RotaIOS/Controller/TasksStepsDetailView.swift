//
//  TasksStepsDetailView.swift
//  RotaIOS
//
//  Created by odeon on 8.03.2022.
//

import Foundation
import UIKit

final class TasksStepsDetailView : UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tableViewTasksStepsDetail: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    @IBOutlet weak var buttonSendOffice: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.darkGrayColor
        self.mainView.backgroundColor = UIColor.darkGrayColor
        self.contentView.round(with: .top, radius: 20)
        self.view.backgroundColor = UIColor.darkGrayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Steps Detail".localizedCapitalized
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

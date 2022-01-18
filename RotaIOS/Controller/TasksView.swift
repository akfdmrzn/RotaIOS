//
//  TasksView.swift
//  RotaIOS
//
//  Created by odeon on 20.12.2021.
//

import Foundation
import UIKit

final class TasksView : UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var tasksTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerDetailCustomView: HeaderDetailCustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.grayColor
        self.contentView.round(with: .top, radius: 20)
        self.view.backgroundColor = UIColor.grayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Tasks".localizedCapitalized
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

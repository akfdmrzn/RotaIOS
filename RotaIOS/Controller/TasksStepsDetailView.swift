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
    @IBOutlet weak var labelPaxes: UILabel!
    @IBOutlet weak var buttonAdd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.darkGrayColor
        self.mainView.backgroundColor = UIColor.darkGrayColor
        self.view.backgroundColor = UIColor.darkGrayColor
        self.headerDetailCustomView.labelHeaderDetailView.text = "Steps Detail".localizedCapitalized
        self.buttonSendOffice.setTitle("SEND OFFICE", for: .normal)
        self.buttonSendOffice.backgroundColor = UIColor.greenColor
        self.buttonSendOffice.layer.cornerRadius = 10
        self.labelPaxes.text = "Paxes"
        //self.buttonAdd.setTitle("ADD", for: .normal)
        //self.buttonAdd.backgroundColor = UIColor.clear
        //self.buttonAdd.layer.borderWidth = 1.0
        //self.buttonAdd.layer.borderColor = UIColor.greenColor.cgColor
        //self.buttonAdd.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        self.contentView.round(with: .top, radius: 20)
    }
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

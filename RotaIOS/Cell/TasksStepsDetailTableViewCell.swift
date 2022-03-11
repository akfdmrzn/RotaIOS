//
//  TasksStepsDetailTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 8.03.2022.
//

import UIKit

class TasksStepsDetailTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelRealTotal: UILabel!
    @IBOutlet weak var labelRealAdult: UILabel!
    @IBOutlet weak var labelRealChild: UILabel!
    @IBOutlet weak var labelRealToodle: UILabel!
    @IBOutlet weak var labelRealInfant: UILabel!
    @IBOutlet weak var labelFreeAdult: UILabel!
    @IBOutlet weak var labelFreeChild: UILabel!
    @IBOutlet weak var labelFreeToodle: UILabel!
    @IBOutlet weak var labelFreeInfant: UILabel!
    @IBOutlet weak var labelTotalAdult: UILabel!
    @IBOutlet weak var labelTotalChild: UILabel!
    @IBOutlet weak var labelTotalToodle: UILabel!
    @IBOutlet weak var labelTotalInfant: UILabel!
    @IBOutlet weak var labelRealAmount: UILabel!
    @IBOutlet weak var labelFreeAmount: UILabel!
    @IBOutlet weak var labelFreeTotal: UILabel!
    @IBOutlet weak var labelTotalAmount: UILabel!
    @IBOutlet weak var labelGrandTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextColor(color: UIColor){
        self.labelType.textColor = color
        self.labelRealAdult.textColor = color
        self.labelRealChild.textColor = color
        self.labelRealToodle.textColor = color
        self.labelRealInfant.textColor = color
        self.labelFreeAdult.textColor = color
        self.labelFreeChild.textColor = color
        self.labelFreeToodle.textColor = color
        self.labelFreeInfant.textColor = color
        self.labelTotalAdult.textColor = color
        self.labelTotalChild.textColor = color
        self.labelTotalToodle.textColor = color
        self.labelTotalInfant.textColor = color
        self.labelRealAmount.textColor = color
        self.labelRealTotal.textColor = color
        self.labelFreeAmount.textColor = color
        self.labelFreeTotal.textColor = color
        self.labelTotalAmount.textColor = color
        self.labelGrandTotal.textColor = color
    }
    
    func setInfo(labelType: String, realTotal: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, freeAdult: String, freeChild: String, freeToodle: String, freeInfant: String, totalAdult: String, totalChild: String, totalToodle: String, totalInfant: String, realAmount: String, freeAmount: String, freeTotal: String, totalAmount: String, grandTotal: String){
        self.labelType.text = labelType
        self.labelRealTotal.text = realTotal
        self.labelRealAdult.text = realAdult
        self.labelRealChild.text = realChild
        self.labelRealToodle.text = realToodle
        self.labelRealInfant.text = realInfant
        self.labelFreeAdult.text = freeAdult
        self.labelFreeChild.text = freeChild
        self.labelFreeToodle.text = freeToodle
        self.labelFreeInfant.text = freeInfant
        self.labelTotalAdult.text = totalAdult
        self.labelTotalChild.text = totalChild
        self.labelTotalToodle.text = totalToodle
        self.labelTotalInfant.text = totalInfant
        self.labelRealAmount.text = realAmount
        self.labelFreeAmount.text = freeAmount
        self.labelFreeTotal.text = freeTotal
        self.labelTotalAmount.text = totalAmount
        self.labelGrandTotal.text = grandTotal
    }
}

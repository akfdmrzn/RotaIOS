//
//  TasksStepsDetailTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 8.03.2022.
//

import UIKit

class TasksStepsDetailTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var textFieldRealTotal: UITextField!
    @IBOutlet weak var textFieldRealAdult: UITextField!
    @IBOutlet weak var textFieldRealChild: UITextField!
    @IBOutlet weak var textFieldRealToodle: UITextField!
    @IBOutlet weak var textFieldRealInfant: UITextField!
    @IBOutlet weak var textFieldFreeAdult: UITextField!
    @IBOutlet weak var textFieldFreeChild: UITextField!
    @IBOutlet weak var textFieldFreeToodle: UITextField!
    @IBOutlet weak var textFieldFreeInfant: UITextField!
    @IBOutlet weak var textFieldTotalAdult: UITextField!
    @IBOutlet weak var textFieldTotalChild: UITextField!
    @IBOutlet weak var textFieldTotalToodle: UITextField!
    @IBOutlet weak var textFieldTotalInfant: UITextField!
    @IBOutlet weak var textFieldRealAmount: UITextField!
    @IBOutlet weak var textFieldFreeAmount: UITextField!
    @IBOutlet weak var textFieldFreeTotal: UITextField!
    @IBOutlet weak var textFieldTotalAmount: UITextField!
    @IBOutlet weak var textFieldGrandTotal: UITextField!
    
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
        self.textFieldRealAdult.textColor = color
        self.textFieldRealChild.textColor = color
        self.textFieldRealToodle.textColor = color
        self.textFieldRealInfant.textColor = color
        self.textFieldFreeAdult.textColor = color
        self.textFieldFreeChild.textColor = color
        self.textFieldFreeToodle.textColor = color
        self.textFieldFreeInfant.textColor = color
        self.textFieldTotalAdult.textColor = color
        self.textFieldTotalChild.textColor = color
        self.textFieldTotalToodle.textColor = color
        self.textFieldTotalInfant.textColor = color
        self.textFieldRealAmount.textColor = color
        self.textFieldRealTotal.textColor = color
        self.textFieldFreeAmount.textColor = color
        self.textFieldFreeTotal.textColor = color
        self.textFieldTotalAmount.textColor = color
        self.textFieldGrandTotal.textColor = color
    }
    
    func isEditingTextField(status: Bool){
        self.textFieldRealAdult.isUserInteractionEnabled = status
        self.textFieldRealChild.isUserInteractionEnabled = status
        self.textFieldRealToodle.isUserInteractionEnabled = status
        self.textFieldRealInfant.isUserInteractionEnabled = status
        self.textFieldFreeAdult.isUserInteractionEnabled = status
        self.textFieldFreeChild.isUserInteractionEnabled = status
        self.textFieldFreeToodle.isUserInteractionEnabled = status
        self.textFieldFreeInfant.isUserInteractionEnabled = status
        self.textFieldTotalAdult.isUserInteractionEnabled = status
        self.textFieldTotalChild.isUserInteractionEnabled = status
        self.textFieldTotalToodle.isUserInteractionEnabled = status
        self.textFieldTotalInfant.isUserInteractionEnabled = status
        self.textFieldRealAmount.isUserInteractionEnabled = status
        self.textFieldRealTotal.isUserInteractionEnabled = status
        self.textFieldFreeAmount.isUserInteractionEnabled = status
        self.textFieldFreeTotal.isUserInteractionEnabled = status
        self.textFieldTotalAmount.isUserInteractionEnabled = status
        self.textFieldGrandTotal.isUserInteractionEnabled = status
    }
    
    func setInfo(type: String, realTotal: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, freeAdult: String, freeChild: String, freeToodle: String, freeInfant: String, totalAdult: String, totalChild: String, totalToodle: String, totalInfant: String, realAmount: String, freeAmount: String, freeTotal: String, totalAmount: String, grandTotal: String){
        self.labelType.text = type
        self.textFieldRealTotal.text = realTotal
        self.textFieldRealAdult.text = realAdult
        self.textFieldRealChild.text = realChild
        self.textFieldRealToodle.text = realToodle
        self.textFieldRealInfant.text = realInfant
        self.textFieldFreeAdult.text = freeAdult
        self.textFieldFreeChild.text = freeChild
        self.textFieldFreeToodle.text = freeToodle
        self.textFieldFreeInfant.text = freeInfant
        self.textFieldTotalAdult.text = totalAdult
        self.textFieldTotalChild.text = totalChild
        self.textFieldTotalToodle.text = totalToodle
        self.textFieldTotalInfant.text = totalInfant
        self.textFieldRealAmount.text = realAmount
        self.textFieldFreeAmount.text = freeAmount
        self.textFieldFreeTotal.text = freeTotal
        self.textFieldTotalAmount.text = totalAmount
        self.textFieldGrandTotal.text = grandTotal
    }
}

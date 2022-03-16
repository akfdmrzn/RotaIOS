//
//  TasksStepsTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import UIKit

class TasksStepsTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelStepName: UILabel!
    @IBOutlet weak var labelServiceType: UILabel!
    @IBOutlet weak var labelSupplierName: UILabel!
    @IBOutlet weak var labelRealPax: UILabel!
    @IBOutlet weak var labelSVPax: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setColor(color: UIColor){
        self.labelStepName.textColor = color
        self.labelServiceType.textColor = color
        self.labelSupplierName.textColor = color
        self.labelRealPax.textColor = color
        self.labelSVPax.textColor = color
    }
    
    func setInfo(stepName: String, serviceType: String, supplierName: String, realPax: String, sVPax: String){
        self.labelStepName.text = stepName
        self.labelServiceType.text = serviceType
        self.labelSupplierName.text = supplierName
        self.labelRealPax.text = realPax
        self.labelSVPax.text = sVPax
    }
}

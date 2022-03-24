//
//  TasksStepsDetailPaxesTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 22.03.2022.
//

import UIKit

protocol TasksStepsDetailPaxesTableViewCellDelegate {
    func updatedList(index : Int, check: Bool)
}

class TasksStepsDetailPaxesTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelNameSurname: UILabel!
    @IBOutlet weak var labelAgeType: UILabel!
    @IBOutlet weak var labelOperatorName: UILabel!
    @IBOutlet weak var labelMarket: UILabel!
    @IBOutlet weak var imageViewCheck: UIImageView!
    
    var delegate : TasksStepsDetailPaxesTableViewCellDelegate?
    var isTappedCheck = false
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextColor(color: UIColor){
        self.labelNameSurname.textColor = color
        self.labelAgeType.textColor = color
        self.labelOperatorName.textColor = color
        self.labelMarket.textColor = color
    }
    
    func setInfo(index: Int, nameSurname: String, ageType: String, operatorName: String, market: String, check: Bool){
        self.index = index
        self.labelNameSurname.text = nameSurname
        self.labelAgeType.text = ageType
        self.labelOperatorName.text = operatorName
        self.labelMarket.text = market
        self.isTappedCheck = check
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
    }
    
    @IBAction func buttonTappedCheck(_ sender: Any) {
        self.isTappedCheck = !self.isTappedCheck
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
        self.delegate?.updatedList(index: self.index, check: self.isTappedCheck)
    }
}

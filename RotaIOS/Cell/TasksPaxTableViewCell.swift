//
//  TasksPaxTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 19.01.2022.
//

import UIKit

protocol TasksPaxTableViewCellDelegate {
    func updatedList(index : Int, check: Bool)
}

class TasksPaxTableViewCell: BaseTableViewCell {

    @IBOutlet weak var labelPaxName: UILabel!
    @IBOutlet weak var labelAgeGroup: UILabel!
    @IBOutlet weak var labelIncResNo: UILabel!
    @IBOutlet weak var labelOperator: UILabel!
    @IBOutlet weak var labelVoucherNo: UILabel!
    @IBOutlet weak var labelRoom: UILabel!
    @IBOutlet weak var labelOprResNo: UILabel!
    @IBOutlet weak var labelNoShow: UILabel!
    @IBOutlet weak var labelInfoRep: UILabel!
    @IBOutlet weak var labelGuideNote: UILabel!
    @IBOutlet weak var imageViewCheck: UIImageView!
    
    var delegate : TasksPaxTableViewCellDelegate?
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
    
    func setInfo(index: Int, paxName: String, ageGroup: String, incResNo: String, operator_: String, voucherNo: String, room: String, oprResNo: String, noShow: String, infoRep: String, guideNote: String, check: Bool){
        self.index = index
        self.labelPaxName.text = paxName
        self.labelAgeGroup.text = ageGroup
        self.labelIncResNo.text = incResNo
        self.labelOperator.text = operator_
        self.labelVoucherNo.text = voucherNo
        self.labelRoom.text = room
        self.labelOprResNo.text = oprResNo
        self.labelNoShow.text = noShow
        self.labelInfoRep.text = infoRep
        self.labelGuideNote.text = guideNote
        self.isTappedCheck = check
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
    }
    
    @IBAction func buttonTappedCheck(_ sender: Any) {
        self.isTappedCheck = !self.isTappedCheck
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
        self.delegate?.updatedList(index: self.index, check: self.isTappedCheck)
    }
    
}

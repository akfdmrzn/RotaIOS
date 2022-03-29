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
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelInfoRep: UILabel!
    @IBOutlet weak var labelGuideNote: UILabel!
    @IBOutlet weak var labelArrInfoNote: UILabel!
    @IBOutlet weak var labelTransferGuideName: UILabel!
    @IBOutlet weak var labelTransferGuidePhoneNumber: UILabel!
    @IBOutlet weak var labelFavouriteExcursionDesc: UILabel!
    @IBOutlet weak var labelCheckDatesStr: UILabel!
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
    
    func setInfo(index: Int, paxName: String, ageGroup: String, incResNo: String, operator_: String, voucherNo: String, room: String, oprResNo: String, birthday: String, infoRep: String, guideNote: String, arrInfoNote: String, transferGuideName: String, transferGuidePhoneNumber: String, favouriteExcursionDesc: String, checkDatesStr: String, check: Bool){
        self.index = index
        self.labelPaxName.text = paxName
        self.labelAgeGroup.text = ageGroup
        self.labelIncResNo.text = incResNo
        self.labelOperator.text = operator_
        self.labelVoucherNo.text = voucherNo
        self.labelRoom.text = room
        self.labelOprResNo.text = oprResNo
        self.labelBirthday.text = birthday
        self.labelInfoRep.text = infoRep
        self.labelGuideNote.text = guideNote
        self.labelArrInfoNote.text = arrInfoNote
        self.labelTransferGuideName.text = transferGuideName
        self.labelTransferGuidePhoneNumber.text = transferGuidePhoneNumber
        self.labelFavouriteExcursionDesc.text = favouriteExcursionDesc
        self.labelCheckDatesStr.text = checkDatesStr
        self.isTappedCheck = check
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
    }
    
    @IBAction func buttonTappedCheck(_ sender: Any) {
        self.isTappedCheck = !self.isTappedCheck
        self.imageViewCheck.image = (self.isTappedCheck == true) ? UIImage(named: "check") : UIImage(named: "square")
        self.delegate?.updatedList(index: self.index, check: self.isTappedCheck)
    }
    
}

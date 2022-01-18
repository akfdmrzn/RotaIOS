//
//  TasksPaxCollectionViewCell.swift
//  RotaIOS
//
//  Created by odeon on 18.01.2022.
//

import UIKit

class TasksPaxCollectionViewCell: BaseCollectionViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo(paxName: String, ageGroup: String, incResNo: String, operator_: String, voucherNo: String, room: String, oprResNo: String, noShow: String, infoRep: String, guideNote: String){
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
    }

}

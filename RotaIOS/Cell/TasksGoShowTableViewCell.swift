//
//  TasksGoShowTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 21.03.2022.
//

import UIKit

protocol TasksGoShowTableViewCellDelegate {
    func updatedList(index : Int)
}

class TasksGoShowTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelVoucher: UILabel!
    @IBOutlet weak var labelTourist: UILabel!
    @IBOutlet weak var labelGuide: UILabel!
    @IBOutlet weak var imageViewCheck: UIImageView!
    
    var delegate : TasksGoShowTableViewCellDelegate?
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setColor(color: UIColor){
        self.labelVoucher.textColor = color
        self.labelTourist.textColor = color
        self.labelGuide.textColor = color
    }
    
    func setInfo(index: Int, voucher: String, tourist: String, guide: String, check: Bool){
        self.index = index
        self.labelVoucher.text = voucher
        self.labelTourist.text = tourist
        self.labelGuide.text = guide
        self.imageViewCheck.image = (check == true) ? UIImage(named: "check") : UIImage(named: "square")
    }
    
    @IBAction func buttonTappedCheck(_ sender: Any) {
        self.delegate?.updatedList(index: self.index)
    }
    
}

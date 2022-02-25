//
//  TaskTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 20.12.2021.
//

import UIKit

class TaskTableViewCell: BaseTableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var labelShortCode: UILabel!
    @IBOutlet weak var labelVehicleId: UILabel!
    @IBOutlet weak var labelTourDateStr: UILabel!
    @IBOutlet weak var labelExcursion: UILabel!
    @IBOutlet weak var labelTransferType: UILabel!
    @IBOutlet weak var labelPax: UILabel!
    @IBOutlet weak var labelVehicle: UILabel!
    @IBOutlet weak var labelMeetingPointAndTime: UILabel!
    @IBOutlet weak var labelMeetingTime: UILabel!
    @IBOutlet weak var labelExtra: UILabel!
    @IBOutlet weak var labelDriverName: UILabel!
    @IBOutlet weak var labelDriverPhone: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var viewNote: UIView!
    @IBOutlet weak var labelNote: UILabel!
    @IBOutlet weak var imageViewLocation: UIImageView!
    @IBOutlet weak var imageViewTime: UIImageView!
    @IBOutlet weak var imageViewExtra: UIImageView!
    @IBOutlet weak var imageViewName: UIImageView!
    @IBOutlet weak var imageViewPhone: UIImageView!
    
    var note: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.mainView.round(with: .all, radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTappedNote(_ sender: Any) {
   
        if self.note != ""{
            UIApplication.getTopViewController()?.showAlertMsg(msg: self.note.localizedCapitalized, finished: {
            })
        }
    }
    
    func setInfo(shortCode: String, workNo: String, tourDateStr: String, excursion: String, transferType: String, pax: String, vehicle: String, meetingPointAndTime: String, meetingTime: String, extra: String, driverName: String, driverPhone: String, color: UIColor, noteColor: UIColor, note: String){
        self.labelShortCode.text = shortCode
        self.labelVehicleId.text = workNo
        self.labelVehicle.text = vehicle
        self.labelTourDateStr.text = tourDateStr
        self.labelExcursion.text = excursion
        self.labelTransferType.text = transferType
        self.labelPax.text = pax
        self.labelVehicle.text = vehicle
        self.labelMeetingPointAndTime.text = meetingPointAndTime
        self.labelMeetingTime.text = meetingTime
        self.labelExtra.text = extra
        self.labelDriverName.text = driverName
        self.labelDriverPhone.text = driverPhone
        self.viewColor.backgroundColor = color
        self.viewNote.backgroundColor = noteColor
        self.labelNote.text = "Note".localizedCapitalized
        self.note = note.localizedCapitalized
    }
    
}

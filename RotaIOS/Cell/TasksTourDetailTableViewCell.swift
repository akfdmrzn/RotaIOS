//
//  TasksTourDetailTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import UIKit

class TasksTourDetailTableViewCell: BaseTableViewCell {
    @IBOutlet weak var labelPlate: UILabel!
    @IBOutlet weak var labelDriver: UILabel!
    @IBOutlet weak var labelDriverPhone: UILabel!
    @IBOutlet weak var labelGuideName: UILabel!
    @IBOutlet weak var labelGuidePhone: UILabel!
    @IBOutlet weak var labelMeetinPoint: UILabel!
    @IBOutlet weak var labelTypeInt: UILabel!
    @IBOutlet weak var labelVehicleNo: UILabel!
    @IBOutlet weak var labelKokartGuideName: UILabel!
    @IBOutlet weak var labelKokartGuidePhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(plate: String, driver: String, driverPhone: String, guideName: String, guidePhone: String, meetingPoint: String, typeInt: String, vehicleNo: String, kokartGuideName: String, kokartGuidePhone: String){
        self.labelPlate.text = plate
        self.labelDriver.text = driver
        self.labelDriverPhone.text = driverPhone
        self.labelGuideName.text = guideName
        self.labelGuidePhone.text = guidePhone
        self.labelMeetinPoint.text = meetingPoint
        self.labelTypeInt.text = typeInt
        self.labelVehicleNo.text = vehicleNo
        self.labelKokartGuideName.text = kokartGuideName
        self.labelKokartGuidePhone.text = kokartGuidePhone
    }
}

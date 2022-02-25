//
//  TasksHotelTableViewCell.swift
//  RotaIOS
//
//  Created by odeon on 23.12.2021.
//

import UIKit

class TasksHotelTableViewCell: BaseTableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var labelHotel: UILabel!
    @IBOutlet weak var labelPlace: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelTitle1: UILabel!
    @IBOutlet weak var labelTitle2: UILabel!
    @IBOutlet weak var labelTitle3: UILabel!
    @IBOutlet weak var labelTitle4: UILabel!
    @IBOutlet weak var labelBody1: UILabel!
    @IBOutlet weak var labelBody2: UILabel!
    @IBOutlet weak var labelBody3: UILabel!
    @IBOutlet weak var labelBody4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        self.mainView.round(with: .all, radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(viewColor: UIColor, hotel: String, place: String, date: String, time: String, info: String, title1: String, title2: String, title3: String, title4: String, body1: String, body2: String, body3: String, body4: String){
        self.viewColor.backgroundColor = viewColor
        self.labelHotel.text = hotel
        self.labelPlace.text = place
        self.labelDate.text = date
        self.labelTime.text = time
        self.labelInfo.text = info
        self.labelTitle1.text = title1
        self.labelTitle2.text = title2
        self.labelTitle3.text = title3
        self.labelTitle4.text = title4
        self.labelBody1.text = body1
        self.labelBody2.text = body2
        self.labelBody3.text = body3
        self.labelBody4.text = body4
    }
    
}

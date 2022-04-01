//
//  BirtDayTableViewCell.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 31.03.2022.
//

import UIKit

class BirtDayTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var labelTouristName: UILabel!
    @IBOutlet weak var labelAgeGroup: UILabel!
    @IBOutlet weak var labelMarket: UILabel!
    @IBOutlet weak var labelPaxType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewContentView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

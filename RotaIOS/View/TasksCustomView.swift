//
//  TasksCustomView.swift
//  RotaIOS
//
//  Created by odeon on 6.01.2022.
//

import UIKit
import Foundation

protocol TasksCustomViewDelegate {
    func tappedYesterday()
    func tappedToday()
    func tappedTomorrow()
    func tappedSH()
}

class TasksCustomView: UIView {

    @IBOutlet weak var labelYesterday: UILabel!
    @IBOutlet weak var labelToday: UILabel!
    @IBOutlet weak var labelTomorrow: UILabel!
    @IBOutlet weak var labelSH: UILabel!
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet var customView: UIView!
    
    @IBOutlet weak var viewYesterday: UIView!
    @IBOutlet weak var viewToday: UIView!
    @IBOutlet weak var viewTomorrow: UIView!
    @IBOutlet weak var viewSH: UIView!
    
    var delegate: TasksCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: TasksCustomView.self), owner: self, options: nil)
        customView.addCustomContainerView(self)
        self.viewBorder.round(with: .all, radius: 20)
        self.labelYesterday.text = "Yesterday".localizedCapitalized
        self.labelToday.text = "Today".localizedCapitalized
        self.labelTomorrow.text = "Tomorrow".localizedCapitalized
        self.labelSH.text = "Speaking Hour".localizedCapitalized
    }

    @IBAction func buttonTappedYesterday(_ sender: Any) {
        self.viewYesterday.backgroundColor = UIColor.barGreenColor
        self.viewToday.backgroundColor = UIColor.barGrayColor
        self.viewTomorrow.backgroundColor = UIColor.barGrayColor
        self.viewSH.backgroundColor = UIColor.barGrayColor
        self.delegate?.tappedYesterday()
    }
    
    @IBAction func buttonTappedToday(_ sender: Any) {
        self.viewYesterday.backgroundColor = UIColor.barGrayColor
        self.viewToday.backgroundColor = UIColor.barGreenColor
        self.viewTomorrow.backgroundColor = UIColor.barGrayColor
        self.viewSH.backgroundColor = UIColor.barGrayColor
        self.delegate?.tappedToday()
    }
    
    @IBAction func buttonTappedTomorrow(_ sender: Any) {
        self.viewYesterday.backgroundColor = UIColor.barGrayColor
        self.viewToday.backgroundColor = UIColor.barGrayColor
        self.viewTomorrow.backgroundColor = UIColor.barGreenColor
        self.viewSH.backgroundColor = UIColor.barGrayColor
        self.delegate?.tappedTomorrow()
    }
    
    @IBAction func buttonTappedSH(_ sender: Any) {
        self.viewYesterday.backgroundColor = UIColor.barGrayColor
        self.viewToday.backgroundColor = UIColor.barGrayColor
        self.viewTomorrow.backgroundColor = UIColor.barGrayColor
        self.viewSH.backgroundColor = UIColor.barGreenColor
        self.delegate?.tappedSH()
    }
}

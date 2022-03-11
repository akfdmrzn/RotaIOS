//
//  TasksListView.swift
//  RotaIOS
//
//  Created by odeon on 2.03.2022.
//

import Foundation
import UIKit

class TasksListView : UIView {
    @IBOutlet var viewMainView: UIView!
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var labelHeaderDetailView: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: HeaderDetailCustomView.self), owner: self, options: nil)
        self.viewMainView.addCustomContainerView(self)
        self.viewMainView.applyGradient(colours: [UIColor.lightGreenColor, UIColor.darkGreenColor])
        
    }
}

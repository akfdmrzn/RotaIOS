//
//  MyTourSalesDetailPageTableViewCell.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 8.08.2021.
//

import UIKit

class MyTourSalesDetailPageTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewDetailContentView: UIView!
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var imageToMoreDetailPage: UIImageView!
    @IBOutlet weak var labelTourDate: UILabel!
    @IBOutlet weak var labelTourName: UILabel!
    @IBOutlet weak var labelTourTime: UILabel!
    @IBOutlet weak var labelHotelName: UILabel!
    @IBOutlet weak var labelReelPax: UILabel!
    @IBOutlet weak var labelResNo: UILabel!
    var viewZReportLongClickMenu : ZReportLongClickMenu?
    var clicked = false
    var voucherNo = ""
    var tourSaleId = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageToMoreDetailPage.image = UIImage(named: "right")
        self.selectionStyle = .none
        self.viewContentView.backgroundColor = UIColor.clear
        self.viewDetailContentView.backgroundColor = UIColor.mainTextColor
        self.viewDetailContentView.layer.cornerRadius = 10
        
        let longPressOnContentView = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(gestureReconizer:)))
        longPressOnContentView.minimumPressDuration = 1.0
        longPressOnContentView.delaysTouchesBegan = true
        longPressOnContentView.delegate = self
        self.contentView.addGestureRecognizer(longPressOnContentView)
    }
    
    @objc func longPressed(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == .began {
            self.clicked = !self.clicked
            if let topVC = UIApplication.getTopViewController() {
                UIView.animate(withDuration: 0, animations: {
                    self.viewZReportLongClickMenu = ZReportLongClickMenu()
                    
                    self.viewZReportLongClickMenu?.buttonReprint.isHidden = false
                    self.viewZReportLongClickMenu?.buttonCopyVoucher.isHidden = false
                    self.viewZReportLongClickMenu?.buttonAddSaleNote.isHidden = false
                    self.viewZReportLongClickMenu?.buttonZReportRefund.isHidden = true
                    self.viewZReportLongClickMenu?.buttonZReportPayments.isHidden = true
                    self.viewZReportLongClickMenu?.voucherNo = self.voucherNo
                    self.viewZReportLongClickMenu?.tourSaleId = self.tourSaleId
            
                    self.viewZReportLongClickMenu!.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    topVC.view.addSubview(self.viewZReportLongClickMenu!)
                }, completion: { (finished) in
                    if finished{
                    }
                })
            }
        }
        else {
            //When lognpress is finish
            print("finish")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

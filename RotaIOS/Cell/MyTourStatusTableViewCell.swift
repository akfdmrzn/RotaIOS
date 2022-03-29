//
//  MyTourStatusTableViewCell.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 8.08.2021.
//

import UIKit

protocol MyTourStatusTableViewCellDelegate {
    func myTourStatusId(selectedStatusId : String, selectedStatusName : String, isremove : Bool)
}

class MyTourStatusTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewContetView: UIView!
    @IBOutlet weak var viewCheckBoxView: CheckBoxView!
    @IBOutlet weak var labelStatusText: UILabel!
    var myTourStatusTableViewCellDelegate : MyTourStatusTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.viewContetView.backgroundColor = UIColor.grayColor
        self.labelStatusText.textColor = UIColor.white
        self.viewCheckBoxView.checkBoxViewDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension MyTourStatusTableViewCell: CheckBoxViewDelegate {
    
    func checkBoxTapped(isremember: Bool) {
        if isremember == true {
            if self.labelStatusText.text == "Status" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "0", selectedStatusName: "Status", isremove: false)
            }else if self.labelStatusText.text == "Approved" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "94", selectedStatusName: "Approved", isremove: false)
            }else if self.labelStatusText.text == "Waiting Approval" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "95", selectedStatusName: "Waiting Approval", isremove: false)
            }else if self.labelStatusText.text == "Canceled" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "181", selectedStatusName: "Canceled", isremove: false)
            }else if self.labelStatusText.text == "Rejected" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "165", selectedStatusName: "Rejected", isremove: false)
            }
        }else{
            if self.labelStatusText.text == "Status" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "0", selectedStatusName: "Status", isremove: true)
            }else if self.labelStatusText.text == "Approved" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "94", selectedStatusName: "Approved", isremove: true)
            }else if self.labelStatusText.text == "Waiting Approval" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "95", selectedStatusName: "Waiting Approval", isremove: true)
            }else if self.labelStatusText.text == "Canceled" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "181", selectedStatusName: "Canceled", isremove: true)
            }else if self.labelStatusText.text == "Rejected" {
                self.myTourStatusTableViewCellDelegate?.myTourStatusId(selectedStatusId: "165", selectedStatusName: "Rejected", isremove: true)
            }
        }
    }
}

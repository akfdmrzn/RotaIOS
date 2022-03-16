//
//  MyTourSaleMoreDetailViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.08.2021.
//

import UIKit

class MyTourSaleMoreDetailViewController: UIViewController {
    var tourDetailListInMoreDetailPage : GetTourDetailForMobileResponseModel?
    @IBOutlet var viewMyTourSaleMoreDetailView: MyTourSaleMoreDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewMyTourSaleMoreDetailView.labelExcursionName.text = self.tourDetailListInMoreDetailPage?.tourName
        self.viewMyTourSaleMoreDetailView.labelExcursionDate.text = self.tourDetailListInMoreDetailPage?.tourDateStr
        self.viewMyTourSaleMoreDetailView.labelResevationNo.text = self.tourDetailListInMoreDetailPage?.pax_ResNo
        self.viewMyTourSaleMoreDetailView.labelHotelName.text = self.tourDetailListInMoreDetailPage?.hotelName
        self.viewMyTourSaleMoreDetailView.labelTime.text = self.tourDetailListInMoreDetailPage?.tourPickupTime
        self.viewMyTourSaleMoreDetailView.labelReelPax.text = self.tourDetailListInMoreDetailPage?.totalPax
        self.viewMyTourSaleMoreDetailView.labelCollectionGuide.text = self.tourDetailListInMoreDetailPage?.colGuide
        self.viewMyTourSaleMoreDetailView.labelExcursionGuide.text = self.tourDetailListInMoreDetailPage?.excKokartGuide
        self.viewMyTourSaleMoreDetailView.labelDeployingGuide.text = self.tourDetailListInMoreDetailPage?.delGuide
        self.viewMyTourSaleMoreDetailView.labelCancelNote.text = self.tourDetailListInMoreDetailPage?.note
        if self.tourDetailListInMoreDetailPage?.tourDateStr != nil {
            self.viewMyTourSaleMoreDetailView.labelCancelVoucher.text = self.tourDetailListInMoreDetailPage?.tourVoucher
        }else{
            self.viewMyTourSaleMoreDetailView.labelCancelVoucher.text = ""
        }
        self.viewMyTourSaleMoreDetailView.labelPArentVoucher.text = self.tourDetailListInMoreDetailPage?.parentVoucher ?? ""
        self.viewMyTourSaleMoreDetailView.labelTotalPayment.text = self.tourDetailListInMoreDetailPage?.paymentStr ?? ""
        self.viewMyTourSaleMoreDetailView.labelTotalDiscount.text = String(self.tourDetailListInMoreDetailPage?.totalDiscount ?? 0.0)
        self.viewMyTourSaleMoreDetailView.labelPArentVoucher.text = self.tourDetailListInMoreDetailPage?.parentVoucher ?? ""
        self.viewMyTourSaleMoreDetailView.labelCancelDate.text = self.tourDetailListInMoreDetailPage?.cancelDate
        self.viewMyTourSaleMoreDetailView.labelCancelStaff.text = self.tourDetailListInMoreDetailPage?.cancelStaff
        self.viewMyTourSaleMoreDetailView.labelRefund.text = "\(self.tourDetailListInMoreDetailPage?.refundAmount ?? 0.0)"
        self.viewMyTourSaleMoreDetailView.labelTotalPayment.text = "\(self.tourDetailListInMoreDetailPage?.totalAmount ?? 0.0)"
    }
    
  init(tourDetailListInMoreDetailPage : GetTourDetailForMobileResponseModel ) {
        self.tourDetailListInMoreDetailPage = tourDetailListInMoreDetailPage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

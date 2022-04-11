//
//  ConnectBLEZPrinterViewController.h
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.04.2022.
//
#import <UIKit/UIKit.h>
#import "ScanBLEZPrinterTableViewController.h"

@interface ConnectBLEZPrinterViewController : UIViewController <UITextViewDelegate>

@property(strong, nonatomic) CBPeripheral *selectedPrinter;
@property (strong, nonatomic) ScanBLEZPrinterTableViewController *scanBLEZPrinterTVC;

@end

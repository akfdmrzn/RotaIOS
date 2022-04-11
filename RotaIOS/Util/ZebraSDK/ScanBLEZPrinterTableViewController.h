//
//  ScanBLEZPrinterTableViewController.h
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.04.2022.
//
#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ScanBLEZPrinterTableViewController : UITableViewController

@property (strong, nonatomic) CBCentralManager  *centralManager;

@end

//
//  DeviceListCustomView.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 5.04.2022.
//

import Foundation
import UIKit
import CoreBluetooth

class DeviceListCustomView : UIView {
    @IBOutlet var viewMainView: UIView!
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var viewRemoveOutSide: UIView!
    @IBOutlet weak var viewRemoveInside: UIView!
    @IBOutlet weak var tableView: UITableView!
    var centralManager: CBCentralManager!
    var peripherals = [CBPeripheral]()
    var selectedPeripheral: CBPeripheral!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: DeviceListCustomView.self), owner: self, options: nil)
        self.viewMainView.addCustomContainerView(self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DeviceListTableViewCell.nib, forCellReuseIdentifier: DeviceListTableViewCell.identifier)
        
        let gestureRemove = UITapGestureRecognizer(target: self, action: #selector(touchRemoveButton))
        self.viewRemoveOutSide.isUserInteractionEnabled = true
        self.viewRemoveOutSide.addGestureRecognizer(gestureRemove)
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    @objc func touchRemoveButton() {
        self.viewRemoveOutSide.removeFromSuperview()
    }
}

extension DeviceListCustomView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceListTableViewCell.identifier) as! DeviceListTableViewCell
        cell.labelDeviceName.text = self.peripherals[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPeripheral = peripherals[indexPath.row]
        self.selectedPeripheral.delegate = self
        self.centralManager.stopScan()
        self.centralManager.connect(selectedPeripheral)
    }
    
}

extension DeviceListCustomView : CBCentralManagerDelegate {
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
    case .poweredOn:
      centralManager.scanForPeripherals(withServices: nil, options: nil)
      break
    default:
      print("Not in poweredOn State")
    }
  }
  
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    guard peripheral.name != nil else { return }
    
    let identifiers = peripherals.map { $0.identifier }
    
    if !identifiers.contains(peripheral.identifier) {
      peripherals.append(peripheral)
      tableView.reloadData()
    }
  }
  
  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("connected")
    let deviceInfoServiceCBUUID = CBUUID(string: "0x180A")
    peripheral.discoverServices([deviceInfoServiceCBUUID])
  }
}

extension DeviceListCustomView : CBPeripheralDelegate {
  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
    guard let services = peripheral.services else {
      print("No services available")
      return
    }
    
    for servive in services {
      peripheral.discoverCharacteristics(nil, for: servive)
    }
  }
  
  func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
    guard let chars = service.characteristics else {
      print("No chars available")
      return
    }
    
    for char in chars {
      peripheral.readValue(for: char)
    }
  }
  
  func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
    guard let data = characteristic.value else { return }
    
    let string = String(decoding: data, as: UTF8.self)
    print(string)
  }
}

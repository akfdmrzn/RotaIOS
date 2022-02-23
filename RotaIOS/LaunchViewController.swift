//
//  LaunchViewController.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 21.02.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    var userNameList : [String] = []
    var userPasswordList : [String] = []
    var userName = ""
    var password = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.userNameList.count > 0 && self.userPasswordList.count > 0 {
        self.userNameList = userDefaultsData.getUserNameList()
        self.userPasswordList = userDefaultsData.getUserPasswordList()
        self.userName = userDefaultsData.geUserNAme()
        self.password = userDefaultsData.getPassword()
        if self.userNameList[0] == self.userName {
            if self.userPasswordList[0] == self.password {
                self.otiPushViewController(viewController: MainPAgeViewController())
            }
        }else{
            self.otiPushViewController(viewController: LoginViewController())
        }
     }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

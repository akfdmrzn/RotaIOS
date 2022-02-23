//
//  AppDelegate.swift
//  RotaIOS
//
//  Created by Akif Demirezen on 3.05.2021.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var initialViewController :UIViewController?
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        userDefaultsData.saveLanguageId(languageId: 2)
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
       
      /*  if self.userNameList.count > 0 && self.userPasswordList.count > 0 && baseData.getTokenResponse != nil{
            if self.userNameList[0] == self.userName {
                if self.userPasswordList[0] == self.password {
                    self.initialViewController  = MainPAgeViewController(nibName:"MainPAgeViewController",bundle:nil)

                    let frame = UIScreen.main.bounds
                       window = UIWindow(frame: frame)

                    window!.rootViewController = self.initialViewController
                       window!.makeKeyAndVisible()
                    
                    return true
                }
            }
        }*/
        return true
    }
}

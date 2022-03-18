//
//  AppDelegate.swift
//  RotaIOS
//
//  Created by Akif Demirezen on 3.05.2021.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    
    var initialViewController :UIViewController?
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        userDefaultsData.saveLanguageId(languageId: 2)
        IQKeyboardManager.shared.enable = true
        
        if let filePath = Bundle.main.path(forResource: ConfigManager.shared.getFirebaseGoogleInfoPlist(), ofType: "plist"),
           let options = FirebaseOptions(contentsOfFile: filePath) {
            FirebaseApp.configure(options: options)
        } else {
            fatalError("GoogleService-Info-Dev.plist is missing!")
        }
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, _ in
            guard success else{
                return
            }
            print("Success APN Registry")
        }
        application.registerForRemoteNotifications()
       
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else{
                return
            }
            print("Token : \(token)")
        }
    }
}

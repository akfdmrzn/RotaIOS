//
//  LoginViewController.swift
//  Rota
//
//  Created by Yasin Dalkilic on 29.03.2021.
//

import Foundation
import Alamofire
import UIKit

final class LoginViewController : BaseViewController {
    @IBOutlet var viewLogin: LoginView!
    var userName = ""
    var password = ""
    var userNAmeList : [String] = []
    var userPasswordList : [String] = []
    let date = Date()
    var getTokenResponse : [GetTokenResponseModel] = []
    
    override func viewDidLoad() {
        self.userNAmeList = userDefaultsData.getUserNameList() ?? []
        self.userPasswordList = userDefaultsData.getUserPasswordList() ?? []
        self.userName = userDefaultsData.geUserNAme() ?? ""
        self.password = userDefaultsData.getPassword() ?? ""
        self.getTokenResponse = userDefaultsData.getGetToken() ?? self.getTokenResponse
        if getTokenResponse.count > 0 {
            baseData.getTokenResponse = self.getTokenResponse[0]
        }
       if self.userNAmeList.count > 0 && self.userPasswordList.count > 0 && baseData.getTokenResponse != nil{
            if self.userNAmeList[0] == self.userName {
                if self.userPasswordList[0] == self.password {
                    self.otiPushViewController(viewController: MainPAgeViewController(), animated: false)
                }
            }
        }
   
        super.viewDidLoad()
        self.viewLogin.textUsername.delegate = self
        self.viewLogin.textUsername.keyboardType = .numberPad
        self.viewLogin.textPassword.keyboardType = .numberPad
        userDefaultsData.saveUserPasswordList(passwordList: [])
        userDefaultsData.saveUserNameList(nameList: [])
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        let dateString = df.string(from: date)
        
        print(dateString)
   
        self.userName = self.viewLogin.textUsername.text ?? ""
        self.password = self.viewLogin.textPassword.text ?? ""
        userDefaultsData.savePassword(id: self.password)
        userDefaultsData.saveUserName(id: self.userName)
        self.userNAmeList.append(self.userName)
        self.userPasswordList.append(self.password)
        userDefaultsData.saveUserNameList(nameList: self.userNAmeList )
        userDefaultsData.saveUserPasswordList(passwordList: self.userPasswordList)
        if Connectivity.isConnectedToInternet {
            print("connect")
            let createTokenRequestModel = CreateTokenRequestModel.init()
            createTokenRequestModel.userName = viewLogin.textUsername.text
            createTokenRequestModel.password = viewLogin.textPassword.text
            NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .CreateToken, requestModel: createTokenRequestModel) { (response: GetTokenResponseModel) in
                if response.access_token != nil {
                    baseData.getTokenResponse = response
                    var getTokenList : [GetTokenResponseModel] = []
                    getTokenList.append(response)
                    userDefaultsData.saveGetToken(token: getTokenList)
                    print("token received - \(response.access_token ?? "")")
                    
                    NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetUser, method: .get, parameters: "") { (response : GetMyInfoResponseModel) in
                         if response.id != nil {
                             print("info recived - \(response.id ?? "")")
                             userDefaultsData.saveUserId(languageId: response.id ?? "default")
                             userDefaultsData.saveGuideId(languageId: response.guideId!)
                             userDefaultsData.saveSaleDate(saleDate: dateString)
                             
                             let getGuideInfRequestModel =  GetGuideInfoRequestModel( id : userDefaultsData.getGuideId())
                             NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetGuideInfo, method: .get, parameters: getGuideInfRequestModel.requestPathString()) { (response : GetGuideInfoResponseModel) in
                                 
                                 if response.marketGroupId != nil {
                                     
                                     userDefaultsData.saveMarketGruopId(marketGroupId: response.marketGroupId ?? 0)
                                     self.otiPushViewController(viewController: MainPAgeViewController())
                                     
                                 }else{
                                     let alert = UIAlertController(title: "Error", message: "Token has not recived", preferredStyle: UIAlertController.Style.alert)
                                     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                     self.present(alert, animated: true, completion: nil)
                                 }
                             }
                             
                         }else{
                             let alert = UIAlertController(title: "Error", message: "Token has not recived", preferredStyle: UIAlertController.Style.alert)
                             alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                             self.present(alert, animated: true, completion: nil)
                         }
                     }
                }else{
                    let alert = UIAlertController(title: "Error", message: "Invalid Username/Password.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            if userDefaultsData.getPassword() == self.password {
                if userDefaultsData.geUserNAme() == self.userName {
                    self.otiPushViewController(viewController: MainPAgeViewController())
                }
            }
        }
        
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.viewLogin.textUsername  ||  textField == self.viewLogin.textPassword {
            let allowedCharacters = "0123456789"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        } else {
            return false
        }
    }
}


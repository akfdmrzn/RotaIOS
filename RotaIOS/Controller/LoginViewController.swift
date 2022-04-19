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
    let date = Date()
    var getTokenResponse : [GetTokenResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName = userDefaultsData.geUserNAme() ?? ""
        self.password = userDefaultsData.getPassword() ?? ""
       /* self.getTokenResponse = userDefaultsData.getGetToken() ?? self.getTokenResponse
        if getTokenResponse.count > 0 {
            baseData.getTokenResponse = self.getTokenResponse[0]
        }
       if self.userName != "" &&  self.password != "" && baseData.getTokenResponse != nil{
            if userDefaultsData.geUserNAme() ?? "" == self.userName {
                if userDefaultsData.getPassword() ?? "" == self.password {
                    self.otiPushViewController(viewController: MainPAgeViewController(), animated: false)
                }
            }
        }*/
        self.viewLogin.textUsername.text = self.userName
        self.viewLogin.textPassword.text = self.password
        self.viewLogin.textUsername.delegate = self
        self.viewLogin.textUsername.keyboardType = .numberPad
        self.viewLogin.textPassword.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("burda")
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        let dateString = df.string(from: date)
        
        print(dateString)
   
        self.userName = self.viewLogin.textUsername.text ?? ""
        self.password = self.viewLogin.textPassword.text ?? ""
        
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
                             userDefaultsData.saveGuideId(languageId: response.guideId ?? 0)
                             userDefaultsData.saveSaleDate(saleDate: dateString)
                             
                             let getGuideInfRequestModel =  GetGuideInfoRequestModel( id : userDefaultsData.getGuideId())
                             NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .GetGuideInfo, method: .get, parameters: getGuideInfRequestModel.requestPathString()) { (response : GetGuideInfoResponseModel) in
                                 
                                 if response.marketGroupId != nil {
                                     userDefaultsData.savePassword(id: self.password)
                                     userDefaultsData.saveUserName(id: self.userName)
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


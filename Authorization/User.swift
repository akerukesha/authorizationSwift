//
//  User.swift
//  Authorization
//
//  Created by Нурлан on 21.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct User: Mappable {
    
    var token = ""
    var id = 0
    var email = ""
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        token <- map["token"]
        id <- map["user.id"]
        email <- map["user.email"]
    }
    
    static func authorize(email: String,
                          password: String,
                          completion: @escaping (User?, String?) -> Void) {
        let parameters = [
            "username": email,
            "password": password
        ]
        let url = "https://apivotem.solf.io/api/authe/login/"
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = value as! [String: Any]
                
                let code = json["code"] as! Int
                switch code {
                case 0:
                    completion(User(JSON: json)!, nil)
                case 6:
                    completion(nil, "email not found in server")
                default:
                    print("Пришел код ошибки, который мы не обрабатываем")
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    static func isValidPassword(password: String) -> Bool {
        if password.characters.count > 3 {
            return true
        } else {
            return false
        }
    }
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

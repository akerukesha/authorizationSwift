//
//  PasswordViewController.swift
//  Authorization
//
//  Created by Нурлан on 21.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


private struct Constants {
    static let userInfoSegue = "Show User Info"
}


class PasswordViewController: UIViewController, NVActivityIndicatorViewable {

    // MARK: - переменные
    var email: String!
    
    // MARK: - outlet'ы
    
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction private func authorize(_ sender: UIBarButtonItem) {
        let password = passwordTextField.text!
        
        // проверка на правильность пароля(минимум 4 символов)
        if User.isValidPassword(password: password) == true {
            startAnimating()
            // запрос на сервак
            User.authorize(email: email, password: password) { user, message in
                self.stopAnimating()
            
                if let message = message {
                    self.showAlertMessage(title: "Ошибка", message: message)
                } else {
                    Storage.user = user
                    self.performSegue(withIdentifier: Constants.userInfoSegue,
                                  sender: user!)
                }
            }
        } else {
            showAlertMessage(title: "Ошибка", message: "Пароль слишком короткий")

        }
    }
    
}

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
    
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        
        self.present(Storyboard.authorizationNC, animated: true, completion: nil)
        
    }
    @IBAction func editingDidBegin(_ sender: UITextField) {
        bottomView.backgroundColor = GlobalConstants.editingDidBeginColor
        
    }
    @IBAction func editingDidEnd(_ sender: UITextField) {
        bottomView.backgroundColor = GlobalConstants.editingDidEndColor
        
    }
    @IBAction func editingChanged(_ sender: UITextField) {
        if passwordTextField.text?.isEmpty == false {
            //activating "next" button
            
            let nextButton = UIBarButtonItem(title: "Далее", style: .plain, target: self, action: #selector(authorize))
            
            navigationItem.rightBarButtonItems = [nextButton]
            
        } else {
            //deactivating "next" button
            navigationItem.rightBarButtonItems = nil
        }
    }
    @IBAction private func authorize() {
        let password = passwordTextField.text!
        //hiding keyboard for preventing typing
        view.endEditing(true)
        
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

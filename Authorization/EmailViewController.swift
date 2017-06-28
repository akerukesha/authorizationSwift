//
//  EmailViewController.swift
//  Authorization
//
//  Created by Нурлан on 21.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import UIKit

private struct Constants {
    static let passwordSegue = "Show Password"
}
class EmailViewController: UIViewController {

    // MARK: - outlet'ы
    @IBOutlet private weak var emailTextField: UITextField!
    
    // MARK: - action'ы
    // показываем страницу с вводом пароля
    @IBAction private func showPassword(_ sender: UIBarButtonItem) {
        let email = emailTextField.text!
        
        // здесь должна быть проверка на правильность формата email
        if User.isValidEmail(email: email) == true {
            performSegue(withIdentifier: Constants.passwordSegue, sender: email)
        } else {
            //alert action
            showAlertMessage(title: "Ошибка", message: "Неправильный формат e-mail адреса")
            
        }
    }
    
    // MARK: - навигация
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Constants.passwordSegue:
            let destinationVC = segue.destination as! PasswordViewController
            destinationVC.email = sender as! String
        default: break
        }
    }

}

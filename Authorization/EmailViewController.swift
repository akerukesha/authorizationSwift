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
    @IBAction private func showPassword() {
        let email = emailTextField.text!
        //hiding keyboard for preventing typing
        view.endEditing(true)
        
        // проверка на правильность формата email
        if User.isValidEmail(email: email) == true {
            performSegue(withIdentifier: Constants.passwordSegue, sender: email)
        } else {
            //alert action
            showAlertMessage(title: "Ошибка", message: "Неправильный формат e-mail адреса")
            
        }
    }
    @IBOutlet weak var bottomView: UIView!
    @IBAction func editingDidBegin(_ sender: UITextField) {
        bottomView.backgroundColor = GlobalConstants.editingDidBeginColor
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        bottomView.backgroundColor = GlobalConstants.editingDidEndColor
        
    }
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBAction func editingChanged(_ sender: UITextField) {
        if emailTextField.text?.isEmpty == false {
            //activating "next" button
            
            let nextButton = UIBarButtonItem(title: "Далее", style: .plain, target: self, action: #selector(showPassword))
            
            navigationItem.rightBarButtonItems = [nextButton]
            
        } else {
            //deactivating "next" button
            navigationItem.rightBarButtonItems = nil
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

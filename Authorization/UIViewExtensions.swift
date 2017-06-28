//
//  UIViewExtensions.swift
//  Authorization
//
//  Created by Zharaskhan Aman on 6/28/17.
//  Copyright © 2017 Codebusters. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController {
    func showAlertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Да ну", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        present(alert, animated: true, completion: nil)
    }
}

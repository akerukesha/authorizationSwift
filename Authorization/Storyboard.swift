//
//  Storyboard.swift
//  Authorization
//
//  Created by Нурлан on 27.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import UIKit

// константы
private struct Constants {
    static let authorizationAndRegistrationStoryboard = "Authorization"
    
    static let authorizationNC = "Authorization Navigation Controller"
    static let tokenInfoVC = "Token Info View Controller"
}

struct Storyboard {
    // storyboard'ы
    private static let authorizationAndRegistration = UIStoryboard(name: Constants.authorizationAndRegistrationStoryboard, bundle: nil)
    
    // controller'ы
    static var authorizationNC: UINavigationController {
        return authorizationAndRegistration
            .instantiateViewController(withIdentifier: Constants.authorizationNC) as! UINavigationController
    }
    static var tokenInfoVC: TokenInfoViewController {
        return authorizationAndRegistration
            .instantiateViewController(withIdentifier: Constants.tokenInfoVC) as! TokenInfoViewController
    }
    
}

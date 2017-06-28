//
//  TokenInfoViewController.swift
//  Authorization
//
//  Created by Нурлан on 21.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import UIKit


private struct Constants {
    static let authorizationAndRegistrationStoryboard = "Authorization"
    
    static let authorizationNC = "Authorization Navigation Controller"
    static let tokenInfoVC = "Token Info View Controller"
}
class TokenInfoViewController: UIViewController {

    // MARK: - переменные
    var user = Storage.user! {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - outlet'ы
    @IBOutlet weak var tokenLabel: UILabel!
    
    // MARK: - внутренние функции
    private func updateUI() {
        tokenLabel?.text = user.toJSONString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    @IBAction func cacheClearAction(_ sender: UIButton) {
        //Removing user info from cache
        Storage.user = nil
        
        //Changing view to main
        self.present(Storyboard.authorizationNC, animated: true, completion: nil)
    }
    
}

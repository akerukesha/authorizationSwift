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
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var avatarViewer: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // MARK: - внутренние функции
    private func updateUI() {
        
        //tokenLabel?.text = user.toJSONString()
        fullNameLabel.text = "Full name: " + user.full_name
        emailLabel.text = "E-mail: " + user.email
        //print (user.toJSONString())
        let url = user.avatarURL
        //let url = "https://unsplash.it/200/300/?random"
        if Storage.image == nil {
            print ("new image")
            avatarViewer.image = nil
            spinner.startAnimating()
            ImageDownloader.fetchImage(with: url) { image in
                self.spinner.stopAnimating()
                Storage.image = image

                
                self.avatarViewer.image = Storage.image
                
                
            }
        } else {
            avatarViewer.image = Storage.image
        }
        
        
        

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    @IBAction func cacheClearAction(_ sender: UIButton) {
        updateUI()
        //Removing user info from cache
        Storage.user = nil
        Storage.image = nil
        //Changing view to main
        self.present(Storyboard.authorizationNC, animated: true, completion: nil)
    }
    
}

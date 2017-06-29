//
//  ImageDownloader.swift
//  Authorization
//
//  Created by Zharaskhan Aman on 6/28/17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

struct ImageDownloader {
    
    static func fetchImage(with url: String,
                           completion: @escaping (UIImage) -> Void) {
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                completion(image)
            }
        }
    }
    
}

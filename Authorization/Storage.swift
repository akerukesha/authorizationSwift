//
//  Storage.swift
//  Authorization
//
//  Created by Нурлан on 27.06.17.
//  Copyright © 2017 Codebusters. All rights reserved.
//

import Cache

private struct Caches {
    static let jsonCache = SpecializedCache<JSON>(name: "JSON Cache")
    
    static let imageCache = SpecializedCache<UIImage>(name: "Image Cache")
}

private struct Keys {
    static let user = "User"
    static let image = "Image"
}

struct Storage {
    
    static var user: User? {
        get {
            if let json = Caches.jsonCache.object(forKey: Keys.user) {
                switch json {
                case .dictionary(let userJSON): return User(JSON: userJSON)!
                default: break
                }
            }
            return nil
        }
        set {
            if let user = newValue {
                try! Caches.jsonCache.addObject(JSON.dictionary(user.toJSON()), forKey: Keys.user)
            } else {
                try! Caches.jsonCache.removeObject(forKey: Keys.user)
            }
        }
    }
    
    static var image: UIImage? {
        get {
            return Caches.imageCache.object(forKey: Keys.image)
                
        }
        set {
            if let image = newValue {
                try! Caches.imageCache.addObject(image, forKey: Keys.image)
            } else {
                try! Caches.imageCache.removeObject(forKey: Keys.image)
            }
        }
    }

    
}

//
//  UserDefault+Helpers.swift
//  audible
//
//  Created by Patnayak, Nilikh on 9/29/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

enum userDefaultKeys: String {
    case isLoggedIn
}

extension UserDefaults {
    
    
    
    func setUserLoggedInStatus(status: Bool) {
        set(status, forKey: userDefaultKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func getUserLoggedInStatus() -> Bool {
        return bool(forKey: userDefaultKeys.isLoggedIn.rawValue)
    }
}

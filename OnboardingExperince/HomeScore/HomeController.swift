//
//  HomeController.swift
//  audible
//
//  Created by Patnayak, Nilikh on 9/28/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        navigationItem.title = "We're logged in"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    func handleLogout() {
        print("Logout tapped")
        let userDefaults = UserDefaults.standard
        userDefaults.setUserLoggedInStatus(status: false)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginViewController, animated: true, completion: nil)
    }
}

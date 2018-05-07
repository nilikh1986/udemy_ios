//
//  MainNavigationController.swift
//  audible
//
//  Created by Patnayak, Nilikh on 9/28/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        if isUserLoggedIn() {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let homeController = storyBoard.instantiateViewController(withIdentifier: "HomeController")
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.0)
        }
    }
    
    
    func showLoginController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginViewController, animated: true, completion: {
            // perhaps will do something here
        })
    }
    
    
    func isUserLoggedIn() -> Bool {
        //let status = UserDefaults.standard.getUserLoggedInStatus()
        return UserDefaults.standard.getUserLoggedInStatus()
    }
}

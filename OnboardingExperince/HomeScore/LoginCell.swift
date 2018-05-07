//
//  LoginCell.swift
//  audible
//
//  Created by Patnayak, Nilikh on 9/27/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func finishLoggingIn()
}

class LoginCell: UICollectionViewCell {
    
    var loginViewController: LoginViewController?
    weak var delegate: LoginDelegate?
    
    override func awakeFromNib() {
    }
    
    @IBAction func handleLogin() {
        print("123")
        delegate?.finishLoggingIn()
    }
    
}

class LoginTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
    }
}

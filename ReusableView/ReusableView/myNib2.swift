//
//  myNib2.swift
//  ReusableView
//
//  Created by Patnayak, Nilikh on 1/30/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class myNib2: UIView {

    @IBOutlet weak var myButton: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed!")
        
    }
}

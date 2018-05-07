//
//  NibCell.swift
//  TestTableView
//
//  Created by Patnayak, Nilikh on 10/30/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import Foundation
import UIKit

class NibCell: UITableViewCell {
    
    @IBOutlet weak var nibLabel: UILabel!
    
    override func awakeFromNib() {
        nibLabel.text = "This is staic nib"
    }
    
    func configureCell() {
        nibLabel.text = " override This is staic nib"
    }
    
}

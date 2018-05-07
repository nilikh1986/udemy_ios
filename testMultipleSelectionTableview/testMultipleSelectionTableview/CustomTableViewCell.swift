//
//  CustomTableViewCell.swift
//  testMultipleSelectionTableview
//
//  Created by Patnayak, Nilikh on 1/22/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .yellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundColor = .green
        } else {
            self.backgroundColor = .red
        }
        // Configure the view for the selected state
    }

}

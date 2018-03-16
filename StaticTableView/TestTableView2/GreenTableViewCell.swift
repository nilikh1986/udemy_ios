//
//  GreenTableViewCell.swift
//  TestTableView2
//
//  Created by Patnayak, Nilikh on 3/15/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

protocol GreenCellDelegate {
    func reloadRowAtIndex(_ indexPath: IndexPath)
}

class GreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var existingAddressLabel: UILabel!
    @IBOutlet weak var addAddressLabel:UILabel!
    var cellIndexPath: IndexPath?
    var greenCellDelegate: GreenCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func existingAddressButtonTapped(_ sender: UIButton) {
        print("existing button tapped!")
        existingAddressLabel.text = "This is the existing address \n second line of address"
        addAddressLabel.text = ""
        greenCellDelegate?.reloadRowAtIndex(cellIndexPath!)
    }
    
    
    @IBAction func newAddressButtonTapped(_ sender: UIButton) {
        print("new button tapped!")
        existingAddressLabel.text = ""
        addAddressLabel.text = "This is very very very very very veryvery very veryvery very very long content.It could be any view that has intrinsic content size This is very very very very very veryvery very veryvery very very long content.It could be any view that has intrinsic content sizeThis is very very very very very veryvery very veryvery very very long content.It could be any view that has intrinsic content size"
        greenCellDelegate?.reloadRowAtIndex(cellIndexPath!)
    }
}

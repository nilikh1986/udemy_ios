//
//  DynamicContentTableViewController.swift
//  TestTableView2
//
//  Created by Patnayak, Nilikh on 3/13/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class DynamicContentTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let cellIdentifier = cell.reuseIdentifier
        switch cellIdentifier! {
        case "RedCell":
            print("This is red cell")
        case "GreenCell":
            print("This is green cell")
            let greenCell = cell as! GreenTableViewCell
            greenCell.cellIndexPath = indexPath
            greenCell.greenCellDelegate = self
            
            // Some logic should be there which label to set when the screen comes up first time.
            greenCell.existingAddressLabel.text = "This is the existing address \n second line of address and it can be of any lenght"
            greenCell.addAddressLabel.text = ""
        case "BlueCell":
            print("This is blue cell")
            let blueCell = cell as! BlueTableViewCell
            blueCell.blueLabel.text = "This is very long label. Row height will set according to the content of the cell This is very long label. "
        default:
            print("No cell found")
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

extension DynamicContentTableViewController: GreenCellDelegate {
    func reloadRowAtIndex(_ indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}



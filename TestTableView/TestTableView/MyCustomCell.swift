//
//  MyCustomCell.swift
//  TestTableView
//
//  Created by Patnayak, Nilikh on 10/30/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import Foundation
import UIKit

class MyCustomCell: UITableViewCell {
    
    @IBOutlet weak var testLabel: UILabel!
    
//    let testLabel2: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .gray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .brown
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
        //addSubview(testLabel2)

        
//        
//        
//        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[testLabel]|", options: [], metrics: nil, views: ["testLabel": testLabel2])
//        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[testLabel]|", options: [], metrics: nil, views: ["testLabel": testLabel2])
//        NSLayoutConstraint.activate(hConstraints)
//        NSLayoutConstraint.activate(vConstraints)
//        configureCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell() {
        //self.testLabel.text = "From configure cell!"
        
        //self.testLabel2.text = "2From configure cell!"
    }
    
}

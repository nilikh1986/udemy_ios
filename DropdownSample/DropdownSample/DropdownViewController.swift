//
//  DropdownViewController.swift
//  DropdownSample
//
//  Created by Patnayak, Nilikh on 12/20/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class DropdownViewController: UIViewController {
    @IBOutlet weak var sampleButton: UIButton!
    
    var button = DropdownBtn()
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleButton.isEnabled = false;
        button = DropdownBtn(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Colors", for: .normal)
        
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.dropView.dropdownOptions = ["Option1", "Option2", "Option2", "Option2", "Option2", "Option2", "Option5"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


protocol dropdownProtocol {
    func didSelectDropdownItem(item: String)
}


class DropdownBtn: UIButton, dropdownProtocol {
    func didSelectDropdownItem(item: String) {
        self.setTitle(item, for: .normal)
    }
    
    var dropView = DropdownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        dropView = DropdownView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropView.translatesAutoresizingMaskIntoConstraints = false
        dropView.delegate = self
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            // open the table view
            isOpen = true
            
            NSLayoutConstraint.deactivate([height])
            if self.dropView.tableView.contentSize.height > 150 {
                height.constant = 150
            } else {
                height.constant = self.dropView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            // close the table view
            isOpen = false
            
            NSLayoutConstraint.deactivate([height])
            height.constant = 0
            NSLayoutConstraint.activate([height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class DropdownView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var dropdownOptions = [String]()
    var tableView = UITableView()
    var delegate: dropdownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.backgroundColor = .darkGray
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = dropdownOptions[indexPath.row]
        cell.backgroundColor = .darkGray
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropdownOptions[indexPath.row])
        self.delegate.didSelectDropdownItem(item: dropdownOptions[indexPath.row])
    }
}









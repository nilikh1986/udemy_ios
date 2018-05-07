//
//  ViewController.swift
//  TestTableView
//
//  Created by Patnayak, Nilikh on 10/30/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.becomeFirstResponder()
        //self.tableView.register(NibCell.self, forCellReuseIdentifier: "nibCell")
        //let nibName = UINib(nibName: "NibCell", bundle: nil)
        //self.tableView.register(nibName, forCellReuseIdentifier: "nibCell")
        self.tableView.register(MyCustomCell.self, forCellReuseIdentifier: "nibCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath) as! MyCustomCell
        cell.configureCell()
        return cell
    }
    
    /*
    override var inputAccessoryView: UIView? {
        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        accessoryView.backgroundColor = .red
        return accessoryView
    }
*/

}


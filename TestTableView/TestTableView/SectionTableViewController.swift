//
//  SectionTableViewController.swift
//  TestTableView
//
//  Created by Patnayak, Nilikh on 5/7/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class SectionTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Change the table view style from storyboard to toggle between fixed and floating section header.
        
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        tableHeaderView.backgroundColor = .red
        
        let tableViewHeaderLabel = UILabel(frame: tableHeaderView.frame)
        tableViewHeaderLabel.text = "TableView header"
        tableHeaderView.addSubview(tableViewHeaderLabel)
        tableView.tableHeaderView = tableHeaderView
        
        
        
        let tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        tableFooterView.backgroundColor = .brown
        
        let tableViewFooterLabel = UILabel(frame: tableHeaderView.frame)
        tableViewFooterLabel.text = "TableView Footer"
        tableFooterView.addSubview(tableViewFooterLabel)
        tableView.tableFooterView = tableFooterView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        sectionHeader.backgroundColor = .yellow
        
        let sectionHeaderLabel = UILabel(frame: sectionHeader.frame)
        sectionHeaderLabel.text = "Section \(section) header"
        sectionHeader.addSubview(sectionHeaderLabel)
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFooter = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        sectionFooter.backgroundColor = .cyan
        
        let sectionFooterLabel = UILabel(frame: sectionFooter.frame)
        sectionFooterLabel.text = "Section \(section) footer"
        sectionFooter.addSubview(sectionFooterLabel)
        
        return sectionFooter
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

//
//  FirstModalViewController.swift
//  testModalView
//
//  Created by Patnayak, Nilikh on 4/30/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class FirstModalViewController: UIViewController {

    @IBOutlet weak var textfieldHeightContraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Select Address"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAddress))
        
    }
    
    @objc func addAddress() {
        print("Show add address screen")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentSecondModal(_ sender: Any) {
        let secondModalViewCtrl = self.storyboard?.instantiateViewController(withIdentifier: "secondModal")
        present(secondModalViewCtrl!, animated: true, completion: nil)
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func option1Tapped(_ sender: Any) {
        let textfieldHeight = textfieldHeightContraint.constant
        if textfieldHeight == 0 {
            textfieldHeightContraint.constant = 80
        } else {
            textfieldHeightContraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
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

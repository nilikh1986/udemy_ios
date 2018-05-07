//
//  FirstViewController.swift
//  testModalView
//
//  Created by Patnayak, Nilikh on 4/30/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentModal(_ sender: Any) {
        let fistModalViewCtrl = self.storyboard?.instantiateViewController(withIdentifier: "firstModal")
        let navCtrl = UINavigationController(rootViewController: fistModalViewCtrl!)
        navCtrl.modalPresentationStyle = .overFullScreen
        present(navCtrl, animated: true, completion: nil)
    }
    
    @IBAction func pushScreen(_ sender: Any) {
        let fistModalViewCtrl = self.storyboard?.instantiateViewController(withIdentifier: "firstModal")
        fistModalViewCtrl?.view.backgroundColor = .yellow
        self.navigationController?.pushViewController(fistModalViewCtrl!, animated: true)
    }
    
}


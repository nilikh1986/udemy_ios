//
//  TinerAnimationViewController.swift
//  DropdownSample
//
//  Created by Patnayak, Nilikh on 12/22/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class TinerAnimationViewController: UIViewController {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var card: UIView!
    var divisor: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (0.61 / (self.view.frame.width / 2))
    }

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let touchDisplacement = sender.translation(in: view)
        
        let xFromCenter = card.center.x - view.center.x
        
        let scale = min(100/abs(xFromCenter), 1)
        card.center = CGPoint(x: view.center.x + touchDisplacement.x, y: view.center.y + touchDisplacement.y)
        card.transform = CGAffineTransform(rotationAngle: divisor * xFromCenter).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "moreImagesCamera")
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "profile")
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == .ended {
            
            if card.center.x < 75 {
                // move off the card to left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })
            } else if card.center.x > view.frame.width - 75 {
                // move off the card to right
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = self.view.center
                    self.thumbImageView.alpha = 0
                })
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.card.center = self.view.center
            self.thumbImageView.alpha = 1
            self.card.alpha = 1
            self.card.transform = CGAffineTransform.identity
        })
    }
    
}

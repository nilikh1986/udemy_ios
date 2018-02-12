//
//  XIbView.swift
//  ReusableView
//
//  Created by Patnayak, Nilikh on 1/30/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

import UIKit

@IBDesignable
class XIbView: UIView {

    var contentView: UIView?
    @IBInspectable var nibName: String = "myXIb"
    @IBInspectable var labelText: String = ""
    
    @IBOutlet weak var myLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Nib is awakening!")
        xibSetup()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        xibSetup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        //fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
//        xibSetup()
//    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else {return}
        view.frame = bounds
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    
//    func loadViewFromNib() -> UIView? {
//        //let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: nibName, bundle: nil)
//        return nib.instantiate(
//            withOwner: self,
//            options: nil).first as? UIView
//    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
        myLable.text = labelText
    }

}

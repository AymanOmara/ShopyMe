//
//  RightNavBarView.swift
//  Shopify e-commerce
//
//  Created by Ahmd Amr on 12/06/2021.
//  
//

import UIKit

class RightNavBarView: UIView {
    
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var quantityLabrl: UILabel!
    @IBOutlet private weak var quantityViewContainer: UIView!
    
    
    var quantity: String!{
        didSet{
            if (UserData.sharedInstance.isLoggedIn()) {
                if quantity == "0"{
                    quantityViewContainer.isHidden = true
                } else {
                    quantityViewContainer.isHidden = false
                    quantityLabrl.text = quantity
                }
            } else {
                quantityViewContainer.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {  // for using custom view in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {   // for using custom view in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("RightNavBarView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        quantityViewContainer.layer.cornerRadius = self.layer.frame.width / 11
        quantityViewContainer.layer.masksToBounds = true
    }
}

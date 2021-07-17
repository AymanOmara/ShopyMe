//
//  ProductsCollectionViewCell.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 5/25/21.
//  
//

import UIKit
import SDWebImage

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    
    var productObject:CategoryProduct!{
        didSet{
            productNameLabel.text = productObject.title
            productImage.sd_setImage(with: URL(string: productObject.image.src), placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    var allProductObject:SearchProduct!{
        didSet{
            productNameLabel.text = allProductObject.variants[0].price + " " + UserData.sharedInstance.getCurrency()
            productImage.sd_setImage(with: URL(string: allProductObject.image.src), placeholderImage: UIImage(named: "placeholder"))
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }

}

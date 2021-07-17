//
//  ImageCollectionViewCell.swift
//  Shopify e-commerce
//
//  Created by Ahmd Amr on 06/06/2021.
//  
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var productImage: UIImageView!
    
    var productImgObj: ProductDetailsImage!{
        didSet{
            productImage.sd_setImage(with: URL(string: productImgObj.src ?? "" ), placeholderImage: UIImage(named: "1"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

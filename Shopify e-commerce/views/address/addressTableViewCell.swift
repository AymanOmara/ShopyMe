//
//  addressTableViewCell.swift
//  Shopify e-commerce
//
//  Created by marwa on 6/15/21.
//  
//

import UIKit
import RxSwift
import RxCocoa

class addressTableViewCell: UITableViewCell {
    var disposBag = DisposeBag()
 
    @IBOutlet weak var countryAndCity: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
}

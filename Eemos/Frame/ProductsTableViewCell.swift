//
//  ProductsTableViewCell.swift
//  Eemos
//
//  Created by User on 24/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var productIamge: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
   
    @IBOutlet weak var bunNowbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cornerRadius: CGFloat = 13
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topRight,.topLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
       
        let mask = CAShapeLayer()
        mask.path = path.cgPath
       
        self.productIamge.layer.mask = mask
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

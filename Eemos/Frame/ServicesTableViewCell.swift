//
//  ServicesTableViewCell.swift
//  Eemos
//
//  Created by User on 23/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ServicesTableViewCell : UITableViewCell {
    
    @IBOutlet weak var serviceimage: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code goes here
       
        let cornerRadius: CGFloat = 13
        let shadowColor: UIColor? = UIColor.black
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 1
        let shadowOpacity: Float = 0.3
        
         self.serviceimage.layer.cornerRadius = cornerRadius
         self.serviceimage.layer.shadowColor = shadowColor?.cgColor
         self.serviceimage.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        
         let shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius: cornerRadius)
        
         self.serviceimage.layer.shadowPath = shadowPath.cgPath
         self.serviceimage.layer.shadowOpacity = shadowOpacity
        
    }
    
}

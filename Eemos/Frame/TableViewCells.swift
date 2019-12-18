//
//  TableViewCells.swift
//  Eemos
//
//  Created by sailaja on 11/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class CollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var iageView: UIImageView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
          // Initialization code goes here
        iageView.frame =  CGRect(x: 0, y: 0, width: 150, height: 150)
           
       }
    func setWidth(width:CGFloat){
        self.width.constant = width
    }
   
    }
class offersTableViewCell : UITableViewCell{
    
    @IBOutlet weak var imageview: UIImageView!
}



//
//  BookUsnewTableViewCell.swift
//  Eemos
//
//  Created by User on 25/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class BookUsnewTableViewCell: UITableViewCell {


    @IBOutlet weak var addbtn: ButtonRound!
    
    @IBAction func addbtnPressed(_ sender: ButtonRound) {
   
        if addbtn.titleLabel?.text == "Add"{
            
           addbtn.setTitle("Drop", for: .normal)
            addbtn.titleLabel?.font = .systemFont(ofSize: 12)
            
        }else if addbtn.titleLabel?.text == "Drop"{
            
            addbtn.setTitle("Add", for: .normal)
            addbtn.titleLabel?.font = .systemFont(ofSize: 15)
            
        }
    }
   
    @IBOutlet weak var serviceLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }
    
    

}

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


class StoriesTableViewCell : UITableViewCell{
    @IBOutlet weak var paraLabel: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var headingLable: UILabel!
    @IBOutlet weak var readMorebtn: UIButton!
    var heightConstraint = NSLayoutConstraint()
     var hide = true
    override func awakeFromNib() {
              super.awakeFromNib()
             self.heightConstraint = NSLayoutConstraint(item: self.paraLabel as Any, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
                 NSLayoutConstraint.activate([ heightConstraint])
          }
    
  
    @IBAction func readMorepressed(_ sender: UIButton) {
        
        print(sender.tag)
        print(paraLabel.tag)

    }
    func maintainConstrainsTrue(){
        readMorebtn.setTitle("Read more", for: .normal)
          UIView.animate(withDuration: 10.0) {
           NSLayoutConstraint.activate([ self.heightConstraint])
                 }
        
    }
    func maintainConstrainsFalse(){
        readMorebtn.setTitle("Read less", for: .normal)
        UIView.animate(withDuration: 10.0) {
            self.heightConstraint.isActive = false
               }
       
    }
}

class BlogTableViewCell : UITableViewCell{
    @IBOutlet weak var paraLabel: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var headingLable: UILabel!
    @IBOutlet weak var readMorebtn: UIButton!
    var heightConstraint = NSLayoutConstraint()
     var hide = true
    override func awakeFromNib() {
              super.awakeFromNib()
             self.heightConstraint = NSLayoutConstraint(item: self.paraLabel as Any, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
                 NSLayoutConstraint.activate([ heightConstraint])
          }
    
  
    @IBAction func readMorepressed(_ sender: UIButton) {
        
        print(sender.tag)
        print(paraLabel.tag)

    }
    func maintainConstrainsTrue(){
        readMorebtn.setTitle("Read more", for: .normal)
          UIView.animate(withDuration: 10.0) {
           NSLayoutConstraint.activate([ self.heightConstraint])
                 }
        
    }
    func maintainConstrainsFalse(){
        readMorebtn.setTitle("Read less", for: .normal)
        UIView.animate(withDuration: 10.0) {
            self.heightConstraint.isActive = false
               }
       
    }
}

class AcadamyTableViewCell:UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    
    
}

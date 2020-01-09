//
//  BlogsViewController.swift
//  Eemos
//
//  Created by sailaja on 23/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class BlogsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
  
    
    @IBOutlet weak var tableview: UITableView!
      let imagesArray = BlogConstants.imagesArray
      let headingsArray = BlogConstants.headingArray
      let paraArray = BlogConstants.paraArray
      let boldParasArrays = BlogConstants.boldarray
    
var readSelected = Set<Int>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BlogTableViewCell
         
         cell.readMorebtn.tag = indexPath.row
         cell.paraLabel.tag = indexPath.row
         cell.headingLable.attributedText = attributedText(indexPath:  headingsArray[indexPath.row])
         cell.imageview.image = UIImage(named: imagesArray[indexPath.row])
         cell.paraLabel.attributedText = attributedText1(string: paraArray[indexPath.row], indexPath: indexPath)
        
         // checks read more pressed or not
         if checkReadmore(index: indexPath.row){
             cell.maintainConstrainsFalse()
         }else{
             cell.maintainConstrainsTrue()
         }
         cell.readMorebtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
         
         return cell
    }
    // Read more button action
       @objc func buttonClicked(sender : UIButton) {
           
           self.tableview.reloadData()
           updateSet(index: sender.tag)
           
       }
       func checkReadmore(index:Int)->Bool{
           if readSelected.contains(index){
               return true
           }else {
               return false
           }
       }
       func updateSet(index : Int){
           if readSelected.contains(index){
               readSelected.remove(index)
           }else {
               readSelected.insert(index)
           }
       }
       
       func attributedText(indexPath : String) -> NSAttributedString {
           
           
           let attributedString = NSMutableAttributedString(string: indexPath , attributes: [NSAttributedString.Key.font:UIFont(name: "Palatino-Bold", size: 20)])
           
           let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Palatino", size: 18)]
           let nsString = indexPath as NSString
           // Part of string to be bold
           attributedString.addAttributes(boldFontAttribute, range: nsString.range(of: indexPath))
           
           return attributedString
       }
       
       func attributedText1(string : String,indexPath : IndexPath) -> NSAttributedString {
           let style = NSMutableParagraphStyle()
           style.alignment = .left
           style.headIndent = 10
           
           
           let style1 = NSMutableParagraphStyle()
           style1.alignment = .left
           style1.headIndent = 15
           
           let attributedString = NSMutableAttributedString(string: string
               , attributes: [NSAttributedString.Key.font:UIFont(name: "Palatino", size: 18),NSAttributedString.Key.paragraphStyle :style])
           
           let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Palatino-Bold", size: 18),NSAttributedString.Key.paragraphStyle : style1]
           
           let nsString =  string as NSString
           let parArray = boldParasArrays[indexPath.row]
           // Part of string to be bold
           for para in parArray{
               attributedString.addAttributes(boldFontAttribute as [NSAttributedString.Key : Any], range: nsString.range(of: para))
           }
           
           
           return attributedString
       }
       
}

//
//  ServicesInfoController.swift
//  Eemos
//
//  Created by User on 07/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ServicesInfoController :UITableViewController {
   
    var mainindexPath = IndexPath()
    let imagesArray   = ServicesInfo.images
    let textArrays    = ServicesInfo.servicesInfotextArrays
    let headingArrays = ServicesInfo.ServicesHeadingArrays
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArrays[mainindexPath.row].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceInfoTableViewCell", for: indexPath) as! ServicesInfoTebleView
       
        
        cell.textView.attributedText = attributedText(indexPath: indexPath)
        cell.imageview.image = UIImage(named: imagesArray[mainindexPath.row][indexPath.row])

        return cell
    }
    
    func attributedText(indexPath : IndexPath) -> NSAttributedString {
           
                
        let attributedString = NSMutableAttributedString(string: textArrays[mainindexPath.row][indexPath.row] as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0)])

           let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
        
        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: textArrays[mainindexPath.row][indexPath.row].range(of: headingArrays[mainindexPath.row][indexPath.row]))

           return attributedString
       }
}

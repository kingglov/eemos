//
//  ProductController.swift
//  Eemos
//
//  Created by User on 24/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ProductsController :UIViewController,UITableViewDataSource,UITableViewDelegate{
   
    let productImages = Products.productImages
    let productNames  = Products.productNames
    let productPrices = Products.productPrices
    let proPrices = Products.productPrice
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           self.navigationController?.navigationBar.isHidden = false
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                   self.navigationController?.navigationBar.isHidden = true

       }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsTableViewCell
        
        cell.bunNowbtn.tag = indexPath.row
    
        cell.bunNowbtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        cell.productIamge.image = UIImage(named: productImages[indexPath.row])
        cell.productNameLabel.text = productNames[indexPath.row]
        cell.productPriceLabel.text = productPrices[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToProductinfo(indexpath: indexPath)
        
        }
    
    // Buy Now button action
    @objc func buttonClicked(sender : UIButton) {
           
           let indexPath = IndexPath(row: sender.tag, section: 0)
           navigateToProductinfo(indexpath: indexPath)

          }
    
    // navigate to productInfo controller
    func navigateToProductinfo(indexpath:IndexPath){
        
        let   destinationVC = storyboard?.instantiateViewController(withIdentifier: "ProductInfoVC") as! ProductsInfoController
        
        destinationVC.product = indexpath
        destinationVC.productName = productNames[indexpath.row]
        destinationVC.productPrice = proPrices[indexpath.row]
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    
    }
   

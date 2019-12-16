//
//  ProductsInfoController.swift
//  Eemos
//
//  Created by User on 08/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ProductsInfoController:UIViewController{
  
    
    
  
    var productName = ""
    var productPrice = ""
    var product = IndexPath()
    @IBOutlet weak var infoView: UITextView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    let productImages    = ProductsInfo.productImages
    let descreptionArray = ProductsInfo.descreptionArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

       infoView.attributedText = attributedText(string: descreptionArray[product.row])
        productImage.image = UIImage(named: productImages[product.row])
    }
    
  @IBAction func ibuyNowbtnPressed(_ sender: UIButton) {

    let destinationVC = storyboard?.instantiateViewController(withIdentifier: "BuyProducts") as! BuyProductsViewController
    destinationVC.item = productName
    destinationVC.price = productPrice
    self.navigationController?.pushViewController(destinationVC, animated: true)
      }
    
    
    func attributedText(string:NSString) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
               style.alignment = .left
               style.headIndent = 19
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0)])
        
        let boldFontAttribute1 = [NSAttributedString.Key.paragraphStyle :style]

        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]

        // Part of string to be bold
    
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Description :"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Ingredients :"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "How to use :"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Benefits :"))
        // 4
        
        if product.row == 0{
            attributedString.addAttributes(boldFontAttribute1, range: string.range(of: "\n • Eemos Hair Serum Has Innumerable Benefits.\n • It Adds Polish And Shine To Every Hair Strand.\n • It Protects And Controls Frowziness And Provides Easy Manageable Hair.\n • It Makes Hair Smooth And Adds Lustre\n • It Helps In Strengthening And Smoothing Of Hair\n • It Has All Benefits Of Vit. E Oil\n • Suitable For All Hair Type\n • Target Audience Man & Women."))
        }else if product.row == 1{
            attributedString.addAttributes(boldFontAttribute1, range: string.range(of: "\n • eemos strengthening conditioner helps in thickening hair.\n • It helps in easy detangling.\n • It prevents moisture loss.\n • It helps to prevent breakage of hair.\n • It strengthens hair strands.\n • It is paraben free\n • It helps to prevents premature greying.\n • It makes hair soft& lustre.\n • Suitable for all hair types\n • Target audience men& women."))
        }else if product.row == 2{
            attributedString.addAttributes(boldFontAttribute1, range: string.range(of: "\n • Eemos hair strengthening shampoo has mild cleansing effect and avoilds oily scalp.\n • It also nourishes and provide s strengthening  to hair.\n • It controls dry & frizziness.\n • It also helps in spilt correction\n • It is paraben free shampoo.\n • It is suitable for all hair types.\n • Target audience  men & women."))
        }
       
        return attributedString
    }
}

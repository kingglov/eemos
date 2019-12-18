//
//  AcadamyViewController.swift
//  Eemos
//
//  Created by sailaja on 18/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class AcadamyViewController: UIViewController {

    @IBOutlet weak var stdlbl: UILabel!
    @IBOutlet weak var textView: UITextView!
   
    @IBOutlet weak var freelancersLbl: UILabel!
    @IBOutlet weak var employeeslbl: UILabel!
    @IBOutlet weak var entrepreurLbl: UILabel!
        let text = "\nBeauty Parlour Courses in Tirupati \n\n • Basic Beauty Course \n • Advance Beauty Course \n • Professional Beauty Course Hair \n • Dressing Course \n • Makeup Course" as NSString
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.attributedText = attributedText(string: text)
    }
    override func viewDidAppear(_ animated: Bool) {
    incrementLabel(to: 70)
    }
    func incrementLabel(to endValue: Int) {
        
        let duration: Double = 1.2 //seconds
            DispatchQueue.global().async {
                for i in 0 ..< (endValue + 1) {
                    let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                    usleep(sleepTime)
                    DispatchQueue.main.async {
                        
                        if i <= 10 {
                            self.freelancersLbl.text = "\(i)+"
                            self.employeeslbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                            self.stdlbl.text = "\(i)+"
                        }else if i <= 20 {
                            self.employeeslbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                            self.stdlbl.text = "\(i)+"
                        }else if i <= 25 {
                            self.stdlbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                        }else if i <= 70 {
                            self.stdlbl.text = "\(i)+"
                        }
                        
                    }
                }
            }
        }

    @IBAction func learnMorebtn(_ sender: UIButton) {
        let url = URL(string:  "https://www.eemos.in/beauty-parlour-course/")!
     if   UIApplication.shared.canOpenURL(url){
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    func attributedText(string:NSString) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
               style.alignment = .left
               style.headIndent = 19
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 22.0)])
        
        let boldFontAttribute1 = [NSAttributedString.Key.paragraphStyle :style]

        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22.0)]

        // Part of string to be bold
    
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Beauty Parlour Courses in Tirupati"))
       
            attributedString.addAttributes(boldFontAttribute1, range: string.range(of: "\n • Basic Beauty Course \n • Advance Beauty Course \n • Professional Beauty Course Hair \n • Dressing Course \n • Makeup Course"))
       
       
        return attributedString
    }
}

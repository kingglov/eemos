//
//  AcadamyViewController.swift
//  Eemos
//
//  Created by sailaja on 18/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class AcadamyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    @IBOutlet weak var stdlbl: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var freelancersLbl: UILabel!
    @IBOutlet weak var employeeslbl: UILabel!
    @IBOutlet weak var entrepreurLbl: UILabel!
        
    let textArray = AcadamyCon.textArray

    let imagesArray = AcadamyCon.imagesArray
    let headingArray = AcadamyCon.imagesArray
    override func viewDidLoad() {
        super.viewDidLoad()

//        textView.attributedText = attributedText(string: text)
    }
    override func viewDidAppear(_ animated: Bool) {
    incrementLabel(to: 151)
    }
    func incrementLabel(to endValue: Int) {
        
        let duration: Double = 1.2 //seconds
            DispatchQueue.global().async {
                for i in 0 ..< (endValue + 1) {
                    let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                    usleep(sleepTime)
                    DispatchQueue.main.async {
                        
                        if i <= 20 {
                            self.freelancersLbl.text = "\(i)+"
                            self.employeeslbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                            self.stdlbl.text = "\(i)+"
                        }else if i <= 31 {
                            self.employeeslbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                            self.stdlbl.text = "\(i)+"
                        }else if i <= 85 {
                            self.stdlbl.text = "\(i)+"
                            self.entrepreurLbl.text = "\(i)+"
                        }else if i <= 150 {
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
    
    
    func attributedText(index:IndexPath) -> NSAttributedString {
        
        let string = textArray[index.row]
        let boldString = headingArray[index.row]
        
        let style = NSMutableParagraphStyle()
               style.alignment = .left
               style.headIndent = 19
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0)])
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24.0)]

        // Part of string to be bold
    
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: boldString))
       
            
       
       
        return attributedString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AcadamyTableViewCell
        
        cell.label.attributedText = attributedText(index: indexPath)
        cell.imageview.image = UIImage(named: imagesArray[indexPath.row])
        return cell
    }
}

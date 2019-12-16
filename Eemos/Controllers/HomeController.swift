//
//  HomeController.swift
//  Eemos
//
//  Created by User on 20/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class HomeController : UIViewController{
    
    @IBOutlet weak var lableHight: NSLayoutConstraint!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pageViewController: UIPageControl!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let c = AboutUsConstants.self
    var imgArr = [      UIImage(named:"special-offers1"),
                        UIImage(named:"acadamy2") ,
                        UIImage(named:"acadamy") ,
                        UIImage(named:"products") ,
                        UIImage(named:"flat20") ,
                        UIImage(named:"cidesco")  ]
        
        var timer = Timer()
        var counter = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
// lableHight.constant = 700
            // create an NSMutableAttributedString that we'll append everything to
            let fullString = NSMutableAttributedString(string: "Start of text\n\n")

            // create our NSTextAttachment
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = UIImage(named: "cidesco")

            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: image1Attachment)

            // add the NSTextAttachment wrapper to our full string, then add some more text.
            fullString.append(image1String)
            fullString.append(NSAttributedString(string: "\n\nEnd of textDescription :\n    The system gently cleanses and nourishes hair, leaving hair Feeling moisturized, beautiful & soft. It is also safe for colour treated hair and chemically treated hair. It can be used as everyday shampoo. Apply the eemos strengthening shampoo to wet hair gently massage in to scalp and work in to a lather. Rinse thoroughly from roots to tips. This shampoo is suited for all hair types. (Follow with eemos thickening shampoo)\n\nIngredients :\n    Aqua, Sodium Lauryl Ether Sulphate, Cocamidopropyl Betaine, Cocamide MEA, Ethylene Glycol Distearate, Perfume, Dimethicone, Sodium chloride, Disodium EDTA, Sodium Hydeoxide, Methylchloroisathiazolinone, Methylisothiazolinone.\n\nHow to use :\n    Apply on wet hair and gently massage in circle motion and rinse thoroughly.\n\nBenefits :\n • Eemos hair strengthening shampoo has mild cleansing effect and avoilds oily scalp.\n • It also nourishes and provide s strengthening  to hair.\n • It controls dry & frizziness.\n • It also helps in spilt correction\n • It is paraben free shampoo.\n • It is suitable for all hair types.\n • Target audience  men & women."))

            // draw the result in a label
//            Label.attributedText = fullString
            
           
            
            
            collectionview.dataSource = self // Add this
            collectionview.delegate = self // Add this
            Setcorners()
            pageViewController.numberOfPages = imgArr.count
            pageViewController.currentPage = 0
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            }
        }

    
       @objc func changeImage() {
        
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageViewController.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageViewController.currentPage = counter
            counter = 1
        }
            
        }

    func Setcorners(){
    
          collectionview.layer.cornerRadius = 8.0
          collectionview.layer.shadowColor = UIColor.gray.cgColor
          collectionview.layer.shadowOffset = CGSize(width: 0, height: 2)
          collectionview.layer.shadowOpacity = 1
          collectionview.layer.shadowRadius = 1.0
          collectionview.layer.masksToBounds = false
        
    }
    
    @IBAction func callPressed(_ sender: UIButton) {
          UIApplication.shared.open(URL(string: c.telURL)!, options: [:], completionHandler: nil)
    }
    @IBAction func whasappPressed(_ sender: UIButton) {
        UIApplication.shared.open((URL(string:c.whatsappURL)!), options: [:], completionHandler: nil)
    }
}

    extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imgArr.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.setWidth(width: collectionView.frame.width)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgArr[indexPath.row]
                vc.layer.cornerRadius = 8
                
            }
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.row)
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
            let pageWidth = scrollView.frame.size.width
                 let  currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
                   pageViewController.currentPage = currentPage
        }

        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                self.collectionView.scrollToNearestVisibleCollectionViewCell()
            }
        }
    }
extension UICollectionView {
    func scrollToNearestVisibleCollectionViewCell() {
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<self.visibleCells.count {
            let cell = self.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)

            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = self.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}
   




//
//  HomeController.swift
//  Eemos
//
//  Created by User on 20/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import FirebaseFirestore

class HomeController : UIViewController{
    var db : Firestore!
   

    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pageViewController: UIPageControl!
  
    @IBOutlet weak var collectionView: UICollectionView!
    let c = AboutUsConstants.self
    var imgArr = Home.imgArr
        
        var timer = Timer()
        var counter = 0
       
        override func viewDidLoad() {
            super.viewDidLoad()
            // Firebase settings
                    let settings = FirestoreSettings()
                        Firestore.firestore().settings = settings
                        db = Firestore.firestore()
            
            collectionview.dataSource = self
            collectionview.delegate = self
            
            //set corners of collectionView
            Setcorners()
            
            // pageViewController config
            pageViewController.numberOfPages = imgArr.count
            pageViewController.currentPage = 0
            
            // change banner images
            DispatchQueue.main.async {
                
                self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            }
            
            //Modify Banner Images
            if (UserDefaults.standard.object(forKey: "imagesArrayDownload") as? String) != nil{
                 setOfferImages()
            }else{
               UpdateImages()
            }
            
        }
  
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          self.navigationController?.navigationBar.isHidden = false
      }
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationController?.navigationBar.isHidden = true
          
      }
    
    // to change banner images for time interval
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

    // Sets corners for collectionView
    func Setcorners(){
    
        collectionview.layer.cornerRadius = 8.0
        collectionview.layer.shadowColor = UIColor.gray.cgColor
        collectionview.layer.shadowOffset = CGSize(width: 0, height: 2)
        collectionview.layer.shadowOpacity = 1
        collectionview.layer.shadowRadius = 1.0
        collectionview.layer.masksToBounds = false
        
    }
    
    // To call the eemos
    @IBAction func callPressed(_ sender: UIButton) {
          UIApplication.shared.open(URL(string: c.telURL)!, options: [:], completionHandler: nil)
    }
    
    // to open eemos whatsapp chat
    @IBAction func whasappPressed(_ sender: UIButton) {
        UIApplication.shared.open((URL(string:c.whatsappURL)!), options: [:], completionHandler: nil)
    }

    @IBAction func OffersPressd(_ sender: UIButton) {

    }
    
    // Set offer images retrived from userDefaults
    func setOfferImages(){
        
        //checks any changes in DB
        checkDBforChanges(){ (name) -> () in
                       
                       if name {
                           if let array = UserDefaults.standard.object(forKey: "imagesArray") as? [String]{
                               self.removeImageLocalPath(localPathName: array)
                               UserDefaults.standard.removeObject(forKey: "imagesArray")
                               UserDefaults.standard.synchronize()
                               self.UpdateImages()
                           }
                       }else{
                           if let retreivedImgArray = UserDefaults.standard.object(forKey: "imagesArray") {
                               for path in retreivedImgArray as! [String]{
                                   if let image = self.getSavedImage(named:  path) {
                                       self.imgArr.append(image)
                                      
                                   }
                                   self.collectionView.reloadData()
                                   self.pageViewController.numberOfPages = self.imgArr.count
                               }
                               
                           }else {
                               self.UpdateImages()
                           }

                       }
                       
                   }
                  
    }
    
    // download the banner images from DB and strores it into userdefualts
    func UpdateImages(){
        let docRef = self.db.collection("BannerImages").document("images")
        
        docRef.getDocument { (document, error) in
            
            if let document = document, document.exists {
                
                let array = document.get("urls") as? [String] ?? [""]
                var filename = 0
                var userDefualt = [""]
                
                for arrayURL in array{
                    filename += 1
                    let url = URL(string: arrayURL)
                    if  let data = try? Data(contentsOf: url!){
                        if  self.saveImage(image: UIImage(data: data)!, fileName: "img\(filename)"){
                            
                            userDefualt.append("img\(filename)")
                            if let image = self.getSavedImage(named:  "img\(filename)") {
                                self.imgArr.append(image)
                            
                            }
                            
                        }
                    }
                    
                }
                self.collectionView.reloadData()
                self.pageViewController.numberOfPages = self.imgArr.count
                UserDefaults.standard.set(userDefualt, forKey: "imagesArray")
                UserDefaults.standard.set("userDefualt", forKey: "imagesArrayDownload")
                UserDefaults.standard.synchronize()
                
            } else {
                
                print("Document does not exist")
            }
            
        }
    }
    
    //Checks database for any changes . change the update key to true in DB to get update
    func checkDBforChanges( completion:@escaping (Bool) -> ()){
        
        let docRef = self.db.collection("BannerImages").document("update")
             var currentupdate = ""
              var update = false
              docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    currentupdate = (document.get("update") as? String)!
                    if let currentUpadte =   UserDefaults.standard.object(forKey: "CurrentUpdate") as? String{
                        if currentupdate == currentUpadte{
                            update = false
                        }else {
                            update = true
                        }
                    }
                  completion( update)
                }
              
        }
     
    }
    
    // save images to local storage (sandbox)
    func saveImage(image: UIImage,fileName:String) -> Bool {
        
       
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(fileName).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // To get saved images from sandbox
    func getSavedImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    // Remove the images from sandbox
    func removeImageLocalPath(localPathName:[String]) {
        let fileMgr = FileManager()
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        if let directoryContents = try? fileMgr.contentsOfDirectory(atPath: dirPath)
        {
            print("local--- \(localPathName)")
            for path in directoryContents
            {
                print("paths-----\(path)")
                let fullPath = (dirPath as NSString).appendingPathComponent(path)
                do
                {
                    for local in localPathName{
                        if path == local{
                            try fileMgr.removeItem(atPath: fullPath)
                            print("Files deleted")
                        }else{
                            print("no match")
                        }
                    }
                    
                    
                }
                catch let error as NSError
                {
                    print("Error deleting: \(error.localizedDescription)")
                }
            }
        }
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
   




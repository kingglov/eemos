//
//  Services Controller.swift
//  Eemos
//
//  Created by User on 23/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class ServicesViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    let imageArray = Services.imageArray
    let servicesLable = Services.servicesLable
    
    override func viewDidLoad() {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCell", for: indexPath) as! ServicesTableViewCell
        
        cell.serviceimage.image = UIImage(named: imageArray[indexPath.row])
        cell.label.text = servicesLable[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "servicesInfoVC") as! ServicesInfoController
        destinationVC.mainindexPath  = indexPath
           self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
    
}

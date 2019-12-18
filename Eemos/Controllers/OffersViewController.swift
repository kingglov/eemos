//
//  OffersViewController.swift
//  Eemos
//
//  Created by sailaja on 16/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    let images = ["flat20","of-1","of-2","of-3","of-4"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! offersTableViewCell
        cell.imageview.image = UIImage(named: images[indexPath.row]) 
        return cell
    }

}

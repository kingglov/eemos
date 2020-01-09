//
//  AboutUS.swift
//  Eemos
//
//  Created by User on 19/09/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class AboutUs : UIViewController {
    @IBOutlet weak var trxtViewHight: NSLayoutConstraint!
    
    @IBOutlet weak var circleCardwidth: NSLayoutConstraint!
    @IBOutlet weak var circleCardHight: NSLayoutConstraint!
    @IBOutlet weak var aboutusHeader: AboutUsHeader!
    let c = AboutUsConstants.self
    override func viewDidLoad() {
        let hight = self.view.frame.height - trxtViewHight.constant
        if hight > 600 {
            circleCardHight.constant = 300
            circleCardwidth.constant = 300
        }else if hight > 400{
            circleCardHight.constant = 180
            circleCardwidth.constant = 180
            
        }else if hight > 250{
            circleCardHight.constant = 150
            circleCardwidth.constant = 150
        }
        
    }
    
    @IBAction func locate(_ sender: Any) {
        UIApplication.shared.open(URL(string:c.mapsURL)!, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func facebook(_ sender: Any) {
        let facebookURL = URL(string: c.fbAppURL)!
        
        if UIApplication.shared.canOpenURL(facebookURL) {
        UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
        }else{
            let facebookURL1 = URL(string: c.fbURL)!
        UIApplication.shared.open(facebookURL1)
    }
    }
    @IBAction func insta(_ sender: Any) {
        let instagramUrl = URL(string:c.instaAppURL )!
        if UIApplication.shared.canOpenURL(instagramUrl) {
        UIApplication.shared.open(instagramUrl, options: [:], completionHandler: nil)
        }else{
            let instagramUrl = URL(string:c.instaURL )!
            UIApplication.shared.open(instagramUrl, options: [:], completionHandler: nil)
        }
    }
    @IBAction func whatsapp(_ sender: Any) { UIApplication.shared.open((URL(string:c.whatsappURL)!), options: [:], completionHandler: nil)
    }
    
    @IBAction func profilePressed(_ sender: UIButton) {
        
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "profile")
        as! ProfileViewController
        present(destinationVC, animated: true, completion: nil)
    }
    
}


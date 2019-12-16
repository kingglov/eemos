//
//  BookUSViewController.swift
//  Eemos
//
//  Created by sailaja on 20/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import WebKit
import NVActivityIndicatorView
class BookUSViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var activityView: NVActivityIndicatorView!
   
   var firstname = ""
   var lastname = ""
   var email = ""
   var mobile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLables()
        let urlString = "https://www.waffor.com/booking/WFRCHN000001801/Eemos-salon-spa"
        let request = URLRequest(url: URL(string: urlString)!)
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        self.webView.load(request)
        
        
    }
    func updateLables(){
               firstname = UserDefaults.standard.object(forKey: "fname") as? String ?? ""
               lastname  = UserDefaults.standard.object(forKey: "lname") as? String ?? ""
               email     = UserDefaults.standard.object(forKey: "email") as? String ?? ""
               mobile    = UserDefaults.standard.object(forKey: "mobile") as? String ?? ""
          
    }
    override func viewWillDisappear(_ animated: Bool) {
          activityView.stopAnimating()
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            
            if webView.isLoading {
               activityView.startAnimating()
                activityView.isHidden = false
            } else {
               
               activityView.stopAnimating()
                webView.evaluateJavaScript("document.getElementById('first_name').value = '\(firstname)';", completionHandler: { (res, error) -> Void in
                                      //Here you can check for results if needed (res) or whether the execution was successful (error)
                                  })
                webView.evaluateJavaScript("document.getElementById('last_name').value = '\(lastname)';", completionHandler: { (res, error) -> Void in
                                      //Here you can check for results if needed (res) or whether the execution was successful (error)
                                  })
                webView.evaluateJavaScript("document.getElementById('Email').value = '\(email)';", completionHandler: { (res, error) -> Void in
                                                  //Here you can check for results if needed (res) or whether the execution was successful (error)
                                              })
                webView.evaluateJavaScript("document.getElementById('mobile_number').value = '\(mobile)';", completionHandler: { (res, error) -> Void in
                                                  //Here you can check for results if needed (res) or whether the execution was successful (error)
                                              })
                
            }
        }
    }
    

}

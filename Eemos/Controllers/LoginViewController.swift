//
//  LoginViewController.swift
//  Eemos
//
//  Created by sailaja on 26/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase
import GoogleSignIn
import FirebaseFirestore
class LoginViewController: UIViewController {
      var window: UIWindow?
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var trailing: NSLayoutConstraint!
 
    var db : Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
            let settings = FirestoreSettings()

            Firestore.firestore().settings = settings
            // [END setup]
            db = Firestore.firestore()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        statusLable.text = ""
        
        if UserDefaults.standard.object(forKey: "user_uid_key") != nil {
            performSegue(withIdentifier: "idd", sender: nil)
        }
           UIView.animate(withDuration: 1) {
               self.trailing.constant = 80
               self.view.layoutIfNeeded()
          
           }
        
        
       }
    
    @IBAction func skipPressed(_ sender: UIButton) {
            
          UserDefaults.standard.set("SkipPressed", forKey: "Skip")
        UserDefaults.standard.synchronize()
        self.window = UIWindow(frame: UIScreen.main.bounds)
              let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
              let viewController = storyboard.instantiateViewController(withIdentifier: "tabbar") as! ViewController
              
              self.window?.rootViewController = viewController
              self.window?.makeKeyAndVisible()
        self.performSegue(withIdentifier: "idd", sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if checkLabels(){
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (result, error) in
                if error == nil {
                    let docRef = self.db.collection("UsersAdditionalInfo").document(self.email.text!)
                    
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            
                            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                            print(dataDescription)
                            UserDefaults.standard.set(Auth.auth().currentUser!.uid, forKey: "user_uid_key")
                            UserDefaults.standard.set(document.get("fname") as? String ?? "", forKey: "fname")
                            UserDefaults.standard.set(document.get("email") as? String ?? "", forKey: "email")
                            UserDefaults.standard.set(document.get("mobile") as? String ?? "", forKey: "mobile")
                            UserDefaults.standard.set(document.get("lname") as? String ?? "", forKey: "lname")
                            UserDefaults.standard.synchronize()
                            self.window = UIWindow(frame: UIScreen.main.bounds)
                            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                            let viewController = storyboard.instantiateViewController(withIdentifier: "tabbar") as! ViewController
                            
                            self.window?.rootViewController = viewController
                            self.window?.makeKeyAndVisible()
                        } else {
                            
                            print("Document does not exist")
                        }
                    }
                    
                    self.performSegue(withIdentifier: "idd", sender: nil)
                }else{
                    if error?.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted."{
                        self.statusLable.text = "Invalid email address"
                    }else if error?.localizedDescription == "The password is invalid or the user does not have a password."{
                        self.statusLable.text = "Password was incorrect"
                    }
                    print(error?.localizedDescription as Any)
                }
            }
        }
        
    }
    
    @IBAction func signinGoogle(_ sender: UIButton) {
         GIDSignIn.sharedInstance()?.presentingViewController = self
         GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func signinwtFB(_ sender: UIButton) {
    }
    @IBAction func signUPPressed(_ sender: UIButton) {
        
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: "signup") as! SignupViewController
        present(destinationVc, animated: true, completion: nil)
    }
    
    func checkLabels()->Bool{
       
            if email.text == "" || !email.text!.contains("@") {
                email.shake(horizantaly: 3)
                 statusLable.text = "Please enter email id"
            }else if password.text == ""  {
                    password.shake(horizantaly: 3)
                 statusLable.text = "Please enter Password"
            } else{
                  return true
            }
              return false
        
    }
}

//
//  SignupViewController.swift
//  Eemos
//
//  Created by sailaja on 26/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
class SignupViewController: UIViewController {

    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
     var db : Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if checkLabels(){
            Auth.auth().createUser(withEmail: (email.text ?? ""), password: (password.text ?? "")) { (result, error) in
                if let _eror = error {
                    //something bad happning
                    print(_eror.localizedDescription )
                }else{
                    //user registered successfully
                    print(result!)
                    
                    self.db.collection("UsersAdditionalInfo").document(self.email.text!).setData( [
                        "fname":self.firstname.text!,
                        "email":self.email.text!,
                        "mobile":self.mobile.text!,
                        "lname":self.lastName.text!
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID:")
                        }
                    }
                }
            }
            UserDefaults.standard.set(Auth.auth().currentUser!.uid, forKey: "user_uid_key")
            UserDefaults.standard.set(self.firstname.text!, forKey: "fname")
            UserDefaults.standard.set(self.email.text!, forKey: "email")
            UserDefaults.standard.set(self.mobile.text!, forKey: "mobile")
            UserDefaults.standard.set(self.lastName.text!, forKey: "lname")
            
            UserDefaults.standard.synchronize()
            self.performSegue(withIdentifier: "idd", sender: nil)
        }
       
    }
    
    func checkLabels()->Bool{
        
        
           if firstname.text == ""{
                     firstname.shake(horizantaly: 3)
                 } else if lastName.text == ""{
                     lastName.shake(horizantaly: 3)
                 }else if mobile.text == "" || mobile.text?.count != 10 {
                          mobile.shake(horizantaly: 3)
           }else if password.text == "" || password.text?.count ?? 0 <= 6{
                          password.shake(horizantaly: 3)
                 }else if email.text == "" || !email.text!.contains("@") {
                     email.shake(horizantaly: 3)
                 }else{
                     return true
                 }
                 return false
           
       }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

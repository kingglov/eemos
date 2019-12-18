//
//  ProfileViewController.swift
//  Eemos
//
//  Created by sailaja on 28/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class ProfileViewController: UIViewController {

    @IBOutlet weak var logButton: ButtonRound!
    @IBOutlet weak var lastname     : UITextField!
    @IBOutlet weak var mobile       : UITextField!
    @IBOutlet weak var firstname    : UITextField!
    @IBOutlet weak var email        : UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameLetterLable: UILabel!
    var edit = false
     var db : Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()

               Firestore.firestore().settings = settings
               // [END setup]
               db = Firestore.firestore()
        textFieldDeactive()
        updateLables()
    }
    override func viewWillAppear(_ animated: Bool) {
        LogButton()
        if firstname.text != ""{
            let string = firstname.text!
            
            nameLetterLable.text = String(string.first!).uppercased()
        }else {
            nameLetterLable.text = "AA"
        }
    }
    

    @IBAction func editBtnPreessed(_ sender: UIButton) {
        edit = !edit
        
        if edit{
            
            textFieldActive()
            editButton.setTitle("save", for: .normal)
            
        } else{
            
            if checkLabels(){
                
                if let _ = UserDefaults.standard.object(forKey: "user_uid_key"){
                    let washingtonRef = db.collection("UsersAdditionalInfo").document(email.text!)
                    
                    // Set the "capital" field of the city 'DC'
                    washingtonRef.updateData([
                        "fname":self.firstname.text!,
                        "email":self.email.text!,
                        "mobile":self.mobile.text!,
                        "lname":self.lastname.text!
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            self.SaveToUserDefaults()
                            print("Document successfully updated")

                            self.editButton.setTitle("Edit", for: .normal)
                            self.updateLables()
                            self.textFieldDeactive()
                            
                        }
                    }
                }else{
                   SaveToUserDefaults()
                   self.editButton.setTitle("Edit", for: .normal)
                   self.updateLables()
                   self.textFieldDeactive()
                }
               
            }
            
        }
    }
    
    func SaveToUserDefaults()  {
        
        UserDefaults.standard.set(self.firstname.text!, forKey: "fname")
        UserDefaults.standard.set(self.email.text!, forKey: "email")
        UserDefaults.standard.set(self.mobile.text!, forKey: "mobile")
        UserDefaults.standard.set(self.lastname.text!, forKey: "lname")
        UserDefaults.standard.synchronize()
    }

    @IBAction func calcelbtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    func textFieldActive(){
        lastname.isEnabled = true
        mobile.isEnabled = true
        firstname.isEnabled = true
        email.isEnabled = true
    }

    func textFieldDeactive(){ //Add anything else
        //Turn things OFF
       lastname.isEnabled = false
        mobile.isEnabled = false
        firstname.isEnabled = false
        email.isEnabled = false
    }
    
    func checkLabels()->Bool{
        if firstname.text == ""{
                  firstname.shake(horizantaly: 3)
              } else if lastname.text == ""{
                  lastname.shake(horizantaly: 3)
              }else if mobile.text == "" || mobile.text?.count != 10 {
                       mobile.shake(horizantaly: 3)
              }else if email.text == "" || !email.text!.contains("@") {
                  email.shake(horizantaly: 3)
              }else{
                  return true
              }
              return false
        
    }
    func removeUserdefaluts(){
        UserDefaults.standard.removeObject(forKey: "user_uid_key")
        UserDefaults.standard.removeObject(forKey: "fname")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "mobile")
        UserDefaults.standard.removeObject(forKey: "lname")
        UserDefaults.standard.synchronize()
    }
    func updateLables(){
               firstname.text = UserDefaults.standard.object(forKey: "fname") as? String
               lastname.text  = UserDefaults.standard.object(forKey: "lname") as? String
               email.text     = UserDefaults.standard.object(forKey: "email") as? String
               mobile.text    = UserDefaults.standard.object(forKey: "mobile") as? String
            LogButton()
    }
    func LogButton(){
        
        if let _ = UserDefaults.standard.object(forKey: "user_uid_key") {
            logButton.setTitle("LogOut", for: .normal)
        }else{
            logButton.setTitle("Login", for: .normal)
        }
        
    }
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        if sender.title(for: .normal) == "Login"{
            performSegue(withIdentifier: "login", sender: self)
        }else{
        
        let alert = UIAlertController(title: "Log Out", message: "Are you sure want to logout", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default, handler: OnCinfirmClicked)
        let actionNo = UIAlertAction(title: "No", style: .cancel, handler: .none)
        
        alert.addAction(action)
        alert.addAction(actionNo)
        present(alert, animated: true, completion: nil)
        
        }
    }
    func OnCinfirmClicked(action: UIAlertAction){
        do {
              try Auth.auth().signOut()
            removeUserdefaluts()
            LogButton()
            updateLables()
            
        }catch{
            print(error.localizedDescription)
        }
    }
        
}

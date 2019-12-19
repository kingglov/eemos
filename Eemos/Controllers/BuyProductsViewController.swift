//
//  BuyProductsViewController.swift
//  Eemos
//
//  Created by sailaja on 22/11/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import Razorpay
class BuyProductsViewController: UIViewController , UITextViewDelegate,RazorpayPaymentCompletionProtocol,UITextFieldDelegate{
  
    var item = ""
    var price = ""
    var db : Firestore!
    var paymentType = ""
    private var razorpay : Razorpay?
    
    @IBOutlet weak var validationText: UILabel!
    @IBOutlet weak var paynoeLabel  : LabelButton!
    @IBOutlet weak var codLable     : LabelButton!
    @IBOutlet weak var nameLable    : UITextField!
    @IBOutlet weak var addressText  : UITextView!
    @IBOutlet weak var city         : UITextField!
    @IBOutlet weak var mobile       : UITextField!
    @IBOutlet weak var email        : UITextField!
    @IBOutlet weak var picode       : UITextField!
    
    @IBOutlet weak var paynowBtn: RadioButton!
    @IBOutlet weak var codBtn: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.delegate = self
        addressText.delegate = self
        city.delegate = self
        mobile.delegate = self
        email.delegate = self
        picode.delegate = self
        
        validationText.text = ""
        razorpay = Razorpay.initWithKey("rzp_test_OGZL7JdBa3Ruvf", andDelegate: self)
        // [START setup]
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        addressText.delegate = self
        paynowBtn.alternateButton = [codBtn!]
        codBtn.alternateButton = [paynowBtn!]
        
        addressText.text = "Address"
        addressText.textColor = UIColor.lightGray
        self.paynoeLabel.onClick = {
            self.codBtn.isSelected = false
            self.paynowBtn.isSelected = true
           }
        self.codLable.onClick = {
            self.codBtn.isSelected = true
            self.paynowBtn.isSelected = false
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        codBtn.isSelected = false
        paynowBtn.isSelected = true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if addressText.textColor == UIColor.lightGray {
            addressText.text = nil
            addressText.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if addressText.text.isEmpty {
            addressText.text = "Address"
            addressText.textColor = UIColor.lightGray
        }
    }
    @IBAction func orderBtnPressed(_ sender: UIButton) {
    
        if  ValidateInputs(){
            validationText.text = ""
            if paynowBtn.isSelected{
                payWithRazorPay()
            }else{
                paymentType = "cod"
                let alert = UIAlertController(title: "Confirmation", message: "Press cofirm to proceed Order", preferredStyle: .alert)
                let action = UIAlertAction(title: "Confirm", style: .default, handler: OnConfirmClicked)
                let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(action)
                alert.addAction(action2)
                present(alert, animated: true, completion: nil)
            }
        }else{
            validationText.text = "Please fill all fields"
        }
       
    }
    
    func ValidateInputs()-> Bool{
        if nameLable.text == ""{
            nameLable.shake(horizantaly: 3)
        } else if addressText.text == ""{
            addressText.shake(horizantaly: 3)
        } else if city.text == ""{
            city.shake(horizantaly: 3)
        }else if mobile.text == "" || mobile.text?.count != 10 {
                 mobile.shake(horizantaly: 3)
        }else if email.text == "" || !email.text!.contains("@") {
            email.shake(horizantaly: 3)
        }else if picode.text == ""{
            picode.shake(horizantaly: 3)
        }else{
            return true
        }
        return false
    }
    
    func OnOkButtonClicked(action: UIAlertAction) {
     self.dismiss(animated: true, completion: nil)
    }
    func OnConfirmClicked(action: UIAlertAction) {
         writeToFirestore()
       }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    
    func writeToFirestore(){
        
        var ref: DocumentReference? = nil
               ref = db.collection("ProductOrderAddresses").addDocument(data: [
                   "address": addressText.text!,
                   "city": city.text!,
                   "dateOfOrder": Date(),
                   "email":email.text!,
                   "item":item,
                   "mobile":mobile.text!,
                   "name":nameLable.text!,
                   "paymentType":paymentType,
                   "pincode": picode.text!,
                   "quantity":"1",
                   "amount" : price
               ]) { err in
                   if let err = err {
                       print("Error adding document: \(err)")
                   } else {
                        let alert = UIAlertController(title: "Done", message: "Your Order has been placed succesfully", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: self.OnOkButtonClicked)
                    
                        alert.addAction(action)
                        
                    self.present(alert, animated: true, completion: nil)
                        
                    
                       print("Document added with ID: \(ref!.documentID)")
                   }
               }
    }
    
    func payWithRazorPay(){
       
         let options: [String:Any] = [
            "amount" : "\(Int(price)! * 100)", //mandatory in paise like:- 1000 paise ==  10 rs
                         "description": "purchase description",
                         "image": "1",
                         "name": "Eemos Beauty Parlor & Acadamy",
                         "prefill": [
                            "contact": "\(mobile.text!)",
                            "email": "\(email.text!)"
                         ],
                         "theme": [
                             "color": "#FF72FF"
                         ]
                     ]
                    razorpay?.open(options)
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
     let alert = UIAlertController(title: "Failed", message: "Payment failed", preferredStyle: .alert)
     let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
     alert.addAction(action)
     present(alert, animated: true, completion: nil)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        paymentType = "onlinePayment"
        writeToFirestore()

    }
     
}

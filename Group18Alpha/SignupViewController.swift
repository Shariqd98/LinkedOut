//
//  SignupViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 3/28/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var dateOfBirth: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var zipCode: UITextField!
    @IBOutlet var phoneNum: UITextField!
    @IBOutlet var emailAdd: UITextField!
    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    //userdata
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.dateOfBirth.delegate = self
        self.city.delegate = self
        self.state.delegate = self
        self.zipCode.delegate = self
        self.phoneNum.delegate = self
        self.emailAdd.delegate = self
        self.userName.delegate = self
        self.passWord.delegate = self
        self.confirmPassword.delegate = self
    }

    @IBAction func doneBtn(_ sender: UIButton) {
        defaults.set(firstName.text!, forKey: "firstname")
        defaults.set(lastName.text!, forKey: "lastname")
        defaults.set(dateOfBirth.text!, forKey: "dob")
        defaults.set(city.text!, forKey: "city")
        defaults.set(state.text!, forKey: "state")
        defaults.set(zipCode.text!, forKey: "zip")
        defaults.set(phoneNum.text!, forKey: "phonenum")
        defaults.set(emailAdd.text!, forKey: "email")
        defaults.set(userName.text!, forKey: "username")
        defaults.set(passWord.text!, forKey: "password")
        defaults.synchronize()
    }
    
    //keyboard dismissal on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //makes sure all text fields are filled out and that you confimred password correctly
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "signupSegue" {
            //confirms passwords match
            if (confirmPassword.text! != passWord.text!) {
                let alertView = UIAlertController(title: "Passwords Do Not Match", message: "Please match the passwords.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
                //here, down, confirms that all text fields are filled out
            }else if ((firstName.text!.isEmpty) || (lastName.text!.isEmpty)) {
                let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
            }else if ((dateOfBirth.text!.isEmpty) || (city.text!.isEmpty)) {
                let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
            }else if ((state.text!.isEmpty) || (zipCode.text!.isEmpty)) {
                let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
            }else if ((phoneNum.text!.isEmpty) || (emailAdd.text!.isEmpty)) {
                let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
            }else if ((userName.text!.isEmpty) || (passWord.text!.isEmpty)) {
                let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    print("Ok Button")
                })
                alertView.addAction(ok)
                present(alertView, animated: true, completion: nil)
                
                return false
            }else {
                return true
            }
        }
        // by default, transition
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

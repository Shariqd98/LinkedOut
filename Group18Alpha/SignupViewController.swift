//
//  SignupViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 3/28/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //keyboard dismissal on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        signupDone()
        handleSignUp()
    }
    
    func handleSignUp() {
        let username = userName.text!
        let email = emailAdd.text!
        let pass = passWord.text!
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User Created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                    }
                }
                self.performSegue(withIdentifier: "signupSegue", sender: Any?.self)
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    
    //makes sure all text fields are filled out and that you confimred password correctly
    func signupDone() {
        //confirms passwords match
        if (confirmPassword.text! != passWord.text!) {
            let alertView = UIAlertController(title: "Passwords Do Not Match", message: "Please match the passwords.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
            //here, down, confirms that all text fields are filled out
        }else if ((firstName.text!.isEmpty) || (lastName.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
        }else if ((dateOfBirth.text!.isEmpty) || (city.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
        }else if ((state.text!.isEmpty) || (zipCode.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
        }else if ((phoneNum.text!.isEmpty) || (emailAdd.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
        }else if ((userName.text!.isEmpty) || (passWord.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
        }
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

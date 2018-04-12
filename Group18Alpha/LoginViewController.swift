//
//  LoginViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 3/28/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet var userName: UITextField! //is actually e-mail
    @IBOutlet var passWord: UITextField!
    //used for forgot pass alert
    var emailTextFld: UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func forgotPassBtn(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Forgot Password", message: "Enter your E-mail to change your password.", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            Auth.auth().sendPasswordReset(withEmail: (self.emailTextFld?.text)!) {error in
                if error == nil {
                    print("Password reset email sent!")
                }else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
            print("Cancel Button")
        }
        
        alertView.addAction(ok)
        alertView.addAction(cancel)
        
        alertView.addTextField { (textField) -> Void in
            // Enter the textfield customization code here.
            self.emailTextFld = textField
            self.emailTextFld?.placeholder = "Enter your E-mail here!"
        }
        
        present(alertView, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let email = userName.text!
        let pass = passWord.text!
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("Logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
            }else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //Facebook login
    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }else {
                    print("Logged in!")
                    self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
                }
                
            })
            
        }
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        if let user = Auth.auth().currentUser {
//            self.performSegue(withIdentifier: "loginSegue", sender: self)
//        }
//    }
    
    //keyboard dismissal on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //alert pop if missing login information
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == "loginSegue" {
//            if (userName.text!.isEmpty) || (passWord.text!.isEmpty) {
//                let alertView = UIAlertController(title: "Missing Login Info", message: "Please enter a Email or Password.", preferredStyle: UIAlertControllerStyle.alert)
//                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
//                    print("Ok Button")
//                })
//                alertView.addAction(ok)
//                present(alertView, animated: true, completion: nil)
//
//                return false
//            }else {
//                return true
//            }
//        }
//        // by default, transition
//        return true
//    }
    
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

extension UIViewController {
    //keyboard dismissal when screen is tapped
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//
//  LoginViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 3/28/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    //used for forgot pass alert
    var emailTextFld: UITextField? = nil
    //userDefaults 
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.userName.delegate = self
        self.passWord.delegate = self
    }

    @IBAction func forgotPassBtn(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Forgot Password", message: "Enter your E-mail to change your password.", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            print("Ok Button")
            print("You entered \(self.emailTextFld!.text!)")
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
            defaults.set(userName.text!, forKey: "username")
            defaults.set(passWord.text!, forKey: "password")
            defaults.synchronize()
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    //keyboard dismissal on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //alert pop if missing login information
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            if (userName.text!.isEmpty) || (passWord.text!.isEmpty) {
                let alertView = UIAlertController(title: "Missing Login Info", message: "Please enter a Username or Password.", preferredStyle: UIAlertControllerStyle.alert)
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

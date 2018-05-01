//
//  SignupViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 3/28/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage
import FirebaseDatabase

class SignupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var age: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var emailAdd: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var tapToChangeProfileBtn: UIButton!
    
    var imagePicker:UIImagePickerController!
    
    let states = [ "AK",
                   "AL",
                   "AR",
                   "AS",
                   "AZ",
                   "CA",
                   "CO",
                   "CT",
                   "DC",
                   "DE",
                   "FL",
                   "GA",
                   "GU",
                   "HI",
                   "IA",
                   "ID",
                   "IL",
                   "IN",
                   "KS",
                   "KY",
                   "LA",
                   "MA",
                   "MD",
                   "ME",
                   "MI",
                   "MN",
                   "MO",
                   "MS",
                   "MT",
                   "NC",
                   "ND",
                   "NE",
                   "NH",
                   "NJ",
                   "NM",
                   "NV",
                   "NY",
                   "OH",
                   "OK",
                   "OR",
                   "PA",
                   "PR",
                   "RI",
                   "SC",
                   "SD",
                   "TN",
                   "TX",
                   "UT",
                   "VA",
                   "VI",
                   "VT",
                   "WA",
                   "WI",
                   "WV",
                   "WY"]
    
    var statePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.city.delegate = self
        self.age.delegate = self
        self.emailAdd.delegate = self
        self.passWord.delegate = self
        self.confirmPassword.delegate = self
        statePicker.delegate = self
        statePicker.dataSource = self
        state.inputView = statePicker
        
        //image picker settings
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(imageTap)
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        profileImage.clipsToBounds = true
        tapToChangeProfileBtn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    //keyboard dismissal on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //allows profile image to be picked opens Image Picker
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //FOR STATE PICKER
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        state.text = states[row]
    }
    //DONE WITH STATE PICKER
    
    @IBAction func doneBtn(_ sender: Any) {
        signupDone()
        handleSignUp()
    }
    
    func handleSignUp() {
        let email = emailAdd.text!
        let pass = passWord.text!
        let fullName = "\(firstName.text!)" + " " + "\(lastName.text!)"
        let cityData = city.text!
        let stateData = state.text!
        let ageData = age.text!
        guard let image = profileImage.image else {return}
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User Created!")
                
                //upload image and save data to database and storage
                
                self.uploadProfileImage(image) {url in
                    if url != nil {
                        //change request allows for DATABASE WRITE
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = fullName
                        changeRequest?.photoURL = url
                        
                        changeRequest?.commitChanges {error in
                            if error == nil {
                                print("Saved changes to Firebase")
                                self.saveProfile(fullName: fullName, profileImageURL: url!, cityData: cityData, stateData: stateData, ageData:ageData) {success in
                                    if success {
                                        self.performSegue(withIdentifier: "signupSegue", sender: Any?.self)
                                    }
                                }
                            } else {
                                print("Error: \(error!.localizedDescription)")
                            }
                        }
                    }else {
                        //Error, cant upload profile image
                    }
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    
    //uploads image to firebase storage
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?) -> ())) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else {return}
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) {metaData, error in
            if error == nil, metaData != nil {
                //it worked
                if let url = metaData?.downloadURL() {
                    completion(url)
                }else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    //uploads data to Firebase database
    func saveProfile(fullName:String ,profileImageURL:URL, cityData:String, stateData:String, ageData:String, completion: @escaping ((_ success:Bool) -> ())) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let searchPrivate = "False"
        let skillsAndInt = ["Press + to add" ,"Swipe Left on Me to Edit"]
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        let userObject = [
            "fullName": fullName,
            "age": ageData,
            "city": cityData,
            "state": stateData,
            "searchIsPrivate": searchPrivate,
            "skillsAndInt": skillsAndInt,
            "photoURL": profileImageURL.absoluteString
        ] as [String:Any]
        
        databaseRef.setValue(userObject) {error, ref in
            completion(error == nil)
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
            
        }else if ((state.text!.isEmpty) || (city.text!.isEmpty)) {
            let alertView = UIAlertController(title: "Missing Info", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                print("Ok Button")
            })
            alertView.addAction(ok)
            present(alertView, animated: true, completion: nil)
            
        }else if ((emailAdd.text!.isEmpty) || (passWord.text!.isEmpty)) {
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

extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedimage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImage.image = pickedimage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

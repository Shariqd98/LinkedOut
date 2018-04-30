//
//  ProfileViewController.swift
//  Group18Alpha
//
//  Created by Shariq Dharani on 4/26/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var personalityType: UILabel!
    
    var dataBaseRef: DatabaseReference! {
        return Database.database().reference()
    }
    
    var storageRef: Storage! {
        return Storage.storage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        // Do any additional setup after loading the view.
        
        //profile image setup
        photoView.layer.cornerRadius = photoView.bounds.height / 2
        photoView.clipsToBounds = true
    }
    
    func loadUserInfo() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let userRef = Database.database().reference().child("users/profile/\(uid)")
        userRef.observe(.value, with: { (snapshot) in
            let profileDict = snapshot.value as? [String : AnyObject]
            let name = profileDict!["fullName"] as! String
            let age = profileDict!["age"] as! String
            let city = profileDict!["city"] as! String
            let state = profileDict!["state"] as! String
            let personality = profileDict!["personality"] as! String
            let photoURL = profileDict!["photoURL"] as! String
            self.personalityType.text = "\(personality)"
            self.ageLbl.text = "Age: \(age)"
            self.locationLbl.text = "\(city), \(state)"
            self.nameLbl.text = "\(name)"
            
            ImageService.getImage(withURL: URL(string: photoURL)!) { image in
                self.photoView.image = image
            }
        })
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

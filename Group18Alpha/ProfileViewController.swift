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

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var interestsList = [String]()

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var personalityType: UILabel!
    
    @IBOutlet var interestsTable: UITableView!
    var tableAdd: UITextField? = nil
    var tableUpdate: UITextField? = nil
    
    var dataBaseRef: DatabaseReference! {
        return Database.database().reference()
    }
    
    var storageRef: Storage! {
        return Storage.storage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        loadSkillsAndInt()
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
    
    func loadSkillsAndInt() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let userRef = Database.database().reference().child("users/profile/\(uid)")
        userRef.observe(.value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                for children in dictionary{
                    print(children)
                    if children.key == "skillsAndInt" {
                        var tempArray = [String]()
                        for x in (children.value as? Array<AnyObject>)!{
                            //self.interestsList.append((x as? String)!)
                            tempArray.append((x as? String)!)
                            self.interestsList = tempArray
                        }
                        self.interestsTable.reloadData()
                        print(self.interestsList)
                    }
                }
            }
        })
    }
    
//    func  updateSkillsAndInt() {
//        guard let uid = Auth.auth().currentUser?.uid else {return}
//        let userRef = Database.database().reference().child("users/profile/\(uid)/skillsAndInt").setValue(interestsList)
//    }
    
    //button to add to list
    @IBAction func addListBtn(_ sender: Any) {
        let alertView = UIAlertController(title: "Add", message: "Add your Skills or Interests!", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            if(self.tableAdd?.text != "") {
                //self.interestsList.append((self.tableAdd?.text)!)
                guard let uid = Auth.auth().currentUser?.uid else {return}
                let tableRef = Database.database().reference().child("users/profile/\(uid)/skillsAndInt/\(self.interestsList.count)")
                tableRef.setValue(self.tableAdd?.text)
                self.tableAdd?.text = ""
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
            print("Cancel Button")
            self.interestsTable.reloadData()
        }
        
        alertView.addAction(ok)
        alertView.addAction(cancel)
        
        alertView.addTextField { (textField) -> Void in
            // Enter the textfield customization code here.
            self.tableAdd = textField
            self.tableAdd?.placeholder = "Enter your Skill or Interest here!"
        }
        
        present(alertView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (interestsList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"interestsCell")
        cell.textLabel?.text = interestsList[indexPath.row]
        
        //cell personalization
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = hexStringToUIColor(hex: "16A085")
        
        return(cell)
    }
    
//    //edit
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.insert {
//            //self.interestsList.remove(at: indexPath.row)
//            guard let uid = Auth.auth().currentUser?.uid else {return}
//            let tableRef = Database.database().reference().child("users/profile/\(uid)/skillsAndInt/\(indexPath.row)")
//            tableRef.removeValue()
//            self.loadSkillsAndInt()
//        }
//    }
    
    //edit rows
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "Edit Interest or Skill", message: "Edit item", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                guard let uid = Auth.auth().currentUser?.uid else {return}
                let tableRef = Database.database().reference().child("users/profile/\(uid)/skillsAndInt/\(indexPath.row)")
                tableRef.setValue(self.tableUpdate?.text)
                self.tableUpdate?.text = ""
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addTextField { (textField) -> Void in
                // Enter the textfield customization code here.
                self.tableUpdate = textField
                self.tableUpdate?.placeholder = "Enter your Skill or Interest here!"
            }
            self.present(alert, animated: true, completion: nil)
        })
        return [editAction]
    }

////self.interestsList.append((self.tableAdd?.text)!)
//guard let uid = Auth.auth().currentUser?.uid else {return}
//let tableRef = Database.database().reference().child("users/profile/\(uid)/skillsAndInt/\(indexPath.row)")
//tableRef.setValue(self.tableUpdate?.text)
//self.tableUpdate?.text = ""

    //color custom
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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

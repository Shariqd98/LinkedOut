//
//  SearchTableViewController.swift
//  Group18Alpha
//
//  Created by kvaldez on 4/29/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SearchTableViewController: UITableViewController {

    var ref: DatabaseReference!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.users, "Table Data")
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        //self.users.removeAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sections = self.users.count
        print(sections)
        return sections
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("MAKING CELLS")
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchProfileTableViewCell
        print(indexPath.row)
        let temp = users[indexPath.row]
        //print(temp.fullName!)
        cell.ageLabel?.text = temp.age as? String
        cell.nameLabel?.text = temp.fullName as? String
        cell.personalityLabel?.text = temp.personality as? String
        
        let tempCity = temp.city as? String
        let tempState = temp.state as? String
        let tempLocation = tempCity! + ", " + tempState!
        
        cell.locationLabel?.text = tempLocation
        cell.skillLabel?.text = temp.state as? String
        
        let Url = temp.photoUrl as? String
        setProfileImage(URL: Url!, profileImage: cell.profileImage)
        
        if indexPath.row % 2 == 0{
            cell.contentView.backgroundColor = UIColor.white
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return rowHeight(for: indexPath)
    }
    
    private func rowHeight(for indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func setProfileImage(URL: String, profileImage: UIImageView){
        if let url = NSURL(string: URL){
            if let data = NSData(contentsOf: url as URL){
                profileImage.contentMode = UIViewContentMode.scaleAspectFit
                profileImage.image = UIImage(data: data as Data)
            }
        }
    }
    
    private func fetchUser(){
        print("FETCHING DATA")
        //self.users.removeAll()
        self.ref = Database.database().reference().child("users/profile")
        self.ref.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                let user = User()
                if dictionary["searchIsPrivate"] as? String == "False" {
                    for keys in dictionary{
                        //print(keys)
                        if(keys.key == "fullName"){
                            user.fullName = keys.value
                        }
                        if(keys.key == "age"){
                            user.age = keys.value
                        }
                        if(keys.key == "city"){
                            user.city = keys.value
                        }
                        if(keys.key == "personality"){
                            user.personality = keys.value
                        }
                        if(keys.key == "photoURL"){
                            user.photoUrl = keys.value
                        }
                        if(keys.key == "state"){
                            user.state = keys.value
                        }
                        
                        //user.keys = dictionary[keys]
                    }
                    //user.setValuesForKeys(dictionary)
                    //print(user.fullName, user.age, user.city, user.state, user.personality)
                    self.users.append(user)
                    print("ADDED", user.fullName as? String)
                }
                //print(self.users, "Table Data Fetched")
            }
        })

        print("DATA FETCHED")
        print(self.users)
    }
    
}











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
    
    func fetchUser(){
        ref = Database.database().reference().child("users/profile")
        ref.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject]{
                let user = User()
                for keys in dictionary{
                    print(keys)
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
                print(user.fullName, user.age, user.city, user.state, user.personality)
            }
            
        }, withCancel: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}

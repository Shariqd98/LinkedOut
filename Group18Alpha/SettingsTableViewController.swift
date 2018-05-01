//
//  SettingsTableViewController.swift
//  Group18Alpha
//
//  Created by kvaldez on 4/12/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SettingsTableViewController: UITableViewController {
    private var temp:Int = 0
    
    var ref = Database.database().reference()
    
    let userID : String = (Auth.auth().currentUser?.uid)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if temp == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelID", for: indexPath) as! LabelTableViewCell
            cell.mainLabel?.text = "Privacy Settings"
            cell.infoLabel?.text = "Control who sees your Profile"
            temp = 1
            return cell
        }
        else if temp == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingID", for: indexPath) as! SettingToggleTableViewCell
            cell.settingLabel?.text = "All"
            
            
            
            let switchView = cell.toggleSetting!
            switchView.setOn(true, animated: true)
            switchView.tag = indexPath.row // for detect which row switch Changed
            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            //cell.accessoryView = switchView
            
            
            
            
            
            
            temp = 2
            return cell
        }
        else if temp == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingID", for: indexPath) as! SettingToggleTableViewCell
            cell.settingLabel?.text = "Mutual Connections"
            temp = 3
            return cell
        }
        else if temp == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingID", for: indexPath) as! SettingToggleTableViewCell
            cell.settingLabel?.text = "Connections Only"
            temp = 4
            return cell
        }
        else if temp == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelID", for: indexPath) as! LabelTableViewCell
            cell.mainLabel?.text = "Notification Settings"
            cell.infoLabel?.text = "Control what Notifications you recieve"
            temp = 5
            return cell
        }
        else if temp == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingID", for: indexPath) as! SettingToggleTableViewCell
            cell.settingLabel?.text = "Connections Requests"
            temp = 6
            return cell
        }
        else if temp == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingID", for: indexPath) as! SettingToggleTableViewCell
            cell.settingLabel?.text = "Messages"
            temp = 7
            return cell
        }
        else if temp == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelID", for: indexPath) as! LabelTableViewCell
            cell.mainLabel?.text = "Close Account"
            cell.infoLabel?.text = "Control who sees your Profile"
            temp = 8
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteID", for: indexPath) as! DeleteAccountTableViewCell
            temp = 0
            return cell
        }
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight(for:indexPath)
    }
    
    private func rowHeight(for indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 7 || indexPath.row == 8{
            return 60
        }
        else{
            return 42
        }
    }

    
    @objc func switchChanged(_ sender : UISwitch!){
        if sender.isOn{
            self.ref.child("users/profile/\(userID)/searchIsPrivate").setValue("False")
        }
        else{
            self.ref.child("users/profile/\(userID)/searchIsPrivate").setValue("True")
        }
        print("table row switch Changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
        print(sender.isOn)
    }
}

//
//  SettingsTableViewController.swift
//  Group18Alpha
//
//  Created by kvaldez on 4/12/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase

class SettingsTableViewController: UITableViewController {
    private var temp:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "logOutSegue", sender: Any?.self)
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
            cell.settingLabel?.text = "Everyone"
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
            cell.settingLabel?.text = "Your Connections"
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
            cell.mainLabel?.text = "Log Out"
            cell.infoLabel?.text = "This option will log you out of your account."
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
